// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:daveknows/index.dart';

import 'environment.dart';

class Constants {
  static late Environment env;
  static const LOCAL_ENV = 'local';
  static const DEVELOPMENT_ENV = 'development';
  static const DEMONSTRATION_ENV = 'demonstration';
  static const PRODUCTION_ENV = 'production';

  // Error Messages
  // App - This is returned to the user
  static const ERR_USER_NOT_CONFIRMED =
      'DaveKnows has sent you an email to confirm your account. \nPlease click on the link in the email or click on "Need Help" and "Resend Confirmation".';
  static const ERR_USER_ALREADY_EXISTS =
      'This email already exists. You can reset your password or contact the helpdesk at helpdesk@daveknows.ai.';
  static const ERR_USER_INVALID_CONFIRMATION_CODE =
      'The code you enter is invalid. Please try again.';

  // AWS - Is an error returned from AWS
  static const AWS_ERR_USER_NOT_CONFIRMED = 'UserNotConfirmedException';
  static const AWS_ERR_USERNAME_EXISTS = 'UsernameExistsException';

  // Server - is an error returned from the DaveKnows Server or the DaveKnows Http service
  static const DK_ERR_INFORMATION_NOT_FOUND = 'The needed information was not found.';
  static const DK_ERR_REQUESTER_ID_MISSING =
      '[ERROR] The requester id is missing.';

  // labels
  static const LBL_Account_Details = 'Account Details';
  static const LBL_Alert = 'Alert!';
  static const LBL_Amount = 'Amount';
  static const LBL_Area_Code = 'Area Code';
  static const LBL_Balance = 'Balance';
  static const LBL_Backend_Settings = 'Backend Settings';
  static const LBL_Close_Account = 'Close Account';
  static const LBL_Coming_Soon = 'Coming Soon';
  static const LBL_Coming_Soon_2lines = 'Coming \nSoon';
  static const LBL_Data_Protection_Policy = 'View Data Protection Policy';
  static const LBL_Date = 'Date';
  static const LBL_Date_YMD_Format = '(Y/M/D)';
  static const LBL_Date_MDY_Format = '(M/D/Y)';
  static const LBL_Days = 'day(s)';
  static const LBL_Description = 'Description';
  static const LBL_Email = 'Email';
  static const LBL_Environment = 'Environment:';
  static const LBL_History = 'History';
  static const LBL_Home = 'Home';
  static const LBL_HTTP_Settings = 'HTTP Settings';
  static const LBL_Insights = 'Insights';
  static const LBL_Logout = 'Logout';
  static const LBL_Message_Prefix = 'Message Prefix:';
  static const LBL_Months = 'month(s)';
  static const LBL_Months_Abbr = 'mos';
  static const LBL_My_Badges = 'My Badges';
  static const LBL_No = 'No';
  static const LBL_Nothing_ToDo = 'Nothing to do right now.';
  static const LBL_Not_Available = 'Not Available';
  static const LBL_Notifications = 'Notifications';
  static const LBL_Ok = 'OK';
  static const LBL_On_Boarding = 'On-Boarding Checklist';
  static const LBL_On_Boarding_Profile = 'Update your profile information';
  static const LBL_On_Boarding_Call = 'Accept invite to introduction call';
  static const LBL_Pending = 'Pending';
  static const LBL_Phone = 'Phone';
  static const LBL_Phone_Number = 'Phone Number';
  static const LBL_Privacy_Policy = 'View Privacy Policy';
  static const LBL_Profile = 'Profile';
  static const LBL_Security = 'Password & Security';
  static const LBL_Secured = 'Secured:';
  static const LBL_Settings = 'Settings';
  static const LBL_SMS_Text = 'SMS/Text';
  static const LBL_State = 'State:';
  static const LBL_Status = 'Status';
  static const LBL_Stripe = 'Stripe';
  static const LBL_System_info = 'System Details';
  static const LBL_Support_Email = 'support@sty-holdings.com';
  static const LBL_Helpdesk_Email = 'helpdesk@daveknows.ai';
  static const LBL_Telegram = 'Telegram';
  static const LBL_ToDo_list = 'Your To Do List';
  static const LBL_Type = 'Type';
  static const LBL_Verification_Email = 'support@sty-holdings.com';
  static const LBL_Version = 'Version:';
  static const LBL_Yes = "Yes";

  // Slogans
  static const SLOGAN = 'Marketing Slogan';

  // General
  static const EMPTY = '';
  static const MISSING = 'missing';
  static const TRUE = 'true';
  static const FALSE = 'false';

  // Navigation
  static const NAV_CONFIRMATION = '/confirmation';
  static const NAV_CREATE_ACCOUNT = '/createAccount';
  static const NAV_CREATE_ACCOUNT_SECURITY = '/createAccountSecurity';
  static const NAV_LOGIN_HELP = '/loginHelp';
  static const NAV_HISTORY = '/history';
  static const NAV_HOME = '/home';
  static const NAV_INTRO = '/intro';
  static const NAV_LOGIN = '/login';
  static const NAV_SYSTEM_INFO = '/systemInfo';
  static const NAV_USER_PROFILE = '/userProfile';
  static const NAV_USER_PROFILE_CONTACT = '/userProfileContact';
  static const NAV_USER_PROFILE_ADDRESS = '/userProfileAddress';
  static const NAV_USER_SECURITY = '/userSecurity';
  static const NAV_USER_SETTINGS = '/userSettings';

  // Status
  static const STATUS_COMPLETED = 'COMPLETED';
  static const STATUS_CONFIRMED = 'CONFIRMED';
  static const STATUS_FAILED = 'FAILED';
  static const STATUS_LINKED = 'LINKED';
  static const STATUS_SUCCESS = 'SUCCESS';
  static const STATUS_PENDING = 'PENDING';
  static const STATUS_ACTIVE = 'ACTIVE';
  static const STATUS_INACTIVE = 'INACTIVE';

  // messages
  static const natsCustomerTransfer = 'customerTransfer';
  static const natsGetAllBundles = 'getAllBundles';
  static const natsGetBackendInfo = 'getBackendInfo';
  static const natsGetInstitutionInfo = 'getInstitutionInfo';
  static const natsGetInstitutionList = 'listInstitutions';
  static const natsGetLinkToken = 'plaidGetLinkToken';
  static const natsGetToDoList = 'getToDoList';
  static const natsGetUserBundles = 'getUserBundles';
  static const natsGetUserProfile = 'getUserProfile';
  static const natsGetUserRegister = 'getUserRegister';
  static const natsInstitutionAccountNameList = 'listInstitutionAccountNames';
  static const natsPushLinkAndCreateCustomer = 'pushLinkAndCreateCustomer';
  static const natsSetFederalTaxId = 'setFederalTaxId';
  static const natsUpdateUserProfile = 'updateUserProfile';

  // Http messages
  static const httpCreateUser = '/pulluser';
  static const httpForgotUsername = '/forgotusername';
  static const httpResetPassword = '/resetuserpassword';
  static const httpResendVerifyEmail = '/resendverifyemail';

  // Local storage
  static const dkLocalStorage = 'dkLocalStorage';
  static const skipWelcomePage = 'skipWelcomePage';

  //assets
  static const INTRO_PATH = 'assets/images/intro_page.png';
  static const NEW_LOGO_PATH = 'assets/images/Logo-100x100.png';
  static const Widget defaultAvatar = Icon(Icons.person, size: 80);

  // Styles
  static const _borderRadius = BorderRadius.all(Radius.circular(8.0));
  static const _borderSide = BorderSide(color: Color(0x8A000000), width: 1);
  static const borderDecoration = BoxDecoration(
      borderRadius: _borderRadius, border: Border.fromBorderSide(_borderSide));
  static const currencySymbol = '\$';
  static const percentageSymbol = '%';
  static const linkSide = TextStyle(color: Colors.blue, fontSize: 20);
  static const maxWidth = 450.0;
  static const numberFormat = TextInputType.numberWithOptions(decimal: true);

  static final currency = NumberFormat.currency(
      locale: 'en_US', symbol: currencySymbol, decimalDigits: 2);
  static final percentage =
      NumberFormat.decimalPercentPattern(locale: 'en_US', decimalDigits: 2);
  static final hundredsNumber = NumberFormat("###", 'en_US');
  static final thousandsNumber = NumberFormat("###,###", 'en_US');
  static final millionsNumber = NumberFormat("###,###,###", 'en_US');
  static final filterDateFormat =
      FilteringTextInputFormatter.allow(RegExp('[0-9/]'));
  static final filterDigitsOnlyFormat = FilteringTextInputFormatter.digitsOnly;
  static final filterNumberFormat =
      FilteringTextInputFormatter.allow(RegExp('[0-9.,]'));

  // Styles - Light Mode / Dark Mode
  static const LM_borderDecoration = BoxDecoration(
      borderRadius: _borderRadius, border: Border.fromBorderSide(_borderSide));
  static const LM_dividerLine = Divider(
      color: Constants.Pri_PurpleDeep,
      height: 25,
      thickness: 2,
      indent: 5,
      endIndent: 5);
  static const LM_listTileVeryStrongText = TextStyle(
      fontSize: 22, fontWeight: FontWeight.w800, color: Colors.black87);
  static const LM_listTileStrongText = TextStyle(
      fontSize: 22, fontWeight: FontWeight.w400, color: Colors.black87);
  static const LM_listTileLargeText =
      TextStyle(fontSize: 20, color: Constants.Pri_PurpleDeep);
  static const LM_listTileText =
      TextStyle(fontSize: 18, color: Constants.Pri_PurpleDeep);

  //
  static const DM_borderDecoration = BoxDecoration(
      borderRadius: _borderRadius, border: Border.fromBorderSide(_borderSide));
  static const DM_dividerLine = Divider(
      color: Constants.Pri_PurpleDeep,
      height: 25,
      thickness: 2,
      indent: 5,
      endIndent: 5);
  static const DM_listTileStrongText = TextStyle(
      fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black87);
  static const DM_listTileText =
      TextStyle(fontSize: 18, color: Constants.Pri_PurpleDeep);

  // Colors Usage - Light Mode / Dark Mode
  static const alternativeBackgroundColor = Color(0xFF003E5C);

  // Colors (Primary)
  static const Pri_PurpleDeep = Color(0xFF15092F);
  static const Pri_Gradient_Start = Color(0xFF19FFFD);
  static const Pri_Gradient_End = Color(0xFF9B7FED);

  // Colors (Secondary)
  static const Sec_PurpleSuperDeep = Color(0xFF100725);
  static const Sec_Gray = Color(0xFFE5E5E5);
  static const Sec_Cyan = Color(0xFF14CCCA);
  static const Sec_Purple = Color(0XFF7C65BD);

  // Colors (Accent)
  static const Acc_Purple = Color(0xFF6969FF);
  static const Acc_Yellow = Color(0xFFFFEF2E);
  static const Acc_Green = Color(0xFF00FF91);

  // themes
  static final customTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: Pri_PurpleDeep, //button background color
        onPrimary: Colors.white, //button foreground color
      ),
      primaryColor: Pri_PurpleDeep,
      scaffoldBackgroundColor: Colors.white,
      secondaryHeaderColor: const Color(0xFFFF6F30),
      disabledColor: Colors.black45,
      hintColor: Colors.black54,
      fontFamily: 'Roboto',
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black87),
        //headline1
        displayMedium: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black87),
        //headline1
        displaySmall: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
        //headline2
        headlineLarge: TextStyle(
            fontSize: 24, fontWeight: FontWeight.w400, color: Colors.black87),
        //headline3
        headlineMedium: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black87),
        //headline3
        headlineSmall: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
        //headline4
        titleLarge: TextStyle(
            fontSize: 24, fontWeight: FontWeight.w400, color: Colors.black87),
        //headline5
        titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        // subtitle1:
        titleSmall: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
        //headline6
        labelSmall: TextStyle(color: Colors.red), //button
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        //background
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
            borderRadius: _borderRadius, borderSide: _borderSide),
        //custom border (showCupertinoModalPopup)
        labelStyle: TextStyle(color: Sec_Purple, fontSize: 18.0),
        /*focusedBorder: OutlineInputBorder(
          borderRadius: _borderRadius,
          borderSide: BorderSide(strokeAlign: StrokeAlign.outside, color: _secondaryBackgroundColor, width: 2.0),
        ),*/
      ),
      sliderTheme: const SliderThemeData(
        trackHeight: 4.0,
        thumbColor: Sec_Purple,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: const Color(0xFF052955),
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 20))));
}
