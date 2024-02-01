import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rehabox/src/screens/profile/widgets/config.dart';
import 'package:rehabox/src/widgets/extensions/build_context_extensions.dart';

class CustomItemWidget extends StatelessWidget {
  const CustomItemWidget({
    required this.title,
    required this.subtitle,
    this.leading,
    this.trailing,
    this.bottom,
    this.onPressed,
    super.key,
  });

  final Widget? leading;
  final Widget title;
  final Widget subtitle;
  final Widget? trailing;
  final Widget? bottom;
  final void Function(BuildContext context)? onPressed;

  @override
  Widget build(BuildContext context) {
    final innerChild = Row(
      children: [
        if (leading != null) ...[
          leading!,
          const SizedBox(width: 16),
        ],
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title,
              const SizedBox(height: 4),
              subtitle,
            ],
          ),
        ),
        if (trailing != null) ...[
          trailing!,
        ],
      ],
    );
    final child = bottom != null
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [innerChild, const SizedBox(height: 8), bottom!],
          )
        : innerChild;
    return InkWell(
      onTap: onPressed != null ? () => onPressed!(context) : null,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFEAECF0)),
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
        child: child,
      ),
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  const _CustomIconButton({
    required this.icon,
    this.shape,
    this.backgroundColor,
    this.onPressed,
  });

  final void Function(BuildContext context)? onPressed;

  final Widget icon;

  final OutlinedBorder? shape;

  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed != null ? () => onPressed!(context) : null,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.all(
            10,
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          backgroundColor ?? Colors.transparent,
        ),
        shape: MaterialStateProperty.all(
          shape ??
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

class ActivityFilterButton extends StatelessWidget {
  const ActivityFilterButton({
    this.onPressed,
    super.key,
  });

  final void Function(BuildContext context)? onPressed;

  @override
  Widget build(BuildContext context) {
    return _CustomIconButton(
      icon: SvgPicture.string(filterActivitySvgString),
      onPressed: onPressed,
    );
  }
}

class PointsEarnedButton extends StatelessWidget {
  const PointsEarnedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return _CustomIconButton(
      icon: SvgPicture.string(pointsEarnedSvgString),
    );
  }
}

class PointsDeductedButton extends StatelessWidget {
  const PointsDeductedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return _CustomIconButton(
      icon: SvgPicture.string(pointsDeducedSvgString),
    );
  }
}

class ChallengeCompletedButton extends StatelessWidget {
  const ChallengeCompletedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return _CustomIconButton(
      icon: SvgPicture.string(challengeCompletedSvgString),
    );
  }
}

class RunningAchievementButton extends StatelessWidget {
  const RunningAchievementButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const _CustomIconButton(
      icon: Text(
        '🏃🏻‍♂️',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFF040415),
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      shape: OvalBorder(),
      backgroundColor: Color(0xFFDDF2FC),
    );
  }
}

class GoldMedalAchievementButton extends StatelessWidget {
  const GoldMedalAchievementButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const _CustomIconButton(
      icon: Text(
        '🥇',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFF040415),
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      shape: OvalBorder(),
      backgroundColor: Color(0xFFFFF3DA),
    );
  }
}
