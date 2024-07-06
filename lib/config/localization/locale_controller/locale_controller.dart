import 'package:architecture/utils/preferences/shared_preferences_provider.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale_controller.g.dart';

@riverpod
class LocaleController extends _$LocaleController {
  static const localePreferenceKey = 'locale';

  @override
  Locale build() {
    final prefs = ref.read(sharedPreferencesProvider);
    final localeString = prefs.getString(localePreferenceKey) ?? 'es';
    return Locale(localeString);
  }

  Future<void> setLocale(String locale) async {
    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.setString(localePreferenceKey, locale);
    state = Locale(locale);
  }
}
