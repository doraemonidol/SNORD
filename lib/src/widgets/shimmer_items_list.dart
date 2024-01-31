import 'package:flutter/material.dart';
import 'package:rehabox/src/screens/profile/widgets/config.dart';
import 'package:rehabox/src/widgets/extensions/build_context_extensions.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerItemsList extends StatelessWidget {
  const ShimmerItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    final widgets =  [
        for (var i = 0; i < 4; i++)
          Shimmer.fromColors(
            baseColor: baseColor,
            highlightColor: highlightColor,
            child: Container(
              height: context.heightPercent(0.12),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x0F222C5C),
                    blurRadius: 68,
                    offset: Offset(58, 26),
                    spreadRadius: 0,
                  )
                ],
              ),
              padding: EdgeInsets.symmetric(
                horizontal: context.widthPercent(0.04),
                vertical: context.heightPercent(0.02),
              ),
            ),
          ),
      ];

    final widgetsWithSeparators = <Widget>[];

    for (var i = 0; i < widgets.length; i++) {
      widgetsWithSeparators.add(widgets[i]);
      if (i != widgets.length - 1) {
        widgetsWithSeparators.add(const SizedBox(height: 16));
      }
    }
    return Column(
      children: widgetsWithSeparators,
    );
  }
}