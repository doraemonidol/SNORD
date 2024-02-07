import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rehabox/src/models/models.dart';
import 'package:rehabox/src/repositories/repositories.dart';
import 'package:rehabox/src/repositories/timer_activity_repository/timer_activity_repository_interface.dart';
import 'package:rehabox/src/screens/timer/config.dart';
import 'package:rehabox/src/screens/timer/controllers/timer_controllers.dart';
import 'package:rehabox/src/screens/timer/screens/set_timer_screen.dart';
import 'package:rehabox/src/screens/timer/screens/timer_shimmer_screen.dart';
import 'package:rehabox/src/screens/timer/widgets/set_new_goal_button.dart';
import 'package:rehabox/src/utils/conditional_render_manager.dart';
import 'package:rehabox/src/widgets/custom_app_bar.dart';
import 'package:rehabox/src/widgets/custom_icon_button.dart';
import 'package:rehabox/src/widgets/extensions/build_context_extensions.dart';
import 'package:rehabox/src/widgets/navigation_bar/custom_nav_bar.dart';
import 'package:rehabox/src/widgets/svg_icon.dart';
import 'package:rehabox/src/widgets/timer/timer_widget.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  static const routeName = '/timer';

  @override
  Widget build(BuildContext context) {
    debugPrint('TimerScreen.build');
    return ChangeNotifierProvider(
      create: (context) => TimerControllers(
        userRepository: context.read<UserRepositoryInterface>(),
        timerActivityRepository:
            context.read<TimerActivityRepositoryInterface>(),
      )..fetchLatestTimerActivity(),
      child: Consumer<TimerControllers>(
        builder: conditionalRenderManager<TimerControllers>(
          onInitial: (BuildContext context) => const TimerShimmerScreen(),
          onLoaded: (context) => Scaffold(
            appBar: CustomAppBar(
              title: CustomIconButton(
                icon: const SvgIcon(
                  iconString: calendarSvgString,
                ),
                onPressed: (context) {},
              ),
              actions: [
                CustomIconButton(
                  icon: const SvgIcon(
                    iconString: notificationSvgString,
                  ),
                  onPressed: (context) {},
                ),
                SizedBox(width: context.widthPercent(0.03) + 8),
              ],
              appBarHeight: kAppBarHeight,
            ),
            body: Center(
              child: Selector<TimerControllers, TimerActivity?>(
                selector: (context, timerControllers) =>
                    timerControllers.state.timerActivity,
                builder: (context, value, child) {
                  if (value == null) {
                    return const Text('No timer activity');
                  }
                  return CountdownClock(
                    duration: value.expectedDuration,
                    elapsed: DateTime.now().difference(value.startAt),
                  );
                },
              ),
            ),
            bottomNavigationBar: Selector<TimerControllers, bool?>(
              selector: (context, timerControllers) =>
                  timerControllers.state.exceedExpectedDuration,
              builder: (context, value, child) {
                debugPrint('TimerScreen.bottomNavigationBar.builder');
                if (value == null) return const CustomNavigationBar();
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (value)
                      SetNewGoalButton(
                        onPressed: (context) async {
                          await context
                              .read<TimerControllers>()
                              .claimAndCloseTimer()
                              .then(
                            (value) {
                              Navigator.pushReplacementNamed(
                                context,
                                SetTimerScreen.routeName,
                              );
                            },
                          );
                        },
                      )
                    else
                      const ChangeTimerButton(),
                    const CustomNavigationBar(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ChangeTimerButton extends StatelessWidget {
  const ChangeTimerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Show warning before changing timer

        // Delete current timer activity

        // Navigate to change timer screen
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          context.colorScheme.onErrorContainer,
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            vertical: context.heightPercent(0.02),
            horizontal: context.widthPercent(0.1),
          ),
        ),
        minimumSize: MaterialStatePropertyAll(
          Size(
            context.widthPercent(0.5),
            70,
          ),
        ),
        maximumSize: MaterialStatePropertyAll(
          Size(
            context.widthPercent(0.8),
            70,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
      child: Text(
        'Change timer',
        style: context.textTheme.bodyLarge?.copyWith(
          color: context.colorScheme.onError,
        ),
      ),
    );
  }
}
