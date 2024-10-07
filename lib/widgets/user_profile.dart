import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:daveknows/components/fix_button.dart';
import 'package:daveknows/components/text_field.dart';
import 'package:daveknows/models/constants.dart';
import 'package:daveknows/models/locales.dart';
import 'package:daveknows/models/daveknows_formatters.dart';
import 'package:daveknows/widgets/base_widget.dart';

class UserProfileWidget extends BaseWidget {
  final formKey = GlobalKey<FormState>();
  final firstNameKey = GlobalKey<FormFieldState>();
  final lastNameKey = GlobalKey<FormFieldState>();
  final countryKey = GlobalKey<FormFieldState>();

  UserProfileWidget(super.provider);

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
              L10nApp.allRequired.$,
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 16,
              ),
            ),
          ]),
          const SizedBox(height: 10),
          TextFieldComponent(
            key: firstNameKey,
            labelText: L10nApp.firstName.$,
            hintText: L10nApp.firstNameHint.$,
            initialValue: sharedModel.profile.firstName,
          ),
          TextFieldComponent(
            key: lastNameKey,
            labelText: L10nApp.lastName.$,
            hintText: L10nApp.lastNameHint.$,
            initialValue: sharedModel.profile.lastName,
          ),
          const SizedBox(height: 20),
          TextFieldComponent(
            key: countryKey,
            labelText: L10nApp.country.$,
            hintText: L10nApp.countryHint.$,
            initialValue: sharedModel.profile.country,
          ),
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
                ]),
        ]),
      ),
    );
  }

  Future<void> _onSubmitted() async {
    if (formKey.currentState!.validate()) {
      if (getValue(firstNameKey) == '') {
        popupError(L10nApp.firstNameRequired.$);
        return;
      }
      if (getValue(lastNameKey) == '') {
        popupError(L10nApp.lastNameRequired.$);
        return;
      }
      if (getValue(countryKey) == '') {
        popupError(L10nApp.countryRequired.$);
        return;
      }
      setFirstName(getValue(firstNameKey));
      setLastName(getValue(lastNameKey));
      setCountry(getValue(countryKey));
      loadingSpinningWheel(true); // This is here so the displaying of errors is not blocked.
      loadingSpinningWheel(false);
      goNext(Constants.NAV_USER_PROFILE_CONTACT,
          {'key': Constants.httpCreateUser});
    }
  }
}
