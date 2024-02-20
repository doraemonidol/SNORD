import 'dart:async';

import 'package:flutter/material.dart';

class DebounceButton extends StatefulWidget {
  const DebounceButton({
    required this.onPressed,
    required this.title,
    this.style,
    this.duration = const Duration(milliseconds: 500),
    super.key,
  });

  final Duration duration;
  final void Function(BuildContext context) onPressed;
  final Widget title;
  final ButtonStyle? style;

  @override
  State<DebounceButton> createState() => _DebounceButtonState();
}

class _DebounceButtonState extends State<DebounceButton> {
  Timer? _debounce;

  void _onPressed() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(widget.duration, () {
      widget.onPressed(context);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _onPressed,
      style: widget.style,
      child: widget.title,
    );
  }
}
