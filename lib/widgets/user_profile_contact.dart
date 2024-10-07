import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:daveknows/components/fix_button.dart';
import 'package:daveknows/models/constants.dart';
import 'package:daveknows/models/locales.dart';
import 'package:daveknows/widgets/base_widget.dart';

import '../components/area_code_field.dart';
import '../components/email_field.dart';
import '../components/phone_line_field.dart';

class UserProfileContactWidget extends BaseWidget {
  final formKey = GlobalKey<FormState>();

  final emailKey = GlobalKey<FormFieldState>();
  final areaCodeKey = GlobalKey<FormFieldState>();
  final phoneLineKey = GlobalKey<FormFieldState>();
  final streetKey = GlobalKey<FormFieldState>();
  final cityKey = GlobalKey<FormFieldState>();
  final stateKey = GlobalKey<FormFieldState>();
  final zipKey = GlobalKey<FormFieldState>();
  bool _smsTextSelected = false; // false = no
  bool _telegramSelected = false; // false = no

  UserProfileContactWidget(super.provider);

  @override
  Widget buildUI(BuildContext context, ThemeData theme) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return Form(
      key: formKey,
      child: Center(
        child: Column(children: <Widget>[
          pageHeading(
              '${sharedModel.profile.firstName}${L10nApp.titleUserProfile}'),
          const SizedBox(height: 10),
          Row(children: [
            const SizedBox(width: 20),
            Text(
              L10nApp.emailRequired.$,
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 16,
              ),
            ),
          ]),
          EmailField(key: emailKey, initialValue: sharedModel.profile.email),
          const SizedBox(height: 20),
          ...buildPhoneNumber(theme, sharedModel.profile.areaCode,
              sharedModel.profile.phoneLine),
          const SizedBox(height: 50),
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : Column(children: [
                  FixButton(
                    L10nApp.nextPage.$,
                    icon: Icons.arrow_forward_outlined,
                    onPressed: () async {
                      await _onSubmitted();
                    },
                  ),
                  FixButton(
                    L10nApp.back.$,
                    icon: Icons.arrow_back_outlined,
                    onPressed: () async {
                      goNext(Constants.NAV_USER_PROFILE);
                    },
                  ),
                ]),
        ]),
      ),
    );
  }

  List<Widget> buildPhoneNumber(
      ThemeData theme, String? areaCode, String? phoneLine) {
    List<Widget> widgets = [];
    widgets.add(
      Row(children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            L10nApp.optional.$,
            textAlign: TextAlign.left,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 16,
            ),
          ),
        ),
      ]),
    );
    widgets.add(
      Row(children: [
        Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              Constants.LBL_Area_Code,
              style: theme.textTheme.titleSmall,
            )),
        Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Text(
              Constants.LBL_Phone_Number,
              style: theme.textTheme.titleSmall,
            )),
      ]),
    );
    widgets.add(Row(children: <Widget>[
      SizedBox(
        width: 120,
        child: AreaCodeField(
          key: areaCodeKey,
          labelText: '',
          hintText: '',
          initialValue: areaCode,
        ),
      ),
      SizedBox(
        width: 230,
        child: PhoneLineField(
          key: phoneLineKey,
          initialValue: phoneLine,
        ),
      ),
    ]));
    widgets.add(const SizedBox(height: 20));
    return widgets;
  }

  Future<void> _onSubmitted() async {
    if (formKey.currentState!.validate()) {
      String areaCode = getValue(areaCodeKey);
      String phoneLine = getValue(phoneLineKey);
      if (areaCode.isNotEmpty && areaCode.length < 3) {
        popupError(L10nApp.areaCodeToShort.$);
        return;
      }
      if (phoneLine.isNotEmpty && phoneLine.length < 7) {
        popupError(L10nApp.phoneLineToShort.$);
        return;
      }
      if ((areaCode.isNotEmpty && phoneLine.isEmpty) ||
          (areaCode.isEmpty && phoneLine.isNotEmpty)) {
        popupError(L10nApp.phoneNumberRequired.$);
        return;
      }
      if ((_smsTextSelected || _telegramSelected) &&
          (areaCode.isEmpty || phoneLine.isEmpty)) {
        popupError(L10nApp.phoneNumberRequired.$);
        return;
      }
      setEmail(getValue(emailKey));
      setAreaCode(areaCode);
      setPhoneLine(phoneLine);
      loadingSpinningWheel(true); // This is here so the displaying of errors is not blocked.
      loadingSpinningWheel(false);
      goNext(Constants.NAV_USER_PROFILE_ADDRESS);
    }
  }
}
