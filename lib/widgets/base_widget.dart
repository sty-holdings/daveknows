import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:framework/base_widget.dart';
import 'package:daveknows/models/constants.dart';
import 'package:daveknows/models/dk_shared_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseWidget extends BaseWidgetState {
  bool isLoading = false;
  bool isPaddingOnKeyboard = true;
  final scrollController = ScrollController();

  List<String> contactMethods = [
    Constants.LBL_Email,
    Constants.LBL_SMS_Text,
    Constants.LBL_Telegram
  ];

  BaseWidget(super.provider, {
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
      builder: (context) =>
          AlertDialog(
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
    } else {
      return Scaffold(
        appBar: AppBar(
            title: const Text(Constants.SLOGAN),
            leading: BackButton(
              onPressed: () =>
              {Navigator.popAndPushNamed(context, Constants.NAV_INTRO)},
            )),
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
      message, Theme
      .of(context)
      .colorScheme
      .error, closeLastPopup, timeout);
}

void _popupMessage(String message, Color backgroundColor, bool closeLastPopup,
    int timeout) {
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
  prefs.setString('username', sharedModel.savedEmail);
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

}

