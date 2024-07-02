import 'dart:io';
import 'package:architecture/config/environment/environment.dart';
import 'package:architecture/core/networking/http_overrides.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitAppConfig {
  static late SharedPreferences _prefs;
  static late String locale;
  static late ThemeMode themeMode;

  static Future<void> initializeApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    HttpOverrides.global = MyHttpOverrides();
    _prefs = await SharedPreferences.getInstance();
    await _initializeEnvironment();
    _initializeLocales();
    _initializeThemeMode();
  }

  static Future<void> _initializeEnvironment() async {
    await Environment.setEnvironment();
  }

  static void _initializeLocales() {
     locale = (_prefs.get('locale') ?? 'es') as String;
  }

  static void _initializeThemeMode()  {
    final themeValue = _prefs.getInt('themeMode');
    if (themeValue == null) {
      themeMode = ThemeMode.light;
    }
      else {
      themeMode = ThemeMode.values[themeValue];
    }
  }
}
