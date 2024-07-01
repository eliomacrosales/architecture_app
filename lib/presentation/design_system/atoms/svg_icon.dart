import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIcon extends StatelessWidget {
  final String assetsIcon;
  final double width;
  final double height;
  final Color? color;

  const SvgIcon({
    required this.assetsIcon,
    this.color,
    super.key,
    this.height = 20.0,
    this.width = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetsIcon,
      width: width,
      height: height,
      colorFilter: color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
    );
  }
}
