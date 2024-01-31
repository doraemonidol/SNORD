import 'package:flutter/material.dart';

class SlideAnimatingBox extends StatefulWidget {
  const SlideAnimatingBox({
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeInOut,
    this.begin = 0.0,
    this.end = 1.0,
    super.key,
  });

  final Widget child;
  final Duration duration;
  final Curve curve;
  final double begin;
  final double end;

  @override
  State<SlideAnimatingBox> createState() => _SlideAnimatingBoxState();
}

class _SlideAnimatingBoxState extends State<SlideAnimatingBox>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: widget.duration,
  );

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: widget.curve,
  );

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(
            // Default is from left to right
            (widget.end - widget.begin) * _animation.value,
            0.0,
          ),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
