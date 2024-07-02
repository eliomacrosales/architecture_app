import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@riverpod
class ThemeState extends _$ThemeState {
  @override
  ThemeMode build() {
    return ThemeMode.system;
  }

  set themeMode(ThemeMode themeMode) {
    state = themeMode;
  }
}
