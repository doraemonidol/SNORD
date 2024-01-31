import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rehabox/src/screens/settings/config.dart';
import 'package:rehabox/src/widgets/extensions/build_context_extensions.dart';

class OptionItem extends StatelessWidget {
  const OptionItem({
    required this.svgIconString,
    required this.title,
    this.onTap,
    super.key,
  });

  final String svgIconString;
  final String title;
  final void Function(BuildContext context)? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap != null ? () => onTap!(context) : null,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: context.widthPercent(0.01),
            vertical: 10,
          ),
          alignment: Alignment.center,
          child: Row(
            children: [
              SvgPicture.string(svgIconString),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: const Color(0xFF040415),
                    fontSize: context.textScaleFactor(16),
                    fontWeight: FontWeight.w500,
                    height: 0.10,
                  ),
                ),
              ),
              SvgPicture.string(nextSvgString)
            ],
          ),
        ),
      ),
    );
  }
}

class OptionsGroup extends StatelessWidget {
  const OptionsGroup({
    required this.title,
    required this.options,
    super.key,
  });

  final String title;
  final List<Widget> options;

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];
    for (int i = 0; i < options.length; i++) {
      children.add(options[i]);
      if (i != options.length - 1) {
        children.add(const SizedBox(height: 8));
        children.add(
          const Divider(
            color: Color(0xFFEAECF0),
            height: 1,
          ),
        );
      }
    }
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title.toUpperCase(),
            style: TextStyle(
              color: const Color(0xFF9B9BA1),
              fontSize: context.textScaleFactor(14),
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: context.widthPercent(0.01),
            vertical: 8,
          ),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFFEAECF0)),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }
}
