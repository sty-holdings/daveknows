import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:daveknows/components/fix_button.dart';
import 'package:daveknows/models/constants.dart';
import 'package:daveknows/models/locales.dart';
import 'package:daveknows/widgets/base_widget.dart';

import '../components/text_field.dart';

class ConfirmationPage extends BaseWidget {
  final formKey = GlobalKey<FormState>();
  final codeKey = GlobalKey<FormFieldState>();

  ConfirmationPage(super.provider) : super(isWhitelist: true);

  @override
  Widget buildUI(BuildContext context, ThemeData theme) {
    return Form(
      key: formKey,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
                  TextFieldComponent(
                    key: codeKey,
                    labelText: L10nApp.code.$,
                    hintText: L10nApp.codeHint.$,
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: FixButton(
                L10nApp.verifyConfirmationCode.$,
                onPressed: () async {
                  onSubmitted();
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Constants.Sec_Purple),
                ),
                setTextColor: Colors.white,
              ),
            ),
          ]),
    );
  }

  Future<void> onSubmitted() async {
    if (formKey.currentState!.validate()) {
      loadingSpinningWheel(true);
      try {
          final result = await sharedModel.loginService.submitConfirmationCode(getValue(codeKey), getEmail());
          if (result == Constants.STATUS_SUCCESS) {
            goNext(Constants.NAV_LOGIN);
            loadingSpinningWheel(false);
            return;
          } else {
            showAlert(Constants.ERR_USER_INVALID_CONFIRMATION_CODE);
          }
      } catch (ex) {
        log(ex.toString());
        popupError(sharedModel.getError(ex));
      }
      loadingSpinningWheel(false);
    }
  }
}
