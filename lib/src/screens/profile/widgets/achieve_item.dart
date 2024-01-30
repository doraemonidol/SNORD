import 'package:flutter/material.dart';
import 'package:rehabox/src/screens/profile/widgets/config.dart';
import 'package:rehabox/src/widgets/extensions/build_context_extensions.dart';
import 'package:rehabox/src/widgets/svg_icon.dart';

class AchieveItem extends StatelessWidget {
  const AchieveItem({
    required this.title,
    required this.subtitle,
    this.leading,
    this.trailing,
    super.key,
  });

  final Widget? leading;
  final Widget title;
  final Widget subtitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Row(
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
      ),
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  const _CustomIconButton({
    required this.iconString,
    this.shape,
    this.backgroundColor,
    this.onPressed,
  });

  final void Function(BuildContext context)? onPressed;

  final String iconString;

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
      icon: SvgIcon(
        iconString: iconString,
      ),
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
      iconString: filterActivitySvgString,
      onPressed: onPressed,
    );
  }
}

class PointsEarnedButton extends StatelessWidget {
  const PointsEarnedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const _CustomIconButton(
      iconString: pointsEarnedSvgString,
    );
  }
}

class PointsDeducedButton extends StatelessWidget {
  const PointsDeducedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const _CustomIconButton(
      iconString: pointsDeducedSvgString,
    );
  }
}

class ChallengeCompletedButton extends StatelessWidget {
  const ChallengeCompletedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const _CustomIconButton(
      iconString: challengeCompletedSvgString,
    );
  }
}

class RunningAchievementButton extends StatelessWidget {
  const RunningAchievementButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const _CustomIconButton(
      iconString: runningAchievementSvgString,
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
      iconString: goldMedalAchievementSvgString,
      shape: OvalBorder(),
      backgroundColor: Color(0xFFFFF3DA),
    );
  }
}
