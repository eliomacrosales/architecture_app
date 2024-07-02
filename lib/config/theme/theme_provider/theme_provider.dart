import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  late ThemeMode _themeMode;

  ThemeProvider(ThemeMode themeMode) {
    _themeMode = themeMode;
  }

  ThemeMode get themeMode => _themeMode;

  void setThemeMode(ThemeMode themeMode) async{
    _themeMode = themeMode;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('themeMode', themeMode.index);
    notifyListeners();
  }
}