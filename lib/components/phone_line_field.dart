import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:daveknows/components/text_field.dart';

class PhoneLineField extends TextFieldComponent {
  PhoneLineField(
      {super.key,
      String? errorText,
      super.labelText,
      super.hintText,
        super.initialValue,
      super.focusNode,
      super.padding,
      super.onChanged,
      super.onSubmitted})
      : super(
          keyboardType: TextInputType.number,
          autofillHints: const [AutofillHints.telephoneNumberDevice],
          prefixIcon: const Icon(Icons.phone),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            LengthLimitingTextInputFormatter(7),
          ],
        );
}
