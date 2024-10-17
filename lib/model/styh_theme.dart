// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'flutter_flow_util.dart';

const kThemeModeKey = '__theme_mode__';
SharedPreferences? _prefs;

abstract class STYHTheme {
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  // static STYHTheme of(BuildContext context) {
  //   return Theme.of(context).brightness == Brightness.dark
  //       ? DarkModeTheme()
  //       : LightModeTheme();
  // }

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  //
  // Colors (Primary)
  static const priPurpleDeep = Color(0xFF15092F);
  static const priGradientStart = Color(0xFF19FFFD);
  static const priGradientEnd = Color(0xFF9B7FED);
  //
  // Colors (Secondary)
  static const secPurpleSuperDeep = Color(0xFF100725);
  static const secGray = Color(0xFFE5E5E5);
  static const secCyan = Color(0xFF14CCCA);
  static const secPurple = Color(0XFF7C65BD);
  //
  // Colors (Accent)
  static const accentPurple = Color(0xFF6969FF);
  static const accentYellow = Color(0xFFFFEF2E);
  static const accentGreen = Color(0xFF00FF91);


  String get displayLargeFamily => typography.displayLargeFamily;
  TextStyle get displayLarge => typography.displayLarge;
  String get displayMediumFamily => typography.displayMediumFamily;
  TextStyle get displayMedium => typography.displayMedium;
  String get displaySmallFamily => typography.displaySmallFamily;
  TextStyle get displaySmall => typography.displaySmall;
  String get headlineLargeFamily => typography.headlineLargeFamily;
  TextStyle get headlineLarge => typography.headlineLarge;
  String get headlineMediumFamily => typography.headlineMediumFamily;
  TextStyle get headlineMedium => typography.headlineMedium;
  String get headlineSmallFamily => typography.headlineSmallFamily;
  TextStyle get headlineSmall => typography.headlineSmall;
  String get titleLargeFamily => typography.titleLargeFamily;
  TextStyle get titleLarge => typography.titleLarge;
  String get titleMediumFamily => typography.titleMediumFamily;
  TextStyle get titleMedium => typography.titleMedium;
  String get titleSmallFamily => typography.titleSmallFamily;
  TextStyle get titleSmall => typography.titleSmall;
  String get labelLargeFamily => typography.labelLargeFamily;
  TextStyle get labelLarge => typography.labelLarge;
  String get labelMediumFamily => typography.labelMediumFamily;
  TextStyle get labelMedium => typography.labelMedium;
  String get labelSmallFamily => typography.labelSmallFamily;
  TextStyle get labelSmall => typography.labelSmall;
  String get bodyLargeFamily => typography.bodyLargeFamily;
  TextStyle get bodyLarge => typography.bodyLarge;
  String get bodyMediumFamily => typography.bodyMediumFamily;
  TextStyle get bodyMedium => typography.bodyMedium;
  String get bodySmallFamily => typography.bodySmallFamily;
  TextStyle get bodySmall => typography.bodySmall;

  Typography get typography => ThemeTypography(this);

  //
  // Styles - Light Mode / Dark Mode
  static const lmBorderDecoration = BoxDecoration(
      borderRadius: _borderRadius, border: Border.fromBorderSide(_borderSide));
  static const lmDividerLine = Divider(
      color: priPurpleDeep,
      height: 25,
      thickness: 2,
      indent: 5,
      endIndent: 5);
  static const lmListTileVeryStrongText = TextStyle(
      fontSize: 22, fontWeight: FontWeight.w800, color: Colors.black87);
  static const lmListTileStrongText = TextStyle(
      fontSize: 22, fontWeight: FontWeight.w400, color: Colors.black87);
  static const lmListTileLargeText =
  TextStyle(fontSize: 20, color: priPurpleDeep);
  static const lmListTileText =
  TextStyle(fontSize: 18, color: priPurpleDeep);
  //
  static const dmBorderDecoration = BoxDecoration(
      borderRadius: _borderRadius, border: Border.fromBorderSide(_borderSide));
  static const dmDividerLine = Divider(
      color: priPurpleDeep,
      height: 25,
      thickness: 2,
      indent: 5,
      endIndent: 5);
  static const dmListTileStrongText = TextStyle(
      fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black87);
  static const dmListTileText =
  TextStyle(fontSize: 18, color: priPurpleDeep);
  //
  // Styles
  static const _borderRadius = BorderRadius.all(Radius.circular(8.0));
  static const _borderSide = BorderSide(color: Color(0x8A000000), width: 1);
  static const borderDecoration = BoxDecoration(
      borderRadius: _borderRadius, border: Border.fromBorderSide(_borderSide));
  static const currencySymbol = '\$';
  static const percentageSymbol = '%';
  static const linkSide = TextStyle(color: Colors.blue, fontSize: 20);
  static const maxWidth = 450.0;
  static const numberFormat = TextInputType.numberWithOptions(decimal: true);
  //
  static final currency = NumberFormat.currency(
      locale: 'en_US', symbol: currencySymbol, decimalDigits: 2);
  static final percentage =
  NumberFormat.decimalPercentPattern(locale: 'en_US', decimalDigits: 2);
  static final hundredsNumber = NumberFormat("###", 'en_US');
  static final thousandsNumber = NumberFormat("###,###", 'en_US');
  static final millionsNumber = NumberFormat("###,###,###", 'en_US');
  static final filterDateFormat =
  FilteringTextInputFormatter.allow(RegExp('[0-9/]'));
  static final filterDigitsOnlyFormat = FilteringTextInputFormatter.digitsOnly;
  static final filterNumberFormat =
  FilteringTextInputFormatter.allow(RegExp('[0-9.,]'));
  //
  // Colors Usage - Light Mode / Dark Mode
  static const alternativeBackgroundColor = Color(0xFF003E5C);
  //
  // themes
  static final customTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: priPurpleDeep, //button background color
        onPrimary: Colors.white, //button foreground color
      ),
      primaryColor: priPurpleDeep,
      scaffoldBackgroundColor: Colors.white,
      secondaryHeaderColor: const Color(0xFFFF6F30),
      disabledColor: Colors.black45,
      hintColor: Colors.black54,
      fontFamily: 'Roboto',
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black87),
        //headline1
        displayMedium: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black87),
        //headline1
        displaySmall: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
        //headline2
        headlineLarge: TextStyle(
            fontSize: 24, fontWeight: FontWeight.w400, color: Colors.black87),
        //headline3
        headlineMedium: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black87),
        //headline3
        headlineSmall: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
        //headline4
        titleLarge: TextStyle(
            fontSize: 24, fontWeight: FontWeight.w400, color: Colors.black87),
        //headline5
        titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        // subtitle1:
        titleSmall: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
        //headline6
        labelSmall: TextStyle(color: Colors.red), //button
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        //background
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
            borderRadius: _borderRadius, borderSide: _borderSide),
        //custom border (showCupertinoModalPopup)
        labelStyle: TextStyle(color: secPurple, fontSize: 18.0),
        /*focusedBorder: OutlineInputBorder(
          borderRadius: _borderRadius,
          borderSide: BorderSide(strokeAlign: StrokeAlign.outside, color: _secondaryBackgroundColor, width: 2.0),
        ),*/
      ),
      sliderTheme: const SliderThemeData(
        trackHeight: 4.0,
        thumbColor: secPurple,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: const Color(0xFF052955),
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 20))));
}

abstract class Typography {
  String get displayLargeFamily;
  TextStyle get displayLarge;
  String get displayMediumFamily;
  TextStyle get displayMedium;
  String get displaySmallFamily;
  TextStyle get displaySmall;
  String get headlineLargeFamily;
  TextStyle get headlineLarge;
  String get headlineMediumFamily;
  TextStyle get headlineMedium;
  String get headlineSmallFamily;
  TextStyle get headlineSmall;
  String get titleLargeFamily;
  TextStyle get titleLarge;
  String get titleMediumFamily;
  TextStyle get titleMedium;
  String get titleSmallFamily;
  TextStyle get titleSmall;
  String get labelLargeFamily;
  TextStyle get labelLarge;
  String get labelMediumFamily;
  TextStyle get labelMedium;
  String get labelSmallFamily;
  TextStyle get labelSmall;
  String get bodyLargeFamily;
  TextStyle get bodyLarge;
  String get bodyMediumFamily;
  TextStyle get bodyMedium;
  String get bodySmallFamily;
  TextStyle get bodySmall;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final STYHTheme theme;

  String get displayLargeFamily => 'Inter Tight';
  TextStyle get displayLarge => GoogleFonts.getFont(
        'Inter Tight',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 64.0,
      );
  String get displayMediumFamily => 'Inter Tight';
  TextStyle get displayMedium => GoogleFonts.getFont(
        'Inter Tight',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 44.0,
      );
  String get displaySmallFamily => 'Inter Tight';
  TextStyle get displaySmall => GoogleFonts.getFont(
        'Inter Tight',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 36.0,
      );
  String get headlineLargeFamily => 'Inter Tight';
  TextStyle get headlineLarge => GoogleFonts.getFont(
        'Inter Tight',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 32.0,
      );
  String get headlineMediumFamily => 'Inter Tight';
  TextStyle get headlineMedium => GoogleFonts.getFont(
        'Inter Tight',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 28.0,
      );
  String get headlineSmallFamily => 'Inter Tight';
  TextStyle get headlineSmall => GoogleFonts.getFont(
        'Inter Tight',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 24.0,
      );
  String get titleLargeFamily => 'Inter Tight';
  TextStyle get titleLarge => GoogleFonts.getFont(
        'Inter Tight',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 20.0,
      );
  String get titleMediumFamily => 'Inter Tight';
  TextStyle get titleMedium => GoogleFonts.getFont(
        'Inter Tight',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 18.0,
      );
  String get titleSmallFamily => 'Inter Tight';
  TextStyle get titleSmall => GoogleFonts.getFont(
        'Inter Tight',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 16.0,
      );
  String get labelLargeFamily => 'Inter';
  TextStyle get labelLarge => GoogleFonts.getFont(
        'Inter',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get labelMediumFamily => 'Inter';
  TextStyle get labelMedium => GoogleFonts.getFont(
        'Inter',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get labelSmallFamily => 'Inter';
  TextStyle get labelSmall => GoogleFonts.getFont(
        'Inter',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
  String get bodyLargeFamily => 'Inter';
  TextStyle get bodyLarge => GoogleFonts.getFont(
        'Inter',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get bodyMediumFamily => 'Inter';
  TextStyle get bodyMedium => GoogleFonts.getFont(
        'Inter',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get bodySmallFamily => 'Inter';
  TextStyle get bodySmall => GoogleFonts.getFont(
        'Inter',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
    List<Shadow>? shadows,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
              shadows: shadows,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
              shadows: shadows,
            );
}
