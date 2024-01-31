import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rehabox/src/screens/coupons/config.dart';
import 'package:rehabox/src/widgets/custom_icon_button.dart';
import 'package:rehabox/src/widgets/custom_item_widget.dart';

class StreakSaverCoupon extends StatelessWidget {
  const StreakSaverCoupon({
    required this.points,
    required this.onCollected,
    super.key,
  });

  final int points;
  final void Function(BuildContext context) onCollected;

  @override
  Widget build(BuildContext context) {
    return CustomItemWidget(
      title: const Text(
        'Streak Saver',
        style: TextStyle(
          color: Color(0xFF040415),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        '$points Points',
        style: const TextStyle(
          color: Color(0xFF9B9BA1),
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
      leading: const CustomIconButton(
        color: Color(0xFFF3F4F6),
        icon: Text(
          '💠',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF040415),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      trailing: CustomIconButton(
        icon: SvgPicture.string(
          collectCouponsSvgString,
        ),
        onPressed: onCollected,
      ),
    );
  }
}

class TimeDeductedCoupon extends StatelessWidget {
  const TimeDeductedCoupon({
    required this.points,
    required this.onCollected,
    super.key,
  });

  final int points;
  final void Function(BuildContext context) onCollected;

  @override
  Widget build(BuildContext context) {
    return CustomItemWidget(
      title: const Text(
        'Streak Saver',
        style: TextStyle(
          color: Color(0xFF040415),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        '$points Points',
        style: const TextStyle(
          color: Color(0xFF9B9BA1),
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
      leading: const CustomIconButton(
        color: Color(0xFFF3F4F6),
        icon: Text(
          '🔰',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF040415),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      trailing: CustomIconButton(
        icon: SvgPicture.string(
          collectCouponsSvgString,
        ),
        onPressed: onCollected,
      ),
    );
  }
}
