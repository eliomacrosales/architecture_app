import 'package:architecture/config/theme/color_manager/color_manager.dart';
import 'package:flutter/material.dart';

class DarkColors {
  /// colores personalizados para el tema claro

  /// attention
  static const attention95 = Color(0xFFFFECDD);
  static const attention75 = Color(0xFFFFB67D);
  static const attention50 = Color(0xFFF5881F);
  static const attention35 = Color(0xFF8C3A00);
  static const attention20 = Color(0xFF672900);

  /// importance
  static const importance95 = Color(0xFFFFEBF8);
  static const importance75 = Color(0xFFF8B1E1);
  static const importance50 = Color(0xFFB33E96);
  static const importance35 = Color(0xFF8E2876);
  static const importance20 = Color(0xFF681C56);

  /// informative
  static const informative95 = Color(0xFFE5F3F6);
  static const informative75 = Color(0xFF97D0DA);
  static const informative50 = Color(0xFF1BA0B1);
  static const informative35 = Color(0xFF005E6C);
  static const informative20 = Color(0xFF00444E);

  /// neutral
  static const neutral95 = Color(0xFFF1F1F1);
  static const neutral75 = Color(0xFFB9B9B9);
  static const neutral50 = Color(0xFF808080);
  static const neutral35 = Color(0xFF393939);
  static const neutral20 = Color(0xFF1F1F1F);
  static const neutralWhite = Color(0xFFFFFFFF);
  static const neutralBlack = Color(0xFF000000);

  /// positive
  static const positive95 = Color(0xFFE8F4E4);
  static const positive75 = Color(0xFFA5D398);
  static const positive50 = Color(0xFF6EBF5D);
  static const positive35 = Color(0xFF12600E);
  static const positive20 = Color(0xFF0C4608);

  /// secondary
  static const secondary95 = Color(0xFFEAF1FE);
  static const secondary75 = Color(0xFFA9C9F6);
  static const secondary50 = Color(0xFF1075BB);
  static const secondary35 = Color(0xFF005691);
  static const secondary20 = Color(0xFF003E6A);

  /// primary
  static const primary95 = Color(0xFFFFE9E4);
  static const primary75 = Color(0xFFFFA498);
  static const primary50 = Color(0xFFE4002B);
  static const primary35 = Color(0xFFB10017);
  static const primary20 = Color(0xFF82000E);


  static final darkAppColors = ColorManager(primary20: primary20);
}
