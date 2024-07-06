import 'package:architecture/utils/preferences/shared_preferences_provider.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_controller.g.dart';

@riverpod
class ThemeController extends _$ThemeController {
  static const themePreferenceKey = 'isDarkTheme';

  @override
  ThemeMode build() {
    final prefs = ref.read(sharedPreferencesProvider);
    final isDarkTheme = prefs.getBool(themePreferenceKey) ?? false;
    return isDarkTheme ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> toggleTheme() async {
    final prefs = ref.read(sharedPreferencesProvider);
    final isDarkTheme = state == ThemeMode.dark;
    final newThemeMode = isDarkTheme ? ThemeMode.light : ThemeMode.dark;
    await prefs.setBool(themePreferenceKey, !isDarkTheme);
    state = newThemeMode;
  }
}
