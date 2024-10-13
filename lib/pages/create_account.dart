import 'package:daveknows/models/constants.dart';
import 'package:daveknows/models/locales.dart';
import 'package:flutter/material.dart';
import 'package:daveknows/components/fix_button.dart';
import 'package:daveknows/components/text_field.dart';
import 'package:daveknows/widgets/base_widget.dart';

import '../models/dk_user_profile.dart';

class CreateAccountPage extends BaseWidget {
  final formKey = GlobalKey<FormState>();
  final firstNameKey = GlobalKey<FormFieldState>();
  final lastNameKey = GlobalKey<FormFieldState>();
  final companyKey = GlobalKey<FormFieldState>();

  CreateAccountPage(super.provider) : super(isWhitelist: true);

  DKUserProfile dkUserProfile = DKUserProfile();

  @override
  Widget buildUI(BuildContext context, ThemeData theme) {
    return Form(
        key: formKey,
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    L10nApp.marketingSlogan.$,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 22, color: Constants.Sec_Cyan, fontWeight: FontWeight.bold),
                  )),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  L10nApp.createAccountTitle_1.$,
                  style: theme.textTheme.displayLarge,
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 20),
              Row(children: [
                const SizedBox(width: 20),
                Text(
                  L10nApp.allRequired.$,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
              ]),
              TextFieldComponent(
                key: firstNameKey,
                labelText: L10nApp.firstName.$,
              ),
              TextFieldComponent(
                key: lastNameKey,
                labelText: L10nApp.lastName.$,
              ),
              const SizedBox(height: 15),
              TextFieldComponent(
                key: companyKey,
                labelText: L10nApp.company.$,
              ),
              const SizedBox(height: 50),
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Column(children: [
                      FixButton(
                        L10nApp.nextPage.$,
                        icon: Icons.arrow_forward_outlined,
                        onPressed: () async {
                          await onSubmitted();
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(Constants.Sec_Purple),
                        ),
                        setTextColor: Colors.white,
                      ),
                    ]),
            ],
          ),
        ));
  }

  Future<void> onSubmitted() async {
    if (formKey.currentState!.validate()) {
      loadingSpinningWheel(true); // This is here so the displaying of errors is not blocked.
      if (getValue(firstNameKey) == '') {
        popupError(L10nApp.firstNameRequired.$);
        loadingSpinningWheel(false);
        return;
      }
      if (getValue(lastNameKey) == '') {
        popupError(L10nApp.lastNameRequired.$);
        loadingSpinningWheel(false);
        return;
      }
      if (getValue(companyKey) == '') {
        popupError(L10nApp.companyRequired.$);
        loadingSpinningWheel(false);
        return;
      }
      dkUserProfile.firstName =  getValue(firstNameKey);
      dkUserProfile.lastName = getValue(lastNameKey);
      dkUserProfile.companyName = getValue(companyKey);
      loadingSpinningWheel(false);
      goNext(Constants.NAV_CREATE_ACCOUNT_SECURITY);
    }
  }
}
