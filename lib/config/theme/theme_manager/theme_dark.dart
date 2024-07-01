import 'package:architecture/config/theme/color_scheme/dark_colors.dart';
import 'package:architecture/config/theme/typography/app_typography.dart';
import 'package:flutter/material.dart';
class ThemeDark {
  static ThemeData get darkTheme {
    final darkTheme = ThemeData.dark();
    return darkTheme.copyWith(
        colorScheme: const ColorScheme.dark(
          primary: DarkColors.primary50,
          onPrimary: DarkColors.primary50,
          secondary: DarkColors.primary50,
          onSecondary: DarkColors.primary50,
          surface: DarkColors.neutralWhite,
          onError: DarkColors.neutralWhite,
          error: DarkColors.primary50,
          onSurface: DarkColors.neutralWhite,
        ),
        extensions: [DarkColors.darkAppColors, AppTypography(color: DarkColors.neutralWhite)]);
  }
}
