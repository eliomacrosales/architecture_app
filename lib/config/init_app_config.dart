import 'dart:io';
import 'package:architecture/config/environment/environment.dart';
import 'package:architecture/core/networking/http_overrides.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitAppConfig {
  static Future<String> initialize() async {
    HttpOverrides.global = MyHttpOverrides();
    await Environment.setEnvironment();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final locale = prefs.get('locale') ?? 'es';
    return locale as String;
  }
}
