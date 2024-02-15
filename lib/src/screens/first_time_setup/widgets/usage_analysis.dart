import 'package:flutter/material.dart';
import 'package:rehabox/src/widgets/goal_setter/choose_goal_screen.dart';
import 'package:rehabox/src/widgets/timer/timer_widget.dart';

class UsageAnalysisScreen extends StatelessWidget {
  final Duration timeLeft;

  const UsageAnalysisScreen({
    super.key,
    required this.timeLeft,
  });

  static const routeName = '/usage-analysis';

  @override
  Widget build(BuildContext context) {
    debugPrint('UsageAnalysisScreen.build');
    return Scaffold(
      // appBar: CustomAppBar(
      //   title: Text('You can use normaly on the first 24 hours',
      //       style: TextStyle(
      //         fontSize: 24,
      //         fontWeight: FontWeight.w700,
      //       )),
      //   appBarHeight: kAppBarHeight,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: SafeArea(
          child: Stack(
            children: [
              const Column(
                children: [
                  Text(
                    'You can use normaly on the first 24 hours',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "We will analyze the frequency and the amount of nicotine you consume in order to suggest a suitable routine.",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Center(
                child: CountdownClock(
                  duration: Duration(days: 1),
                  elapsed: Duration(days: 1) - timeLeft,
                  setup: true,
                  onFinished: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChooseGoalScreen(
                          title: "Set your first milestone",
                          recommendedTime: Duration(hours: 1),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
