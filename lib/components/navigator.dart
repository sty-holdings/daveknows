import 'package:flutter/material.dart';
import 'package:framework/base_navigator.dart';
import 'package:framework/base_widget.dart';
import 'package:framework/provider.dart';
import 'package:daveknows/pages/confirmation.dart';
import 'package:daveknows/pages/create_account.dart';
import 'package:daveknows/pages/intro.dart';
import 'package:daveknows/widgets/login_help.dart';
import 'package:daveknows/widgets/user_profile.dart';
import '../models/constants.dart';
import '../pages/create_account_security.dart';
import '../pages/home.dart';
import '../widgets/login.dart';
import '../widgets/not_found.dart';
import '../widgets/system_info.dart';
import '../widgets/user_profile_address.dart';
import '../widgets/user_profile_contact.dart';
import '../widgets/user_security.dart';
import '../widgets/user_settings.dart';

class DKNavigator extends BaseNavigator {
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
      case Constants.NAV_HOME:
        return HomePage(provider);
      case Constants.NAV_INTRO:
        return IntroPage(provider);
      case Constants.NAV_LOGIN:
        return LoginWidget(provider);
      case Constants.NAV_SYSTEM_INFO:
        return SystemInfoWidget(provider);
      case Constants.NAV_USER_PROFILE:
        return UserProfileWidget(provider);
      case Constants.NAV_USER_PROFILE_ADDRESS:
        return UserProfileAddressWidget(provider);
      case Constants.NAV_USER_PROFILE_CONTACT:
        return UserProfileContactWidget(provider);
      case Constants.NAV_USER_SECURITY:
        return UserSecurityWidget(provider);
      case Constants.NAV_USER_SETTINGS:
        return UserSettingsWidget(provider);
      default:
        return NotFoundWidget(provider);
    }
  }

  @override
  BaseWidgetState landingPage(RouteSettings settings, Provider provider) => LoginWidget(provider);
}
