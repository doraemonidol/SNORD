import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rehabox/src/models/models.dart';
import 'package:rehabox/src/screens/challenges/challenge_view_screen.dart';
import 'package:rehabox/src/screens/challenges/config.dart';
import 'package:rehabox/src/screens/challenges/controllers/challenges_controllers.dart';
import 'package:rehabox/src/utils/computation.dart';
import 'package:rehabox/src/widgets/custom_icon_button.dart';
import 'package:rehabox/src/widgets/custom_item_widget.dart';
import 'package:rehabox/src/widgets/extensions/build_context_extensions.dart';
import 'package:rehabox/src/widgets/svg_icon.dart';

class ChallengeSection extends StatelessWidget {
  const ChallengeSection({
    required this.leading,
    required this.trailing,
    required this.onTrailPressed,
    required this.active,
    required this.challenges,
    super.key,
  });

  final Widget leading;
  final Widget trailing;
  final bool active;
  final List<Challenge> challenges;
  final void Function(BuildContext context) onTrailPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: DefaultTextStyle.merge(
                style: TextStyle(
                  color: context.colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.w500,
                  fontSize: context.textScaleFactor(16),
                ),
                child: leading,
              ),
            ),
            TextButton(
              onPressed: () => onTrailPressed(context),
              child: DefaultTextStyle.merge(
                style: TextStyle(
                  color: context.colorScheme.primaryContainer,
                  fontWeight: FontWeight.w500,
                  fontSize: context.textScaleFactor(16),
                ),
                child: trailing,
              ),
            ),
          ],
        ),
        if (challenges.isEmpty)
          Text(
            'No challenges available',
            style: context.textTheme.bodyMedium,
          )
        else if (active)
          ...challenges.map(
            (challenge) => ActiveChallengeItem(
              onPressed: (context) async {
                await Navigator.pushNamed(
                  context,
                  ChallengeViewScreen.routeName,
                  arguments: challenge,
                ).then((value) {
                  value as bool;
                  if (value) {
                    debugPrint('Joining challenge');
                    context
                        .read<ChallengesControllers>()
                        .joinChallenge(challenge.id);
                  }
                });
              },
              title: challenge.name,
              subtitle: durationToString(
                diff(
                  DateTime.now(),
                  challenge.startDate.add(
                    challenge.duration,
                  ),
                ),
              ),
              points: challenge.points,
              progress: getProgress(
                DateTime.now(),
                challenge.startDate,
                challenge.duration,
              ),
            ),
          )
        else
          ...challenges.map(
            (challenge) => MoreChallengeItem(
              title: challenge.name,
              subtitle: durationToString(
                diff(
                  DateTime.now(),
                  challenge.startDate.add(
                    challenge.duration,
                  ),
                ),
              ),
              points: challenge.points,
              onAddPressed: (context) async {
                await Navigator.pushNamed(
                  context,
                  ChallengeViewScreen.routeName,
                  arguments: challenge,
                ).then((value) {
                  value as bool;
                  if (value) {
                    debugPrint('Joining challenge');
                    context
                        .read<ChallengesControllers>()
                        .joinChallenge(challenge.id);
                  }
                });
              },
            ),
          ),
      ],
    );
  }
}

class ActiveChallengeItem extends StatelessWidget {
  const ActiveChallengeItem({
    required this.title,
    required this.subtitle,
    required this.points,
    required this.progress,
    required this.onPressed,
    super.key,
  });

  final String title;
  final String subtitle;
  final int points;
  final double progress;
  final void Function(BuildContext context) onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomItemWidget(
      onPressed: onPressed,
      leading: SvgPicture.string(clockSvgString),
      title: Text(title, style: context.textTheme.titleLarge),
      subtitle: Text(
        subtitle,
        style: context.textTheme.bodyMedium?.copyWith(
          fontSize: context.textScaleFactor(16),
        ),
      ),
      trailing: Column(
        children: [
          Text(
            '$points',
            style: context.textTheme.bodyMedium?.copyWith(
              fontSize: context.textScaleFactor(16),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Points',
            style: context.textTheme.bodySmall?.copyWith(
              fontSize: context.textScaleFactor(16),
            ),
          ),
        ],
      ),
      bottom: LinearProgressIndicator(
        value: progress,
        borderRadius: BorderRadius.circular(16),
        backgroundColor: context.colorScheme.onPrimary.withOpacity(0.2),
        valueColor: AlwaysStoppedAnimation<Color>(
          context.colorScheme.primaryContainer,
        ),
      ),
    );
  }
}

class MoreChallengeItem extends StatelessWidget {
  const MoreChallengeItem({
    required this.title,
    required this.subtitle,
    required this.points,
    required this.onAddPressed,
    super.key,
  });

  final String title;
  final String subtitle;
  final int points;
  final void Function(BuildContext context) onAddPressed;

  @override
  Widget build(BuildContext context) {
    return CustomItemWidget(
      onPressed: null,
      leading: const Text(
        '🙌',
        textAlign: TextAlign.center,
      ),
      title: Text(title, style: context.textTheme.titleLarge),
      subtitle: Text(
        "$subtitle | $points Points",
        style: context.textTheme.bodyMedium?.copyWith(
          fontSize: context.textScaleFactor(16),
        ),
      ),
      trailing: CustomIconButton(
        onPressed: onAddPressed,
        icon: const SvgIcon(
          iconString: addSvgString,
        ),
      ),
    );
  }
}
