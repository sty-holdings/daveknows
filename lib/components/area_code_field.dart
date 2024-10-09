import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:daveknows/components/text_field.dart';

class AreaCodeField extends TextFieldComponent {
  AreaCodeField(
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
          autofillHints: const [AutofillHints.telephoneNumberAreaCode],
          prefixIcon: const Icon(Icons.phone),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            LengthLimitingTextInputFormatter(3),
          ],
        );
}
