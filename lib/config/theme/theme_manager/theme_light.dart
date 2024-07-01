import 'package:architecture/config/theme/color_scheme/light_colors.dart';
import 'package:architecture/config/theme/typography/app_typography.dart';
import 'package:flutter/material.dart';

class ThemeLight {
  static ThemeData get lightTheme {
    final lightTheme = ThemeData.light();
    return lightTheme.copyWith(
        colorScheme: const ColorScheme.light(
          primary: LightColors.primary50,
          onPrimary: LightColors.primary50,
          secondary: LightColors.primary50,
          onSecondary: LightColors.primary50,
          surface: LightColors.neutralWhite,
          onError: LightColors.neutralWhite,
          error: LightColors.neutralWhite,
          onSurface: LightColors.neutralWhite,
        ),
        extensions: [
          LightColors.lightAppColors,
          AppTypography(color: LightColors.neutralBlack)
        ]);
  }
}
