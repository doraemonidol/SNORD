import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rehabox/src/screens/profile/controllers/user_profile_provider.dart';
import 'package:rehabox/src/screens/profile/widgets/config.dart';
import 'package:rehabox/src/widgets/extensions/build_context_extensions.dart';
import 'package:shimmer/shimmer.dart';

class TabItem extends StatelessWidget {
  const TabItem({
    required this.title,
    required this.isSelected,
    super.key,
  });

  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 3),
      alignment: Alignment.center,
      height: context.heightPercent(0.035),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: ShapeDecoration(
        color: Colors.transparent,
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
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? const Color(0xFF6B73FF) : const Color(0xFF686873),
          fontWeight: FontWeight.w700,
          fontSize: context.textScaleFactor(16),
        ),
      ),
    );
  }
}
