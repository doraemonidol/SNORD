import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rehabox/src/screens/home/controllers/home_controllers.dart';
import 'package:rehabox/src/screens/timer/config.dart';
import 'package:rehabox/src/utils/computation.dart';
import 'package:rehabox/src/widgets/custom_app_bar.dart';
import 'package:rehabox/src/widgets/custom_icon_button.dart';
import 'package:rehabox/src/widgets/extensions/build_context_extensions.dart';
import 'package:rehabox/src/widgets/profile_tabs.dart';
import 'package:rehabox/src/widgets/svg_icon.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    this.appBarHeight = 180,
    super.key,
  });

  final double appBarHeight;

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      appBarHeight: appBarHeight,
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Hi, Ben! 👋🏻\n',
              style: context.textTheme.titleMedium,
            ),
            TextSpan(
              text: "Let's embrace a new lifestyle, together.",
              style: context.textTheme.bodySmall,
            ),
          ],
        ),
      ),
      actions: [
        CustomIconButton(
          onPressed: (context) {},
          icon: const SvgIcon(iconString: notificationSvgString),
        ),
        SizedBox(
          width: context.widthPercent(0.03) + 8,
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight * 0.3),
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: context.widthPercent(0.03) + 8,
            vertical: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Selector<HomeControllers, TabState>(
                selector: (context, controller) => controller.state.tabState,
                builder: (context, tabState, child) => SwitchingTabs(
                  tabs: const [
                    'Daily',
                    'Weekly',
                    'Monthly',
                  ],
                  onTabChange: (context, index) async {
                    await context.read<HomeControllers>().changeTabState(
                          index == 0
                              ? TabState.daily
                              : index == 1
                                  ? TabState.weekly
                                  : TabState.monthly,
                        );
                    // context.read<HomeControllers>().fetchData();
                  },
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Selector<HomeControllers, TabState>(
                selector: (context, controller) => controller.state.tabState,
                builder: (context, value, child) => Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (value == TabState.monthly)
                            Text(
                              'Month',
                              style: context.textTheme.titleMedium,
                            )
                          else
                            Text(
                              'This Week',
                              style: context.textTheme.titleMedium,
                            ),
                          const SizedBox(
                            height: 8,
                          ),
                          if (value != TabState.monthly)
                            Selector<HomeControllers, DateTime>(
                              selector: (context, controller) =>
                                  controller.state.endDate,
                              builder: (context, endDate, child) {
                                final endDateString =
                                    "${endDate.day} ${mapMonth(endDate.month).substring(0, 3)}";
                                final startDateString =
                                    "${endDate.subtract(const Duration(days: 6)).day} ${mapMonth(endDate.subtract(const Duration(days: 6)).month).substring(0, 3)}";
                                return Text(
                                  '$startDateString - $endDateString',
                                  style: context.textTheme.bodyMedium,
                                );
                              },
                            )
                          else
                            Selector<HomeControllers, int?>(
                              selector: (context, controller) =>
                                  controller.state.selectedMonth,
                              builder: (context, endDate, child) {
                                return Text(
                                  mapMonth(endDate!),
                                  style: context.textTheme.bodyMedium,
                                );
                              },
                            ),
                        ],
                      ),
                    ),
                    CustomIconButton(
                      onPressed: (context) {
                        if (TabState.monthly == value) {
                          context.read<HomeControllers>().previousMonth();
                        } else {
                          context.read<HomeControllers>().previousWeek();
                        }
                      },
                      icon: const Icon(Icons.navigate_before_rounded),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    CustomIconButton(
                      onPressed: (context) {
                        if (TabState.monthly == value) {
                          context.read<HomeControllers>().nextMonth();
                        } else {
                          context.read<HomeControllers>().nextWeek();
                        }
                      },
                      icon: const Icon(Icons.navigate_next_rounded),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
