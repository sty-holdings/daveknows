import 'package:flutter/material.dart';

class DKThemes {
  //
  // Buttons
  static ButtonStyle primaryButtonLargeBlackOnWhite = ButtonStyle(
    textStyle: WidgetStateProperty.all<TextStyle>(buttonLargeBlack),
    backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );

  // Colors
  static const Color primary = Color(0xFF4B39EF);
  static const Color secondary = Color(0xFF9B7FED);
  static const Color tertiary = Color(0xFF19FFFD);
  static const Color alternate = Color(0xFFE0E3E7);
  static const Color primaryText = Color(0xFF14181B);
  static const Color secondaryText = Color(0xFFFFFFFF);
  static const Color primaryBackground = Color(0xFF4B39EF);
  static const Color secondaryBackground = Color(0xFFFFFFFF);
  static const Color accent1 = Color(0xFF6969FF);
  static const Color accent2 = Color(0xFFFFEF2E);
  static const Color accent3 = Color(0xFF00FF91);
  static const Color accent4 = Color(0xCCFFFFFF);
  static const Color success = Color(0xCCFFFFFF);
  static const Color warning = Color(0xCCFFFFFF);
  static const Color error = Color(0xFFFF0000);
  static const Color info = Color(0xFFFFFFFF);

  // Text Themes
  static TextStyle buttonLargeBlack = const TextStyle(
      fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black);
  static TextStyle buttonMediumBlack = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black);
  static TextStyle buttonSmallBlack = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w200, color: Colors.black);
  static TextStyle headlineLargeBlack = const TextStyle(
      fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black);
  static TextStyle headlineMediumBlack = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black);
  static TextStyle headlineSmallBlack = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w200, color: Colors.black);
  static TextStyle headlineLargeWhite = const TextStyle(
      fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white);
  static TextStyle headlineMediumWhite = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white);
  static TextStyle headlineSmallWhite = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w200, color: Colors.white);
  static TextStyle quoteLargeBlack = const TextStyle(
      fontStyle: FontStyle.italic,
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Colors.black);
  static TextStyle quoteMediumBlack = const TextStyle(
      fontStyle: FontStyle.italic,
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: Colors.black);
  static TextStyle quoteSmallBlack = const TextStyle(
      fontStyle: FontStyle.italic,
      fontSize: 16,
      fontWeight: FontWeight.w200,
      color: Colors.black);
  static TextStyle quoteLargeWhite = const TextStyle(
      fontStyle: FontStyle.italic,
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Colors.white);
  static TextStyle quoteMediumWhite = const TextStyle(
      fontStyle: FontStyle.italic,
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: Colors.white);
  static TextStyle quoteSmallWhite = const TextStyle(
      fontStyle: FontStyle.italic,
      fontSize: 16,
      fontWeight: FontWeight.w200,
      color: Colors.white);
}
