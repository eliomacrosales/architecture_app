import 'package:flutter/material.dart';

class AppTypography extends ThemeExtension<AppTypography> {
  final TextStyle heading1_28Medium;
  final TextStyle heading1_28Regular;
  final TextStyle heading1_28Light;

  final TextStyle headline2_24Medium;
  final TextStyle headline2_24Regular;
  final TextStyle headline2_24Light;

  final TextStyle headline3_20Medium;
  final TextStyle headline3_20Regular;
  final TextStyle headline3_20Light;

  final TextStyle body_20Medium;
  final TextStyle body_20Regular;
  final TextStyle body_16Medium;
  final TextStyle body_16Regular;
  final TextStyle body_16Light;
  final TextStyle body_14Regular;
  final TextStyle body_12Regular;
  final TextStyle body_12Medium;

  final TextStyle paragraphLight_14Medium;
  final TextStyle paragraphLight_14Regular;
  final TextStyle paragraphLight_14Light;

  final TextStyle label_14Medium;
  final TextStyle caption_14Regular;
  final TextStyle smallText_12Medium;
  static const String _fontFamily = 'Graphik';
  static const List<String> _backupFontFamily = ['Inter'];
  static const String _packageName = 'bancadigital_bm_red_designsystem';

  AppTypography({
    required Color color,
  })  : heading1_28Medium = TextStyle(
          package: _packageName,
          fontFamily: _fontFamily,
          fontFamilyFallback: _backupFontFamily,
          fontStyle: FontStyle.normal,
          fontSize: 28,
          height: 1.20,
          fontWeight: FontWeight.w500,
          color: color,
        ),
        heading1_28Regular = TextStyle(
          package: _packageName,
          fontFamily: _fontFamily,
          fontFamilyFallback: _backupFontFamily,
          fontStyle: FontStyle.normal,
          fontSize: 28,
          height: 1.20,
          fontWeight: FontWeight.w400,
          color: color,
        ),
        heading1_28Light = TextStyle(
          package: _packageName,
          fontFamily: _fontFamily,
          fontFamilyFallback: _backupFontFamily,
          fontStyle: FontStyle.normal,
          fontSize: 28,
          height: 1.20,
          fontWeight: FontWeight.w300,
          color: color,
        ),
        headline2_24Medium = TextStyle(
          package: _packageName,
          fontFamily: _fontFamily,
          fontFamilyFallback: _backupFontFamily,
          fontStyle: FontStyle.normal,
          fontSize: 24,
          height: 1.20,
          fontWeight: FontWeight.w500,
          color: color,
        ),
        headline2_24Regular = TextStyle(
          package: _packageName,
          fontFamily: _fontFamily,
          fontFamilyFallback: _backupFontFamily,
          fontStyle: FontStyle.normal,
          fontSize: 24,
          height: 1.20,
          fontWeight: FontWeight.w400,
          color: color,
        ),
        headline2_24Light = TextStyle(
          package: _packageName,
          fontFamily: _fontFamily,
          fontFamilyFallback: _backupFontFamily,
          fontStyle: FontStyle.normal,
          fontSize: 24,
          height: 1.20,
          fontWeight: FontWeight.w300,
          color: color,
        ),
        headline3_20Medium = TextStyle(
          package: _packageName,
          fontFamily: _fontFamily,
          fontFamilyFallback: _backupFontFamily,
          fontStyle: FontStyle.normal,
          fontSize: 20,
          height: 1.20,
          fontWeight: FontWeight.w500,
          color: color,
        ),
        headline3_20Regular = TextStyle(
          package: _packageName,
          fontFamily: _fontFamily,
          fontFamilyFallback: _backupFontFamily,
          fontStyle: FontStyle.normal,
          fontSize: 20,
          height: 1.20,
          fontWeight: FontWeight.w400,
          color: color,
        ),
        headline3_20Light = TextStyle(
          package: _packageName,
          fontFamily: _fontFamily,
          fontFamilyFallback: _backupFontFamily,
          fontStyle: FontStyle.normal,
          fontSize: 20,
          height: 1.20,
          fontWeight: FontWeight.w300,
          color: color,
        ),
        body_20Medium = TextStyle(
          fontFamily: _fontFamily,
          fontFamilyFallback: _backupFontFamily,
          fontStyle: FontStyle.normal,
          fontSize: 20,
          height: 1.20,
          fontWeight: FontWeight.w500,
          color: color,
        ),
        body_20Regular = TextStyle(
          fontFamily: _fontFamily,
          fontFamilyFallback: _backupFontFamily,
          fontStyle: FontStyle.normal,
          fontSize: 20,
          height: 1.20,
          fontWeight: FontWeight.w400,
          color: color,
        ),
        body_16Medium = TextStyle(
          package: _packageName,
          fontFamily: _fontFamily,
          fontFamilyFallback: _backupFontFamily,
          fontStyle: FontStyle.normal,
          fontSize: 16,
          height: 1.30,
          fontWeight: FontWeight.w500,
          color: color,
        ),
        body_16Regular = TextStyle(
          package: _packageName,
          fontFamily: _fontFamily,
          fontFamilyFallback: _backupFontFamily,
          fontStyle: FontStyle.normal,
          fontSize: 16,
          height: 1.30,
          fontWeight: FontWeight.w400,
          color: color,
        ),
        body_16Light = TextStyle(
          package: _packageName,
          fontFamily: _fontFamily,
          fontFamilyFallback: _backupFontFamily,
          fontStyle: FontStyle.normal,
          fontSize: 16,
          height: 1.30,
          fontWeight: FontWeight.w300,
          color: color,
        ),
        body_14Regular = TextStyle(
          fontFamily: _fontFamily,
          fontFamilyFallback: _backupFontFamily,
          fontStyle: FontStyle.normal,
          fontSize: 14,
          height: 1.20,
          fontWeight: FontWeight.w400,
          color: color,
        ),
        body_12Medium = TextStyle(
          package: _packageName,
          fontFamily: _fontFamily,
          fontFamilyFallback: _backupFontFamily,
          fontSize: 12,
          height: 1.10,
          fontWeight: FontWeight.w500,
          color: color,
        ),
        body_12Regular = TextStyle(
          package: _packageName,
          fontFamily: _fontFamily,
          fontFamilyFallback: _backupFontFamily,
          fontSize: 12,
          height: 1.10,
          fontWeight: FontWeight.w400,
          color: color,
        ),
        paragraphLight_14Medium = TextStyle(
          package: _packageName,
          fontFamily: _fontFamily,
          fontFamilyFallback: _backupFontFamily,
          fontStyle: FontStyle.normal,
          fontSize: 14,
          height: 1.20,
          fontWeight: FontWeight.w500,
          color: color,
        ),
        paragraphLight_14Regular = TextStyle(
          package: _packageName,
          fontFamily: _fontFamily,
          fontFamilyFallback: _backupFontFamily,
          fontStyle: FontStyle.normal,
          fontSize: 14,
          height: 1.20,
          fontWeight: FontWeight.w400,
          color: color,
        ),
        paragraphLight_14Light = TextStyle(
          package: _packageName,
          fontFamily: _fontFamily,
          fontFamilyFallback: _backupFontFamily,
          fontStyle: FontStyle.normal,
          fontSize: 14,
          height: 1.20,
          fontWeight: FontWeight.w300,
          color: color,
        ),
        label_14Medium = TextStyle(
          package: _packageName,
          fontFamily: _fontFamily,
          fontFamilyFallback: _backupFontFamily,
          fontStyle: FontStyle.normal,
          fontSize: 14,
          height: 1.30,
          fontWeight: FontWeight.w500,
          color: color,
        ),
        caption_14Regular = TextStyle(
          package: _packageName,
          fontFamily: _fontFamily,
          fontFamilyFallback: _backupFontFamily,
          fontStyle: FontStyle.normal,
          fontSize: 14,
          height: 1.30,
          fontWeight: FontWeight.w400,
          color: color,
        ),
        smallText_12Medium = TextStyle(
          package: _packageName,
          fontFamily: _fontFamily,
          fontFamilyFallback: _backupFontFamily,
          fontStyle: FontStyle.normal,
          fontSize: 12,
          height: 1.30,
          fontWeight: FontWeight.w500,
          color: color,
        );

  @override
  ThemeExtension<AppTypography> copyWith() {
    return AppTypography(color: Colors.white);
  }

  @override
  ThemeExtension<AppTypography> lerp(
    covariant ThemeExtension<AppTypography>? other,
    double t,
  ) {
    if (other is! AppTypography) {
      return this;
    }
    return AppTypography(color: Colors.white);
  }
}
