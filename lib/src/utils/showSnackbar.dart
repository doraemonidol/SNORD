import 'package:flutter/material.dart';
import 'package:rehabox/src/theme/themedata.dart';

void showSnackBar(BuildContext context, String text, {Color? color}) {
  if (color == null) {
    color = theme.colorScheme.error;
  }
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: color,
    ),
  );
}
