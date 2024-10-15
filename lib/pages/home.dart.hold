import 'package:daveknows/models/dk_user_profile.dart';
import 'package:flutter/services.dart';
import 'package:daveknows/index.dart';
import 'package:flutter/material.dart';
import 'package:daveknows/models/constants.dart';
import 'package:daveknows/models/locales.dart';
import 'package:daveknows/widgets/base_widget.dart';


class HomePage extends BaseWidget {
  final DKUserProfile _userProfile;
  final formKey = GlobalKey<FormState>();
  final fnKey = GlobalKey<FormFieldState>();
  final lnKey = GlobalKey<FormFieldState>();
  final emailKey = GlobalKey<FormFieldState>();
  final passKey = GlobalKey<FormFieldState>();
  final rePassKey = GlobalKey<FormFieldState>();
  final formatter = NumberFormat.currency(symbol: Constants.currencySymbol, decimalDigits: 2);

  HomePage(super.provider, this._userProfile);

  @override
  Widget buildUI(BuildContext context, ThemeData theme) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return Center(
        child: Column(
          children: <Widget>[
            pageHeading('${L10nApp.titleHello} ${_userProfile.firstName}'),
            const SizedBox(height: 10),
            // User Info
            Container(
              margin: const EdgeInsets.all(10),
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: const Offset(5, 5), // changes position of shadow
                  ),
              ]),
            ),
          ],
        ));
  }
}

