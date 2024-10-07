import 'dart:developer';

import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:daveknows/models/usa_states.dart';
import 'package:flutter/material.dart';
import 'package:framework/base_widget.dart';
import 'package:daveknows/models/constants.dart';
import 'package:daveknows/models/shared_model.dart';
import 'package:daveknows/widgets/nav_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../models/user_profile.dart';

abstract class BaseWidget extends BaseWidgetState {
  bool isLoading = false;
  bool isPaddingOnKeyboard = true;
  final scrollController = ScrollController();

    List<String> contactMethods = [
    Constants.LBL_Email,
    Constants.LBL_SMS_Text,
    Constants.LBL_Telegram
  ];

  BaseWidget(
    super.provider, {
    super.isWhitelist,
  });

  Widget buildUI(BuildContext context, ThemeData theme);

  @override
  DKSharedModel get sharedModel => provider.sharedModel as DKSharedModel;

  void loadingSpinningWheel(bool val, [bool delay = true]) async {
    setState(() {
      isLoading = val;
    });
    if (val && delay) {
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }

  void showAlert(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(Constants.LBL_Alert),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(Constants.LBL_Ok),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return createPopScope(context);
  }

  Widget createPopScope(BuildContext context) {
    return PopScope(
      canPop: false,
      child: createScaffold(context),
    );
  }

  Widget createScaffold(BuildContext context) {
    if (sharedModel.isAuthorized) {
      if (sharedModel.displaySideNav) {
        // Page with a hamburger menu
        return Scaffold(
          drawer: NavDrawer(sharedModel.profile),
          appBar: AppBar(
              title: const Center(
                  child: Text(Constants.SLOGAN,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black))),
              actions: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: GestureDetector(
                      onTap: () => {
                        Navigator.popAndPushNamed(
                            context, Constants.NAV_USER_SETTINGS)
                      },
                      child: const Icon(
                        Icons.settings_outlined,
                        size: 20,
                      ),
                    )),
              ]),
          body: SafeArea(
            child: createScrollView(context),
          ),
        );
      } else {
        // Pages without a hamburger menu
        return Scaffold(
          appBar: AppBar(
              title: const Text(Constants.SLOGAN),
              leading: BackButton(
                onPressed: () =>
                    {Navigator.popAndPushNamed(context, Constants.NAV_HOME)},
              )),
          body: SafeArea(
            child: createScrollView(context),
          ),
        );
      }
    } else {
      return Scaffold(
        body: SafeArea(
          child: createScrollView(context),
        ),
      );
    }
  }

  Widget createScrollView(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: mainBody(context),
    );
  }

  Widget mainBody(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      children: <Widget>[
        SizedBox(
          child: buildUI(context, theme),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget pageHeading(String heading) {
    final ThemeData theme = Theme.of(context);
    return Container(
      alignment: Alignment.center,
      child: Text(
        heading,
        style: theme.textTheme.headlineLarge,
        textAlign: TextAlign.right,
      ),
    );
  }

  String getValue(GlobalKey<FormFieldState<dynamic>> key) =>
      key.currentState!.value.trim();

  // bool getBoolValue(GlobalKey<FormFieldState<dynamic>> key) => key.currentState!.value;
  bool getBoolValue(GlobalKey<FormFieldState<dynamic>> key) {
    return key.currentState != null
        ? key.currentState!.value
        : false; // Default to false if state is null
  }

  void popupInfo(String message,
      {bool closeLastPopup = false, int timeout = 6000}) {
    _popupMessage(message, Colors.blue, closeLastPopup, timeout);
  }

  void popupError(String message,
      {bool closeLastPopup = false, int timeout = 6000}) {
    log(message);
    _popupMessage(
        message, Theme.of(context).colorScheme.error, closeLastPopup, timeout);
  }

  void _popupMessage(
      String message, Color backgroundColor, bool closeLastPopup, int timeout) {
    if (closeLastPopup) {
      Navigator.of(context).pop();
    }
    popupMessage = Text(message);
    final snackBar = SnackBar(
        content: popupMessage!,
        backgroundColor: backgroundColor,
        duration: Duration(milliseconds: timeout));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> savePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('username', sharedModel.savedUserName);
    prefs.setBool('skipWelcomePage', sharedModel.skipWelcomePage);
  }

  // Widget listStatesDropDown() {
  //   return Container(
  //       decoration: BoxDecoration(
  //         border: Border.all(color: Colors.grey, width: 1.5),
  //         borderRadius: BorderRadius.circular(15.0),
  //         color: Colors.white,
  //       ),
  //       child: Padding(
  //           padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
  //           child: DropdownButton2<String>(
  //             isExpanded: false,
  //             value: selectedStateValue,
  //             items: usaStatesList
  //                 .map((String state) => DropdownMenuItem<String>(
  //               value: state,
  //               child:
  //               Text(state, style: const TextStyle(fontSize: 18.0)),
  //             ))
  //                 .toList(),
  //             onChanged: (String? value) {
  //               // Call your set state function with the selected value
  //               setSelectedState(value!);
  //               // Update the current value in the widget for future builds
  //               setState(() => selectedStateValue = value);
  //             },
  //             dropdownStyleData: DropdownStyleData(
  //               maxHeight: 200,
  //               width: 100,
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(14),
  //               ),
  //               scrollbarTheme: ScrollbarThemeData(
  //                 radius: const Radius.circular(20),
  //                 thickness: MaterialStateProperty.all(16),
  //                 thumbVisibility: MaterialStateProperty.all(true),
  //               ),
  //             ),
  //           )));
  // }

  Widget listStatesDropDown() {
    final usaStates = USAStates();
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1.5),
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        child: DropdownButton2<String>(
          isExpanded: false,
          items: USAStates.getAllStateNamesDropDown(),
          onChanged: (String? value) {
            // Call your set state function with the selected value
            setSelectedState(value!);
          },
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
            ),
            scrollbarTheme: ScrollbarThemeData(
              radius: const Radius.circular(20),
              thickness: MaterialStateProperty.all(16),
              thumbVisibility: MaterialStateProperty.all(true),
            ),
          ),
        ),
      ),
    );
  }

// Gets
  String getAreaCode() {
    return sharedModel.profile.areaCode as String;
  }

  String getCity() {
    return sharedModel.profile.city as String;
  }

  String getCompanyName() {
    return sharedModel.profile.companyName as String;
  }

  String getCountry() {
    return sharedModel.profile.country as String;
  }

  String getEmail() {
    return sharedModel.profile.email as String;
  }

  String getFirstName() {
    String firstName = sharedModel.profile.firstName as String;
    return firstName;
  }

  String getLastName() {
    return sharedModel.profile.lastName as String;
  }

  String getPassword() {
    return sharedModel.profile.password as String;
  }

  String getPhoneLine() {
    return sharedModel.profile.phoneLine as String;
  }

  String getSelectedState() {
    return sharedModel.profile.state as String;
  }

  String getState() {
    return sharedModel.profile.state as String;
  }

  String getStreetAddress() {
    return sharedModel.profile.streetAddress as String;
  }

  String getUserName() {
    return sharedModel.profile.userName as String;
  }

  String getZipCode() {
    return sharedModel.profile.zipCode as String;
  }

// Sets
  void setAreaCode(String areaCode) {
    sharedModel.profile.areaCode = areaCode;
  }

  void setCity(String city) {
    sharedModel.profile.city = city;
  }

  void setCompanyName(String companyName) {
    sharedModel.profile.companyName = companyName;
  }

  void setCountry(String country) {
    sharedModel.profile.country = country;
  }

  void setEmail(String email) {
    sharedModel.profile.email = email;
  }

  void setFirstName(String firstName) {
    sharedModel.profile.firstName = firstName;
  }

  void setLastName(String lastName) {
    sharedModel.profile.lastName = lastName;
  }

  void setPassword(String password) {
    sharedModel.profile.password = password;
  }

  void setPhoneLine(String phoneLine) {
    sharedModel.profile.phoneLine = phoneLine;
  }

  void setSelectedState(String selectedState) {
    sharedModel.profile.state = selectedState;
  }

  void setStreetAddress(String streetAddress) {
    sharedModel.profile.streetAddress = streetAddress;
  }

  void setUserName(String userName) {
    sharedModel.profile.userName = userName;
  }

  void setZipCode(String zipCode) {
    sharedModel.profile.zipCode = zipCode;
  }

  Future<String> awsCreateUser() async {
    try {
      // Call to AWS Cognito
      await sharedModel.loginService.createUser(
          getUserName(),
          getPassword(),
          getFirstName(),
          getLastName(),
          getCompanyName(),
          getEmail());
          // getAreaCode(),
          // getPhoneLine(),
          // getCountry());
    } on CognitoClientException catch (ex) {
      log(ex.toString());
      if (ex.code == Constants.AWS_ERR_USERNAME_EXISTS) {
        return Constants.AWS_ERR_USERNAME_EXISTS;
      }
      rethrow;
    }
    return Constants.STATUS_SUCCESS;
  }

  Map<String, dynamic> updateProfileValues(
      String token, UserProfile updatedProfile) {
    return {
      'requester_id': token,
      'first_name': updatedProfile.firstName,
      'last_name': updatedProfile.lastName,
      'company_name': updatedProfile.companyName,
      'email': updatedProfile.email,
      // 'street_address': updatedProfile.streetAddress,
      // 'city': updatedProfile.city,
      // 'state': updatedProfile.state,
      // 'zip_code': updatedProfile.zipCode,
      // 'country': updatedProfile.country,
      // 'area_code': updatedProfile.areaCode,
      // 'phone_number': updatedProfile.phoneLine,
      // 'to_do_ref_id': updatedProfile.toDoRefId,
    };
  }
}

