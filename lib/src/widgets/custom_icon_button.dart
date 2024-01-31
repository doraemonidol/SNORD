import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    required this.icon,
    this.onPressed,
    this.color,
    super.key,
  });

  final void Function(BuildContext context)? onPressed;

  final Widget icon;

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed != null ? () => onPressed!(context) : null,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.all(
            12,
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          color ?? Colors.transparent,
        ),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
        ),
        side: MaterialStateProperty.all(
          const BorderSide(
            color: Color(0xFFEAECF0),
            width: 1,
          ),
        ),
      ),
      icon: icon,
    );
  }
}
