import 'package:flutter/material.dart';
import 'package:rehabox/src/widgets/animated_box/slide_animating_box.dart';

class AnimatedPageRoute extends MaterialPageRoute {
  AnimatedPageRoute({
    required Widget child,
  }) : super(
          builder: (BuildContext context) => SlideAnimatingBox(child: child),
        );
}
