import 'package:architecture/config/theme/typography/app_typography.dart';
import 'package:flutter/material.dart';

extension TypographyExtension on BuildContext {
  AppTypography get appTypography {
    // Try to retrieve the existing AppTypography from the theme
    var themeExtension = Theme.of(this).extension<AppTypography>();

    // If the themeExtension is null (not found), then create a new instance
    themeExtension ??= AppTypography(color: Colors.black);

    return themeExtension;
  }
}