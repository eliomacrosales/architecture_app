import 'package:architecture/config/theme/theme_manager/theme_dark.dart';
import 'package:architecture/config/theme/theme_manager/theme_light.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }

  /// Light theme
  static final light = ThemeLight.lightTheme;

  /// Dark theme
  static final dark = ThemeDark.darkTheme;
}