import 'dart:developer';
import 'package:aws_ssm/aws_ssm.dart';
import 'package:flutter/material.dart';
import 'package:nats_client/natslite/constants.dart';
import 'package:daveknows/components/fix_button.dart';
import 'package:daveknows/components/password_field.dart';
import 'package:daveknows/components/service.dart';
import 'package:daveknows/components/text_field.dart';
import 'package:daveknows/models/constants.dart';
import 'package:daveknows/models/locales.dart';
import 'package:daveknows/models/todo_item.dart';
import 'package:daveknows/models/user_profile.dart';
import 'package:daveknows/widgets/base_widget.dart';

class LoginWidget extends BaseWidget {
  final formKey = GlobalKey<FormState>();
  final usernameKey = GlobalKey<FormFieldState>();
  final passKey = GlobalKey<FormFieldState>();
  final passFocus = FocusNode();
  List<ToDoItem> toDos = [];

  LoginWidget(super.provider) : super(isWhitelist: true) {
    sharedModel.isAuthorized = false;
  }

  @override
  Widget buildUI(BuildContext context, ThemeData theme) {
    return Form(
      key: formKey,
      child: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(L10nApp.titleLogin.$,
                  style: theme.textTheme.headlineLarge),
            ),
            TextFieldComponent(
              key: usernameKey,
              labelText: L10nApp.userName.$,
              hintText: L10nApp.userNameHint.$,
              initialValue: sharedModel.savedUserName,
              onSubmitted: (_) {
                FocusScope.of(context).requestFocus(passFocus);
              },
              validator: (username) {
                if (username == null ||
                    username.trim().isEmpty ||
                    username.length < 8) {
                  return L10nApp.usernameValidator.$;
                }
                return null;
              },
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 18),
                  child: Text(
                    L10nApp.usernameValidator.$,
                  ),
                )),
            PasswordField(
                key: passKey, focusNode: passFocus, onSubmitted: onLogin),
            Container(
              width: double.infinity,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: GestureDetector(
                  child: Text(L10nApp.needHelp.$, style: Constants.linkSide),
                  onTap: () => goNext(Constants.NAV_LOGIN_HELP)),
            ),
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : Column(children: [
                    FixButton(
                      L10nApp.login.$,
                      icon: Icons.login,
                      onPressed: onLogin,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 28, bottom: 10),
                      child: Text(L10nApp.noAccount.$,
                          style: theme.textTheme.headlineSmall),
                    ),
                    FixButton(
                      L10nApp.signupAccount.$,
                      icon: Icons.manage_accounts,
                      onPressed: () {
                        goNext(Constants.NAV_CREATE_ACCOUNT);
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ]),
          ],
        ),
      ),
    );
  }

  Future<void> onLogin([String? value]) async {
    if (formKey.currentState!.validate()) {
      loadingSpinningWheel(true);
      try {
        final session = await sharedModel.loginService
            .login(getValue(usernameKey), getValue(passKey));
        final env = Constants.env;
        final ssm = AwsSSM(env.region, env.userPoolId, env.identityPoolId);

        final params = await ssm.getListParams<String>(
            session?.getIdToken().getJwtToken(),
            env.names); //['dk-{ENV}-nats-host', 'dk-{ENV}-nats-prefix', 'dk-{ENV}-nats-token', 'dk-{ENV}-pk12']

        DKService.connect(params, (status, error) async {
          if (error != null) {
            log('NetService:ERROR $error');
            loadingSpinningWheel(false);
          }
          if (status == Status.CONNECT) {
            log('Connected to NATS: $status');
            try {
              final token = session?.getAccessToken().getJwtToken();
              final response = await DKService.requestJSON(
                  Constants.natsGetUserProfile, {'requester_id': token});
              sharedModel
                ..profile = UserProfile.fromJson(response['data'], token)
                ..isAuthorized = true;
              sharedModel.savedUserName = getValue(usernameKey);
              sharedModel.skipWelcomePage = true;
              sharedModel.profile.genAvatar();
              sharedModel.toDoList = await fetchToDos();
              // fetchInstitutions(); - No Used at this time. Future Feature
              fetchBackendInfo();
              savePreferences();
              goNext(Constants.NAV_HOME);
            } catch (ex) {
              popupError(sharedModel.getError(ex));
            }
            loadingSpinningWheel(false);
          }
        });
      } catch (ex) {
        if (ex.toString().contains(Constants.AWS_ERR_USER_NOT_CONFIRMED)) {
          popupError(Constants.ERR_USER_NOT_CONFIRMED);
        } else {
          popupError(sharedModel.getError(ex));
        }
        loadingSpinningWheel(false);
      }
    }
  }

  Future<List<ToDoItem>> fetchToDos() async {
    var displayToDo = false;
    final myToDoList = <ToDoItem>[];
    sharedModel.toDoList.clear();
    toDos.clear();
    final response = await DKService.requestJSON(
        Constants.natsGetToDoList, {'requester_id': sharedModel.profile.id});
    if (response['data'] != null) {
      for (final todo in response['data']) {
        if (todo['status'] == Constants.STATUS_PENDING) {
          displayToDo = true;
        } else {
          if (todo['status'] == Constants.STATUS_COMPLETED) {
            final displayDate = DateTime.now().add(const Duration(days: 7));
            final toDoCompleteDate = todo['last_update_date'].substring(0, 10);
            final toDoCompleteDateTime = DateTime.parse(toDoCompleteDate);
            if (toDoCompleteDateTime.isBefore(displayDate)) {
              displayToDo = true;
            }
          }
        }
        if (displayToDo) {
          final myTodo = ToDoItem()
            ..toDoRefId = todo['to_do_ref_id']
            ..description = todo['description']
            ..navigation = todo['navigation']
            ..status = todo['status'];
          myToDoList.add(myTodo);
        }
        displayToDo = false;
      }
    }
    return myToDoList;
  }

  void fetchBackendInfo() async {
    try {
      final response = await DKService.requestJSON(
          Constants.natsGetBackendInfo, {'email': sharedModel.profile.email});
      //Populate backendSettings
      if (response['data'] != null) {
        sharedModel.backendSettings.authenticatorService =
            response['data']['authenticator_service'];
        sharedModel.backendSettings.baseURL = response['data']['base_URL'];
        sharedModel.backendSettings.debugMode = response['data']['debug_mode'];
        sharedModel.backendSettings.environment =
            response['data']['environment'];
        sharedModel.backendSettings.hostname = response['data']['hostname'];
        sharedModel.backendSettings.logFQN = response['data']['log_fqn'];
        sharedModel.backendSettings.messagePrefix =
            response['data']['message_prefix'];
        sharedModel.backendSettings.pidDirectory =
            response['data']['pid_directory'];
        sharedModel.backendSettings.pidFQN = response['data']['pid_fqn'];
        sharedModel.backendSettings.secured = response['data']['secured'];
        sharedModel.backendSettings.startTime = response['data']['start_time'];
        sharedModel.backendSettings.version = response['data']['version'];
        sharedModel.backendSettings.webAssetURL =
            response['data']['web_asset_url'];
        sharedModel.backendSettings.workingDirectory =
            response['data']['working_directory'];
      }
    } catch (ex) {
      popupError(ex.toString());
    }
  }
}
