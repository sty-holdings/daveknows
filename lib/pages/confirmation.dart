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
                        L10nApp.accountCreated_5.$,
                        style: theme.textTheme.titleMedium,
                      )),
                  // Padding(
                  //     padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                  //     child: Text(
                  //       L10nApp.accountCreated_2.$,
                  //       style: theme.textTheme.titleMedium,
                  //     )),
                  // const Padding(
                  //     padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                  //     child: Text(
                  //       Constants.LBL_Support_Email,
                  //       style: TextStyle(
                  //           fontSize: 22,
                  //           color: Constants.Sec_Cyan,
                  //           fontWeight: FontWeight.bold),
                  //     )),
                  // Padding(
                  //     padding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
                  //     child: Text(
                  //       L10nApp.accountCreated_3.$,
                  //       style: theme.textTheme.titleMedium,
                  //     )),
                  // Padding(
                  //     padding: const EdgeInsets.fromLTRB(20, 10, 0, 20),
                  //     child: Text(
                  //       L10nApp.accountCreated_4.$,
                  //       style: theme.textTheme.titleMedium,
                  //     )),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     SizedBox(
                  //         width: 300,
                  //         child: Text(
                  //           L10nApp.accountCreated_5.$,
                  //           style: const TextStyle(
                  //               fontSize: 18,
                  //               color: Constants.Sec_Cyan,
                  //               fontWeight: FontWeight.bold),
                  //         )),
                  //   ],
                  // ),
                  // Padding(
                  //     padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                  //     child: Text(
                  //       L10nApp.accountCreated_6.$,
                  //       style: theme.textTheme.titleMedium,
                  //     )),
                ],
              ),
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
