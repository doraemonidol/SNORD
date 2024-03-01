import 'package:flutter/material.dart';
import 'package:rehabox/src/widgets/extensions/build_context_extensions.dart';

class SlidingContainer extends StatelessWidget {
  const SlidingContainer({
    required this.image,
    required this.header,
    required this.footer,
    super.key,
  });

  final Widget image;
  final String header;
  final String footer;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.widthPercent(0.05),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: context.heightPercent(0.5),
            child: Center(child: image),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              header,
              style: context.textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 45,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              footer,
              style: context.textTheme.bodyMedium?.copyWith(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
