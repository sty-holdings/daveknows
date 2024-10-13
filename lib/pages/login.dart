import 'package:flutter/material.dart';
import 'package:daveknows/components/fix_button.dart';
import 'package:daveknows/components/password_field.dart';
import 'package:daveknows/models/constants.dart';
import 'package:daveknows/models/locales.dart';
import 'package:daveknows/widgets/base_widget.dart';

import 'package:daveknows/components/dk_aws_service.dart';
import 'package:daveknows/components/email_field.dart';

class LoginPage extends BaseWidget {
  final formKey = GlobalKey<FormState>();
  final emailKey = GlobalKey<FormFieldState>();
  final passwordKey = GlobalKey<FormFieldState>();
  final passFocus = FocusNode();

  LoginPage(super.provider) : super(isWhitelist: true) {
    sharedModel.isAuthorized = false;
  }

  @override
  Widget buildUI(BuildContext context, ThemeData theme) {
    return Form(
      key: formKey,
      child: Center(
        child: Column(
          children: <Widget>[
            ...buildPageHeader(theme),
            EmailField(key: emailKey),
            const SizedBox(height: 10),
            PasswordField(
              key: passwordKey,
              focusNode: passFocus,
              onSubmitted: (value) async {
                final result = await DKAWSService()
                    .signInUser(getValue(emailKey), getValue(passwordKey));
                // Handle the result
              },
            ),
            const SizedBox(height: 10),
            Column(children: [
              FixButton(
                L10nApp.login.$,
                icon: Icons.login,
                onPressed: onLogin,
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all(Constants.Sec_Purple),
                ),
                setTextColor: Colors.white,
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
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all(Constants.Sec_Purple),
                ),
                setTextColor: Colors.white,
              ),
              const SizedBox(height: 40),
            ]),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: GestureDetector(
                  child: Text(L10nApp.needHelp.$,
                      style: const TextStyle(
                          color: Constants.Sec_Purple,
                          fontSize: 22,
                          fontWeight: FontWeight.w600)),
                  onTap: () => goNext(Constants.NAV_LOGIN_HELP)),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildPageHeader(ThemeData theme) {
    List<Widget> widgets = [];
    widgets.add(Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          L10nApp.marketingSlogan.$,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 22,
              color: Constants.Sec_Cyan,
              fontWeight: FontWeight.bold),
        )));
    widgets.add(
      Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          L10nApp.login.$,
          style: theme.textTheme.headlineLarge,
        ),
      ),
    );
    widgets.add(const SizedBox(height: 20));
    widgets.add(Row(children: [
      const SizedBox(width: 40),
      Text(
        L10nApp.allRequired.$,
        textAlign: TextAlign.left,
        style: const TextStyle(
          color: Colors.red,
          fontSize: 16,
        ),
      ),
    ]));
    return widgets;
  }

  Future<void> onLogin([String? value]) async {
    if (formKey.currentState!.validate()) {
      loadingSpinningWheel(true);
      try {
        final session = await dkSharedModel.dkAWSService
            .signInUser(getValue(emailKey), getValue(passwordKey));
        if (session == Constants.STATUS_SUCCESS) {
          var userAttributes = DKAWSService().getUserAttributes();

          final env = Constants.env;
          //
          // final ssm = AwsSSM(env.region, env.userPoolId, env.identityPoolId);
          //
          // final params = await ssm.getListParams<String>(
          //     session?.getIdToken().getJwtToken(),
          //     env.names); //['dk-{ENV}-nats-host', 'dk-{ENV}-nats-prefix', 'dk-{ENV}-nats-token', 'dk-{ENV}-pk12']

          // final ssm = AwsSSM(env.region, env.userPoolId, env.identityPoolId);
          // final params = await ssm.getListParams<String>(
          //     session?.getIdToken().getJwtToken(), env.names);
          //
          // DKService.connect(params, (status, error) async {
          //   if (error != null) {
          //     log('NetService:ERROR $error');
          //     loadingSpinningWheel(false);
          //   }
          //   if (status == Status.CONNECT) {
          //     log('Connected to NATS: $status');
          //     try {
          //       final token = session?.getAccessToken().getJwtToken();
          //       // final response = await DKService.requestJSON(
          //       //     Constants.natsGetUserProfile, {'requester_id': token});
          //       sharedModel
          //           ..profile.setEmail = 'email';+
          //           .isAuthorized = true) as String?;
          //       sharedModel.savedUserName = getValue(emailKey);
          //       sharedModel.skipWelcomePage = true;
          //       sharedModel.profile.genAvatar();
          //       // sharedModel.toDoList = await fetchToDos();
          //       // fetchInstitutions(); - No Used at this time. Future Feature
          //       fetchBackendInfo();
          //       savePreferences();
          //       goNext(Constants.NAV_HOME);
          //     } catch (ex) {
          //       popupError(sharedModel.getError(ex));
          //     }
          //     loadingSpinningWheel(false);
          //   }
          // });
        } else {
          showAlert('Incorrect username or password!');
        }
      } catch (ex) {
        if (ex.toString().contains(Constants.AWS_ERR_USER_NOT_CONFIRMED)) {
          popupError(Constants.ERR_USER_NOT_CONFIRMED);
        } else {
          // popupError(sharedModel.getError(ex));
        }
        loadingSpinningWheel(false);
      }
    }
  }

// void fetchBackendInfo() async {
//   try {
//     final response = await DKService.requestJSON(
//         Constants.natsGetBackendInfo, {'email': sharedModel.profile.email});
//     //Populate backendSettings
//     if (response['data'] != null) {
//       sharedModel.backendSettings.authenticatorService =
//           response['data']['authenticator_service'];
//       sharedModel.backendSettings.baseURL = response['data']['base_URL'];
//       sharedModel.backendSettings.debugMode = response['data']['debug_mode'];
//       sharedModel.backendSettings.environment =
//           response['data']['environment'];
//       sharedModel.backendSettings.hostname = response['data']['hostname'];
//       sharedModel.backendSettings.logFQN = response['data']['log_fqn'];
//       sharedModel.backendSettings.messagePrefix =
//           response['data']['message_prefix'];
//       sharedModel.backendSettings.pidDirectory =
//           response['data']['pid_directory'];
//       sharedModel.backendSettings.pidFQN = response['data']['pid_fqn'];
//       sharedModel.backendSettings.secured = response['data']['secured'];
//       sharedModel.backendSettings.startTime = response['data']['start_time'];
//       sharedModel.backendSettings.version = response['data']['version'];
//       sharedModel.backendSettings.webAssetURL =
//           response['data']['web_asset_url'];
//       sharedModel.backendSettings.workingDirectory =
//           response['data']['working_directory'];
//     }
//   } catch (ex) {
//     popupError(ex.toString());
//   }
// }
}
