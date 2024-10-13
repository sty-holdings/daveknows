import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:daveknows/components/email_field.dart';
import 'package:daveknows/components/fix_button.dart';
import 'package:daveknows/components/service.dart';
import 'package:daveknows/models/constants.dart';
import 'package:daveknows/models/locales.dart';
import 'package:daveknows/widgets/base_widget.dart';

class LoginHelpWidget extends BaseWidget {
  final formKey = GlobalKey<FormState>();
  final emailKey = GlobalKey<FormFieldState>();

  LoginHelpWidget(super.provider) : super(isWhitelist: true);

  @override
  Widget buildUI(BuildContext context, ThemeData theme) {
    return Form(
      key: formKey,
      child: Center(
        widthFactor: double.infinity,
        child: Column(children: <Widget>[
          const SizedBox(
            height: 40,
          ),
          EmailField(key: emailKey),
          FixButton(
            L10nApp.forgotUsername.$,
            icon: Icons.verified_user,
            onPressed: () {
              onSubmit(Constants.httpForgotUsername);
            },
          ),
          FixButton(
            L10nApp.forgotPassword.$,
            icon: Icons.send,
            onPressed: () {
              onSubmit(Constants.httpResetPassword);
            },
          ),
          FixButton(
            L10nApp.resendConfirmation.$,
            icon: Icons.send,
            onPressed: () async {
              onSubmit(Constants.httpResendVerifyEmail);
            },
          ),
          const SizedBox(height: 20),
          FixButton(
            L10nApp.returnToLogin.$,
            icon: Icons.arrow_back_sharp,
            onPressed: () async {
              goNext(Constants.NAV_LOGIN);
            },
          ),
        ]),
      ),
    );
  }

  Future<void> onSubmit(String apiName) async {
    if (emailKey.currentState!.validate()) {
      loadingSpinningWheel(true);
      try {
        final response = await DKService.httpRequest(apiName, {'email': getValue(emailKey)});
        if (apiName == Constants.httpForgotUsername || apiName == Constants.httpResetPassword) {
          Map<String, dynamic> responseMap = jsonDecode(response?['data']);
          goNext(Constants.NAV_CONFIRMATION, {'key': apiName, 'username': responseMap['username']});
        } else {
          goNext(Constants.NAV_CONFIRMATION, {'key': apiName, 'email': getValue(emailKey)});
        }
      } catch (ex) {
        // popupError(sharedModel.getError(ex));
      }
      loadingSpinningWheel(false);
    }
  }
}
