import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:daveknows/components/fix_button.dart';
import 'package:daveknows/components/password_field.dart';
import 'package:daveknows/models/constants.dart';
import 'package:daveknows/models/locales.dart';
import 'package:daveknows/widgets/base_widget.dart';

import '../components/text_field.dart';

class ConfirmationPage extends BaseWidget {
  final formKey = GlobalKey<FormState>();
  final codeKey = GlobalKey<FormFieldState>();
  final passKey = GlobalKey<FormFieldState>();
  final rePassKey = GlobalKey<FormFieldState>();

  final dynamic args;

  ConfirmationPage(super.provider, this.args) : super(isWhitelist: true);

  @override
  Widget buildUI(BuildContext context, ThemeData theme) {
    return Form(
      key: formKey,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (args?['key'] == Constants.httpCreateUser)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        L10nApp.accountCreated_1.$,
                        style: theme.textTheme.titleMedium,
                      )),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                      child: Text(
                        L10nApp.accountCreated_2.$,
                        style: theme.textTheme.titleMedium,
                      )),
                  const Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                      child: Text(
                        Constants.LBL_Support_Email,
                        style: TextStyle(
                            fontSize: 22,
                            color: Constants.Sec_Cyan,
                            fontWeight: FontWeight.bold),
                      )),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
                      child: Text(
                        L10nApp.accountCreated_3.$,
                        style: theme.textTheme.titleMedium,
                      )),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 20),
                      child: Text(
                        L10nApp.accountCreated_4.$,
                        style: theme.textTheme.titleMedium,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 300,
                          child: Text(
                            L10nApp.accountCreated_5.$,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Constants.Sec_Cyan,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                      child: Text(
                        L10nApp.accountCreated_6.$,
                        style: theme.textTheme.titleMedium,
                      )),
                ],
              ),
            if (args?['key'] == Constants.httpForgotUsername)
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      L10nApp.displayUsername.$,
                      style: theme.textTheme.titleMedium,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      args!['username'],
                      style: theme.textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            if (args?['key'] == Constants.httpResendVerifyEmail)
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  L10nApp.checkEmail.$,
                  style: theme.textTheme.titleMedium,
                ),
              ),
            if (args?['key'] == Constants.httpResetPassword)
              Column(children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      L10nApp.passwordSent.$,
                      style: theme.textTheme.titleMedium,
                    )),
                TextFieldComponent(
                  key: codeKey,
                  labelText: L10nApp.code.$,
                  hintText: L10nApp.codeHint.$,
                  keyboardType: TextInputType.number,
                ),
                PasswordField(key: passKey),
                PasswordField(
                  key: rePassKey,
                  labelText: L10nApp.confirmPassword.$,
                  hintText: L10nApp.confirmPasswordHint.$,
                ),
                isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : FixButton(
                        L10nApp.submit.$,
                        icon: Icons.account_circle,
                        onPressed: () async {
                          await onSubmitted(args['username']);
                        },
                      )
              ]),
            Padding(
              padding: const EdgeInsets.all(20),
              child: FixButton(
                L10nApp.returnToLogin.$,
                icon: Icons.arrow_back_sharp,
                onPressed: () async {
                  goNext(Constants.NAV_LOGIN);
                },
              ),
            ),
          ]),
    );
  }

  Future<void> onSubmitted(String? username) async {
    if (username == null) {
      log('Username is missing');
      popupError(L10nApp.internalError.$);
      return;
    }
    if (formKey.currentState!.validate()) {
      if (getValue(passKey) != getValue(rePassKey)) {
        popupError(L10nApp.passwordsNoMatch.$);
        return;
      }
      loadingSpinningWheel(true);
      try {
        final changed = await sharedModel.loginService
            .resetPassword(username, getValue(codeKey), getValue(passKey));
        if (changed) {
          goNext(Constants.NAV_LOGIN);
          popupInfo(L10nApp.passwordChanged.$);
        } else {
          popupError(L10nApp.passwordNoChanged.$);
        }
      } catch (ex) {
        popupError(sharedModel.getError(ex));
      }
      loadingSpinningWheel(false);
    }
  }
}
