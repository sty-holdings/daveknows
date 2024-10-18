import 'package:flutter/material.dart';

class FixButton extends FormField<String> {
  static Color setTextColor = Colors.black; // Default color

  FixButton(String labelText,
      {Key? key,
      IconData? icon,
      VoidCallback? onPressed,
      double width = 300,
      double height = 45,
      double fontSize = 25,
      ButtonStyle? style,
      EdgeInsets padding = const EdgeInsets.symmetric(vertical: 5),
      final ValueChanged<String>? onSubmitted,
      Color setTextColor = Colors.black}) // Make changeTextColor optional
      : super(
            key: UniqueKey(),
            builder: (FormFieldState<String> field) {
              return Padding(
                padding: padding,
                child: SizedBox(
                  width: width,
                  height: height,
                  child: ElevatedButton.icon(
                    style: style,
                    label: Text(
                      labelText,
                      style: TextStyle(color: setTextColor),
                    ),
                    icon: Icon(
                      icon,
                      size: icon != null ? fontSize : 0,
                    ),
                    onPressed: onPressed,
                  ),
                ),
              );
            });

  static getStyle(Color color) =>
      ButtonStyle(backgroundColor: WidgetStatePropertyAll<Color>(color));

  static setStyle(Color color) =>
      ButtonStyle(backgroundColor: WidgetStatePropertyAll<Color>(color));
}
