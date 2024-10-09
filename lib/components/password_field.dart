import 'package:flutter/material.dart';
import 'package:daveknows/components/text_field.dart';
import 'package:daveknows/models/locales.dart';

class PasswordField extends TextFieldComponent {
  PasswordField({
    super.key,
    ScrollController? scrollController,
    super.padding,
    String? errorText,
    String? labelText,
    String? hintText,
    super.focusNode,
    super.onChanged,
    super.onSubmitted,
    String? Function(String, String)? validator,
  }) : super(
          labelText: labelText ?? L10nApp.password.$,
          hintText: hintText ?? L10nApp.passwordHint.$,
          autofillHints: const [AutofillHints.password],
          obscureText: (FormFieldState<String> field) {
            final _PasswordFieldState state = field as _PasswordFieldState;
            return state._obscurePassword;
          },
          decorationFunc: (FormFieldState<String> field, Icon? prefixIcon, Icon? suffixIcon, String? labelText, String? hintText) {
            final _PasswordFieldState state = field as _PasswordFieldState;
            return InputDecoration(
                prefixIcon: const Icon(Icons.lock_open),
                suffixIcon: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      child: state._obscurePassword ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                      onTap: () {
                        state.toggleObscure();
                      },
                    )),
                labelText: labelText,
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,  // you can set the color to your preference
                    width: 1.0,  // you can set the width to your preference
                  ),
                ),
                hintText: hintText);
          },
          validator: (password) {
            return (validator ?? passwordValidator)(password!, errorText ?? L10nApp.passwordValidator.$);
          },
          onTap: () {
            scrollController?.animateTo(scrollController.position.viewportDimension,
                duration: const Duration(milliseconds: 200), curve: Curves.linear);
          },
        );

  static String? passwordValidator(String password, String errorText) {
    String pattern = r'^(?=.*\d)[\w\W]{6,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(password)) {
      return errorText;
    } else {
      return null;
    }
  }

  @override
  FormFieldState<String> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends FormFieldState<String> {
  bool _obscurePassword = true;

  void toggleObscure() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }
}
