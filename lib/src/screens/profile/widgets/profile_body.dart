import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rehabox/src/models/User/userAchievement.dart';
import 'package:rehabox/src/models/models.dart';
import 'package:rehabox/src/screens/profile/controllers/user_profile_provider.dart';
import 'package:rehabox/src/widgets/custom_item_widget.dart';
import 'package:rehabox/src/screens/profile/widgets/achieve_item_list.dart';
import 'package:rehabox/src/screens/profile/widgets/config.dart';
import 'package:rehabox/src/widgets/extensions/build_context_extensions.dart';
import 'package:rehabox/src/widgets/shimmer_items_list.dart';
import 'package:shimmer/shimmer.dart';

class _BodyTemplate extends StatelessWidget {
  const _BodyTemplate({
    this.title,
    this.body,
    this.isLoading = false,
    this.actions,
  });

  final Widget? title;

  final List<Widget>? actions;

  final Widget? body;

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Shimmer.fromColors(
                baseColor: baseColor,
                highlightColor: highlightColor,
                child: Container(
                  width: 100,
                  height: 14,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              if (actions != null) ...actions!,
            ],
          ),
          const SizedBox(height: 16),
          const ShimmerItemsList(),
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: title ?? const SizedBox.shrink(),
            ),
            if (actions != null) ...actions!,
          ],
        ),
        const SizedBox(height: 16),
        body ?? const SizedBox.shrink(),
      ],
    );
  }
}

class ShimmerActivityBody extends StatelessWidget {
  const ShimmerActivityBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const _BodyTemplate(
      isLoading: true,
    );
  }
}

class ActivityBody extends StatelessWidget {
  const ActivityBody({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('ActivityBody.build');
    return _BodyTemplate(
      title: Text(
        'Showing last month activity',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: context.textScaleFactor(14),
        ),
      ),
      actions: const [
        ActivityFilterButton(),
      ],
      body: Selector<UserProfileProvider, List<Activity>>(
        builder: (BuildContext context, List<Activity> value, Widget? child) =>
            AchieveItemList(
          data: value
              .map((e) => {
                    'title': e.name,
                    'subtitle': e.date.toIso8601String(),
                    'trailing': const PointsEarnedButton(),
                  })
              .toList(),
        ),
        selector: (BuildContext context, UserProfileProvider controller) =>
            controller.state.user?.activities ?? [],
      ),
    );
  }
}

class AchievementsBody extends StatelessWidget {
  const AchievementsBody({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('AchievementsBody.build');
    return Selector<UserProfileProvider, List<UserAchievement>>(
      builder:
          (BuildContext context, List<UserAchievement> value, Widget? child) =>
              _BodyTemplate(
        title: Text(
          '${value.length} Achievements',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: context.textScaleFactor(14),
          ),
        ),
        body: AchieveItemList(
          data: value
              .map((e) => {
                    'title': e.name,
                    'subtitle': e.date.toIso8601String(),
                    'leading': const RunningAchievementButton(),
                  })
              .toList(),
        ),
      ),
      selector: (BuildContext context, UserProfileProvider controller) =>
          controller.state.user?.achievements ?? [],
    );
  }
}
