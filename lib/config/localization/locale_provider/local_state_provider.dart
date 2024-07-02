import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'local_state_provider.g.dart';

@riverpod
class LocaleState extends _$LocaleState {

  @override
  Locale build() {
    return const Locale('es');
  }

  void setLocale(Locale locale) async {
    state = locale;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', locale.languageCode);
  }
}
