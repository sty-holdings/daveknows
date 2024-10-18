import 'package:flutter/material.dart';
import 'package:framework/base_navigator.dart';
import 'package:framework/base_widget.dart';
import 'package:framework/provider.dart';
import 'package:daveknows/pages/confirmation.dart';
import 'package:daveknows/pages/create_account.dart';
import 'package:daveknows/pages/intro.dart';
import 'package:daveknows/widgets/login_help.dart';
import '../models/constants.dart';
import '../models/dk_user_profile.dart';
import '../pages/create_account_security.dart';
import '../pages/home.dart';
import '../pages/login.dart';
import '../widgets/not_found.dart';
import '../widgets/system_info.dart';

class DKNavigator extends BaseNavigator {
  late final DKUserProfile _userProfile;

  @override
  BaseWidgetState createWidget(RouteSettings settings, Provider provider) {
    switch (settings.name) {
      case Constants.NAV_CONFIRMATION:
        return ConfirmationPage(provider);
      case Constants.NAV_CREATE_ACCOUNT:
        return CreateAccountPage(provider);
      case Constants.NAV_CREATE_ACCOUNT_SECURITY:
        return CreateAccountSecurityPage(provider);
      case Constants.NAV_LOGIN_HELP:
        return LoginHelpWidget(provider);
      // case Constants.NAV_HOME:
      //   return HomePage(provider, _userProfile);
      case Constants.NAV_INTRO:
        return IntroPage(provider);
      case Constants.NAV_LOGIN:
        return LoginPage(provider);
      case Constants.NAV_SYSTEM_INFO:
        return SystemInfoWidget(provider);
      default:
        return NotFoundWidget(provider);
    }
  }

  @override
  BaseWidgetState landingPage(RouteSettings settings, Provider provider) => LoginPage(provider);
}
