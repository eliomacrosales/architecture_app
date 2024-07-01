import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier {
  late Locale _locale;

  LocaleProvider(String locale) {
    _locale = Locale(locale);
  }

  Locale get locale => _locale;

  void setLocale(Locale locale) async {
    _locale = locale;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('locale', locale.languageCode);
    notifyListeners();
  }
}
