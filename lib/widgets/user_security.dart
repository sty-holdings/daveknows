import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:daveknows/components/fix_button.dart';
import 'package:daveknows/components/service.dart';
import 'package:daveknows/models/constants.dart';
import 'package:daveknows/models/locales.dart';
import 'package:daveknows/widgets/base_widget.dart';

import '../components/password_field.dart';

class UserSecurityWidget extends BaseWidget {
  final formKey = GlobalKey<FormState>();
  final currentPasswordKey = GlobalKey<FormFieldState>();
  final passwordKey = GlobalKey<FormFieldState>();
  final confirmPasswordKey = GlobalKey<FormFieldState>();
  FocusNode myFocusNode = FocusNode();
  bool isVerifyEnabled = true;

  UserSecurityWidget(super.provider);

  @override
  Widget buildUI(BuildContext context, ThemeData theme) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return Form(
      key: formKey,
      child: Center(
        child: Column(
          children: <Widget>[
            pageHeading(
                '${sharedModel.profile.firstName}${L10nApp.titleUserSecurity}'),
            const SizedBox(height: 20),
            ...buildCurrentPassword(),
            if (!isVerifyEnabled) ...buildChangePassword(theme),
          ],
        ),
      ),
    );
  }

  List<Widget> buildCurrentPassword() {
    List<Widget> widgets = [];
    widgets.add(Row(children: [
      const SizedBox(width: 20),
      Text(
        L10nApp.allRequired.$,
        textAlign: TextAlign.left,
        style: const TextStyle(
          color: Colors.red,
          fontSize: 16,
        ),
      ),
    ]));
    widgets.add(const SizedBox(height: 10));
    widgets.add(PasswordField(
      key: currentPasswordKey,
      labelText: L10nApp.currentPassword.$,
      hintText: L10nApp.currentPasswordHint.$,
    ));
    widgets.add(
      isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(children: [
              FixButton(
                L10nApp.verifyPassword.$,
                onPressed: isVerifyEnabled ? onVerify : null,
              ),
            ]),
    );
    return widgets;
  }

  Future<void> onVerify([String? value]) async {
    if (formKey.currentState!.validate()) {
      loadingSpinningWheel(true);
      try {
        final session = await sharedModel.loginService
            .login(sharedModel.savedUserName, getValue(currentPasswordKey));
        isVerifyEnabled = false;
      } catch (ex) {
        if (ex.toString().contains(Constants.AWS_ERR_USER_NOT_CONFIRMED)) {
          popupError(Constants.ERR_USER_NOT_CONFIRMED);
        } else {
          popupError(sharedModel.getError(ex));
        }
      }
      loadingSpinningWheel(false);
    }
  }

  List<Widget> buildChangePassword(ThemeData theme) {
    List<Widget> widgets = [];
    widgets.add(const SizedBox(
      height: 40,
    ));
    widgets.add(
      isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(children: [
              FixButton(
                L10nApp.changePassword.$,
                icon: Icons.change_circle_outlined,
                onPressed: () async {
                  await onChangePassword();
                },
              ),
            ]),
    );
    return widgets;
  }

  Future<void> onChangePassword() async {
    if (formKey.currentState!.validate()) {
      loadingSpinningWheel(true);
      try {
        final response = await DKService.httpRequest(
            Constants.httpResetPassword, {'email': sharedModel.profile.email});
        goNext(Constants.NAV_CONFIRMATION, {
          'key': Constants.httpResetPassword,
          'username': sharedModel.savedUserName
        });
      } catch (ex) {
        popupError(sharedModel.getError(ex));
      }
      loadingSpinningWheel(false);
    }
  }
}
