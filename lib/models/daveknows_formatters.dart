import 'package:flutter/services.dart';
import 'package:daveknows/models/constants.dart';

class CurrencyInputFormatter extends TextInputFormatter {

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    String newText = '${Constants.currencySymbol}${newValue.text.replaceFirst(Constants.currencySymbol, '')}';
    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text.replaceAll('/', '');
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      if ((i == 1 && buffer.length == 2) || (i == 3 && buffer.length == 5)) {
        buffer.write('/');
      }
    }
    return newValue.copyWith(
        text: buffer.toString(),
        selection: TextSelection.collapsed(offset: buffer.length));
  }
}