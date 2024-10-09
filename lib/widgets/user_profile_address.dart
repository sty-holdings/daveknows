import 'dart:convert';

import 'package:daveknows/models/usa_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:daveknows/components/fix_button.dart';
import 'package:daveknows/components/text_field.dart';
import 'package:daveknows/models/constants.dart';
import 'package:daveknows/models/locales.dart';
import 'package:daveknows/widgets/base_widget.dart';

import '../components/service.dart';

class UserProfileAddressWidget extends BaseWidget {
  final formKey = GlobalKey<FormState>();
  final streetAddressKey = GlobalKey<FormFieldState>();
  final cityKey = GlobalKey<FormFieldState>();
  final stateKey = GlobalKey<FormFieldState>();
  final zipKey = GlobalKey<FormFieldState>();
  String? dropdownValue = 'CA';

  UserProfileAddressWidget(super.provider);

  @override
  Widget buildUI(BuildContext context, ThemeData theme) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return Form(
      key: formKey,
      child: Center(
        child: Column(
          children: <Widget>[
            pageHeading(
                '${sharedModel.profile.firstName}${L10nApp.titleUserProfile}'),
            const SizedBox(height: 20),
            ...buildAddress(
                sharedModel.profile.streetAddress,
                sharedModel.profile.city,
                sharedModel.profile.state,
                sharedModel.profile.zipCode),
            const SizedBox(height: 20),
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : Column(children: [
                    FixButton(
                      L10nApp.updateProfile.$,
                      icon: Icons.update_outlined,
                      onPressed: () async {
                        await onSubmitted();
                      },
                    ),
                    FixButton(
                      L10nApp.back.$,
                      icon: Icons.arrow_back_outlined,
                      onPressed: () async {
                        goNext(Constants.NAV_USER_PROFILE_CONTACT);
                      },
                    ),
                  ]),
          ],
        ),
      ),
    );
  }

  List<Widget> buildAddress(
      String? streetAddress, String? city, String? state, String? zipCode) {
    List<Widget> widgets = [];
    widgets.add(Row(children: [
      const SizedBox(width: 20),
      SizedBox(
        width: 325,
        child: Text(
          L10nApp.addressMessage.$,
          maxLines: 3,
          textAlign: TextAlign.left,
          style: const TextStyle(
            color: Colors.red,
            fontSize: 18,
          ),
        ),
      ),
    ]));
    widgets.add(const SizedBox(height: 20));
    widgets.add(Row(children: [
      const SizedBox(width: 20),
      Text(
        L10nApp.address.$,
        textAlign: TextAlign.left,
        style: const TextStyle(fontSize: 18),
      )
    ]));
    widgets.add(TextFieldComponent(
      key: streetAddressKey,
      labelText: L10nApp.streetAddress.$,
      hintText: L10nApp.streetAddressHint.$,
      initialValue: streetAddress,
    ));
    widgets.add(TextFieldComponent(
      key: cityKey,
      labelText: L10nApp.city.$,
      hintText: L10nApp.cityHint.$,
      initialValue: city,
    ));
    widgets.add(Row(children: [
      const Padding(
        padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
      ),
      supportStatesDropDown(),
      const SizedBox(width: 30),
      Expanded(
        child: TextFieldComponent(
          padding: const EdgeInsets.only(right: 15),
          key: zipKey,
          labelText: L10nApp.zipCode.$,
          hintText: L10nApp.zipCodeHint.$,
          initialValue: zipCode,
          keyboardType: TextInputType.number,
          inputFormatters: [
            Constants.filterDigitsOnlyFormat,
          ],
        ),
      ),
    ]));
    return widgets;
  }

  Widget supportStatesDropDown() {
    final usaStates = USAStates();
    if (sharedModel.profile.state == '') {
      return DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_downward),
        style: const TextStyle(fontSize: 20, color: Colors.black),
        underline: Container(
          height: 0,
          color: Colors.black,
        ),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value!;
          });
        },
        items: USAStates.getAllStateNamesDropDown(),
      );
    }
    return DropdownButton<String>(
      value: sharedModel.profile.state,
      icon: const Icon(Icons.arrow_downward),
      style: const TextStyle(fontSize: 20, color: Colors.black),
      underline: Container(
        height: 0,
        color: Colors.black,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          sharedModel.profile.state = value!;
          dropdownValue = value;
        });
      },
      items: USAStates.getAllStateNamesDropDown(),
    );
  }

  Future<void> onSubmitted() async {
    if (formKey.currentState!.validate()) {
      loadingSpinningWheel(true);
      try {
        for (final todo in sharedModel.toDoList) {
          if (todo.navigation == Constants.NAV_USER_PROFILE) {
            sharedModel.profile.toDoRefId = todo.toDoRefId;
          }
        }
        setStreetAddress(getValue(streetAddressKey));
        setCity(getValue(cityKey));
        setSelectedState(dropdownValue!);
        setZipCode(getValue(zipKey));
        final profile =
            updateProfileValues(sharedModel.profile.id!, sharedModel.profile);
        final response = await DKService.requestJSON(
            Constants.natsUpdateUserProfile, jsonEncode(profile));
        for (final todo in sharedModel.toDoList) {
          if (todo.navigation == Constants.NAV_HOME) {
            todo.status = Constants.STATUS_COMPLETED;
          }
        }
        goNext(Constants.NAV_HOME);
        popupInfo(response['message']);
      } catch (ex) {
        popupError(ex.toString());
      }
      loadingSpinningWheel(false);
    }
  }
}
