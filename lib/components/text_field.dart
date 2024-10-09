import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef ObscureText = bool Function(FormFieldState<String> field);
typedef InputTextDecoration = InputDecoration Function(
    FormFieldState<String> field, Icon? prefixIcon, Icon? suffixIcon, String? labelText, String? hintText);

class TextFieldComponent extends FormField<String> {
  TextFieldComponent(
      {Key? key,

      Icon? prefixIcon,
      Icon? suffixIcon,
      String? labelText,
      String? hintText,
      EdgeInsets? padding,
      FocusNode? focusNode,
      GestureTapCallback? onTap,
      FormFieldValidator<String>? validator,
      ValueChanged<String>? onChanged,
      TextInputType? keyboardType,
      Iterable<String>? autofillHints,
      List<TextInputFormatter>? inputFormatters,
      ObscureText? obscureText,
      InputTextDecoration? decorationFunc,
      InputDecoration? decoration,
      int? minLines,
      int? maxLines,
      String? initialValue,
      TextAlign? textAlign,
      TextEditingController? controller,
      final ValueChanged<String>? onEditingComplete,
      final ValueChanged<String>? onSubmitted})
      : super(
            key: UniqueKey(),
            builder: (FormFieldState<String> field) {
              return Padding(
                padding: padding ?? const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: TextFormField(
                    key: key,
                    controller: controller,
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: textAlign ?? TextAlign.start,
                    autofocus: true,
                    minLines: minLines ?? 1,
                    maxLines: max(minLines ?? 1, maxLines ?? 1),
                    initialValue: initialValue,
                    keyboardType: keyboardType,
                    inputFormatters: inputFormatters,
                    autofillHints: autofillHints,
                    onFieldSubmitted: onSubmitted,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.sentences,
                    onChanged: onChanged,
                    focusNode: focusNode,
                    validator: validator,
                    onTap: onTap,
                    obscureText: (obscureText ?? isObscureText)(field),
                    decoration: decoration ?? (decorationFunc ?? createDecoration)(field, prefixIcon, suffixIcon, labelText, hintText)),
              );
            });

  static bool isObscureText(FormFieldState<String> field) {
    return false;
  }

  static InputDecoration? createDecoration(FormFieldState<String> field, Icon? prefixIcon, Icon? suffixIcon, String? labelText, String? hintText) {
    return InputDecoration(
      border: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey, // you can set the color to your preference
          width: 1.0, // you can set the width to your preference
        ),
      ),
      prefixIcon: prefixIcon ??= const Icon(Icons.mode_edit_outlined),
      suffixIcon: suffixIcon,
      labelText: labelText,
      hintText: hintText,
    );
  }
}
