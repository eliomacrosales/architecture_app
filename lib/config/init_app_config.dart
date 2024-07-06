import 'dart:io';
import 'package:architecture/config/environment/environment.dart';
import 'package:architecture/core/networking/http_overrides.dart';

class InitAppConfig {
  static Future<void> initialize() async {
    HttpOverrides.global = MyHttpOverrides();
    await Environment.setEnvironment();
  }
}
