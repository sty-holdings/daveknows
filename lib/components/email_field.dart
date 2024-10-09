import 'package:flutter/material.dart';
import 'package:daveknows/components/text_field.dart';
import 'package:daveknows/models/locales.dart';

class EmailField extends TextFieldComponent {
  EmailField(
      {super.key,
      String? errorText,
      String? labelText,
      String? hintText,
      super.initialValue,
      super.focusNode,
      super.padding,
      super.onChanged,
      super.onSubmitted})
      : super(
            keyboardType: TextInputType.emailAddress,
            autofillHints: const [AutofillHints.email],
            prefixIcon: const Icon(Icons.markunread_outlined),
            labelText: L10nApp.email.$,
            validator: (email) {
              String pattern =
                  r'.+@.+\..+'; //Has at least one character before the @, before the period and after it
              RegExp regex = RegExp(pattern);
              if (!regex.hasMatch(email!)) {
                return errorText ?? L10nApp.emailValidator.$;
              } else {
                return null;
              }
            });
}
