import 'package:flutter/material.dart';

/// con esta clase podemos customizar los colores por default del colorScheme
/// y además incluir nuevos
class ColorManager extends ThemeExtension<ColorManager> {
  ColorManager({
    required this.primary20,
  });

  final Color primary20;

  /// funcionamiento del metodo lerp
  /// cuando se cambia de un tema a otro, los colores cambian gradualmente,... de forma suave
  @override
  ThemeExtension<ColorManager> lerp(
      covariant ThemeExtension<ColorManager>? other,
      double t,
      ) {
    if (other is! ColorManager) {
      return this;
    }
    return ColorManager(
      primary20: Color.lerp(primary20, other.primary20, t)!,
    );
  }

  @override
  ThemeExtension<ColorManager> copyWith() {
    throw UnimplementedError();
  }
}