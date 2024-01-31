import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  Size get size => MediaQuery.sizeOf(this);

  double get width => size.width;

  double get height => size.height;

  double widthPercent(double percent) => width * percent;

  double heightPercent(double percent) => height * percent;

  bool isMobile([double width = 600]) => size.width < width;

  bool isTablet([double width = 950]) =>
      size.width >= width && size.width < 1200;

  bool isDesktop([double width = 1200]) => size.width >= width;

  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  ColorScheme get colorScheme => theme.colorScheme;

  double textScaleFactor(double fontSize) =>
      MediaQuery.textScalerOf(this).scale(fontSize);
}
