import 'package:flutter/material.dart';
import 'package:rehabox/src/screens/home/home_screen.dart';
import 'package:rehabox/src/widgets/extensions/build_context_extensions.dart';
import 'package:rehabox/src/widgets/goal_setter/timer.dart';

class ChooseGoalScreen extends StatefulWidget {
  final String title;
  final String description;
  final Duration recommendedTime;
  final Duration currentTime;
  final bool canBack;

  const ChooseGoalScreen({
    Key? key,
    required this.title,
    this.description =
        'You are restricted from consuming nicotine until the timer expires.',
    this.currentTime = const Duration(hours: 1),
    this.recommendedTime = const Duration(hours: 0),
    this.canBack = false,
  }) : super(key: key);

  // phatalways-sleeping: I added this route to unify the route names approach
  // for the app.
  static const String routeName = '/choose-goal';

  @override
  State<ChooseGoalScreen> createState() => _ChooseGoalScreenState();
}

class _ChooseGoalScreenState extends State<ChooseGoalScreen> {
  int goalValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: widget.canBack
            ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
              )
            : null,
        automaticallyImplyLeading: false,
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.black,
            fontSize: context.textScaleFactor(18),
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 24,
            right: 24,
            bottom: 20,
          ),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.description,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF686873),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TimerSetter(
                goalType: GoalType.hour,
                onChanged: (value) {
                  goalValue = value;
                  debugPrint('goalValue: $goalValue');
                },
                recommendedTime: const Duration(hours: 2),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  // debugPrint('goalValue: $goalValue');
                  // debugPrint(
                  //     'widget.currentTime.inHours: ${widget.currentTime.inHours}');
                  if (goalValue != widget.currentTime.inHours ||
                      !widget.canBack) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Are you sure?'),
                          content: const Text(
                            'You are about to set a new goal. Are you sure you want to proceed?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                ),
                              ),
                              child: const Text('Cancel',
                                  style: TextStyle(
                                    color: Color(0xFF3843FF),
                                  )),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pushNamed(
                                    context, HomeScreen.routeName);
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                  (states) {
                                    if (states
                                        .contains(MaterialState.pressed)) {
                                      return const Color(0xFF3843FF)
                                          .withOpacity(0.9);
                                    } else {
                                      return const Color(0xFF3843FF);
                                    }
                                  },
                                ),
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                ),
                              ),
                              child: const Text('Yes'),
                            ),
                          ],
                        );
                      },
                    );
                  } else if (goalValue == widget.currentTime.inHours) {
                    Navigator.pop(context);
                  }
                },
                style: ButtonStyle(
                  padding: MaterialStatePropertyAll(
                    EdgeInsets.symmetric(
                      horizontal: context.widthPercent(0.03),
                      vertical: context.heightPercent(0.02),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.resolveWith(
                    (states) {
                      if (states.contains(MaterialState.pressed)) {
                        return const Color(0xFF3843FF).withOpacity(0.9);
                      } else {
                        return const Color(0xFF3843FF);
                      }
                    },
                  ),
                  minimumSize: const MaterialStatePropertyAll(
                    Size(
                      double.infinity,
                      50,
                    ),
                  ),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
                child: Text(
                  'Go',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: context.textScaleFactor(16),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
