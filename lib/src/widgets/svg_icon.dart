import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon({
    required this.iconString,
    this.size = 28,
    super.key,
  });

  final String iconString;

  final double size;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      iconString,
      width: size,
      height: size,
      // colorFilter: const ColorFilter.srgbToLinearGamma(),
    );
  }
}
