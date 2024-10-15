import 'package:daveknows/models/constants.dart';
import 'package:daveknows/models/locales.dart';
import 'package:flutter/material.dart';
import 'package:daveknows/components/fix_button.dart';
import 'package:daveknows/components/password_field.dart';
import 'package:daveknows/widgets/base_widget.dart';

import '../components/DKAWService.dart';
import '../components/email_field.dart';
import '../models/dk_user_profile.dart';

class CreateAccountSecurityPage extends BaseWidget {
  final formKey = GlobalKey<FormState>();
  final emailKey = GlobalKey<FormFieldState>();
  final passwordKey = GlobalKey<FormFieldState>();
  final confirmPasswordKey = GlobalKey<FormFieldState>();
  final stateKey = GlobalKey<FormFieldState>();

  CreateAccountSecurityPage(super.provider) : super(isWhitelist: true);

  @override
  Widget buildUI(BuildContext context, ThemeData theme) {
    return Form(
        key: formKey,
        child: Center(
          child: Column(
            children: <Widget>[
              ...buildPageHeader(theme),
              EmailField(key: emailKey),
              const SizedBox(height: 20),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 18),
                    child: Text(
                      L10nApp.passwordRecommendation.$,
                    ),
                  )),
              const SizedBox(height: 10),
              PasswordField(key: passwordKey),
              PasswordField(
                key: confirmPasswordKey,
                labelText: L10nApp.confirmPassword.$,
                hintText: L10nApp.confirmPasswordHint.$,
              ),
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Column(children: [
                      FixButton(
                        L10nApp.createAccount.$,
                        icon: Icons.account_circle,
                        onPressed: () async {
                          await onSubmitted();
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(Constants.Sec_Purple),
                        ),
                        setTextColor: Colors.white,
                      ),
                    ]),
            ],
          ),
        ));
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
          L10nApp.createAccountTitle_3.$,
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

  Future<void> onSubmitted() async {
    if (formKey.currentState!.validate()) {
      loadingSpinningWheel(true); // This is here so the displaying of errors is not blocked.
      if (getValue(passwordKey) != getValue(confirmPasswordKey)) {
        popupError(L10nApp.passwordsNoMatch.$);
        loadingSpinningWheel(false);
        return;
      }
      dkSharedModel.dkUserProfile.email =  getValue(emailKey);
      final result = dkSharedModel.dkAWSService.signUpUser(username: getValue(emailKey), password: getValue(passwordKey), email: getValue(emailKey), firstName: dkSharedModel.dkUserProfile.firstName, lastName: dkSharedModel.dkUserProfile.lastName, companyName: dkSharedModel.dkUserProfile.companyName);
      loadingSpinningWheel(false);
      if (result == Constants.STATUS_SUCCESS) {
        goNext(Constants.NAV_CONFIRMATION);
        return;
      }
      if (result == Constants.AWS_ERR_USERNAME_EXISTS) {
        showAlert(Constants.ERR_USER_ALREADY_EXISTS);
        return;
      }
      showAlert(result as String);
    }
  }
}
