import 'package:flutter/material.dart';
import 'package:rehabox/src/screens/first_time_setup/widgets/timer_tabs.dart';
import 'package:rehabox/src/widgets/sleek_circular_slider/appearance.dart';
import 'package:rehabox/src/widgets/sleek_circular_slider/circular_slider.dart';

enum GoalType { hour, day, month }

class GoalCategory {
  final String time;
  final double min;
  final double max;
  final GoalType type;

  GoalCategory({
    required this.time,
    required this.min,
    required this.max,
    required this.type,
  });

  static List<GoalCategory> get goalCategories => [
        GoalCategory(
          time: 'hour',
          min: 0.1,
          max: 24,
          type: GoalType.hour,
        ),
        GoalCategory(
          time: 'day',
          min: 0.1,
          max: 30,
          type: GoalType.day,
        ),
        GoalCategory(
          time: 'month',
          min: 0.1,
          max: 12,
          type: GoalType.month,
        ),
      ];
}

class TimerSetter extends StatefulWidget {
  double initialValue;
  final GoalType goalType;
  final Duration recommendedTime;
  final Function(int) onChanged;

  TimerSetter({
    required this.initialValue,
    required this.goalType,
    required this.onChanged,
    this.recommendedTime = const Duration(hours: 0),
  });

  @override
  State<TimerSetter> createState() => _TimerSetterState();
}

class _TimerSetterState extends State<TimerSetter>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController = TabController(
    length: 3,
    vsync: this,
  );
  List<double> initialValue = [1, 1, 1, 1];
  Key sliderKey = UniqueKey();

  String printDuration(Duration duration) {
    String ans = '';
    if (duration.inDays > 30) {
      ans = '${duration.inDays ~/ 30} month';
      if (duration.inDays > 60) ans += 's';
    } else if (duration.inDays > 0) {
      ans = '${duration.inDays} day';
      if (duration.inDays > 1) ans += 's';
    } else {
      ans = '${duration.inHours} hour';
      if (duration.inHours > 1) ans += 's';
    }

    return ans;
  }

  // double changeValue(double value, int current, int next) {
  //   debugPrint('Change Value: $value from $current to $next');
  //   double currentAngle = value / GoalCategory.goalCategories[current].max;
  //   double nextAngle = currentAngle * GoalCategory.goalCategories[next].max;
  //   debugPrint('Next Angle: $nextAngle');
  //   return nextAngle < 1
  //       ? 1
  //       : nextAngle > GoalCategory.goalCategories[next].max
  //           ? GoalCategory.goalCategories[next].max
  //           : nextAngle;
  // }

  @override
  void initState() {
    _tabController.index = widget.goalType.index;
    initialValue = [1, 1, 1, 1];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.white, Colors.white],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            tileMode: TileMode.clamp),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Color(0x0F222C5C),
            blurRadius: 68,
            offset: Offset(58, 26),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
          top: 28,
          bottom: 20,
        ),
        child: Center(
          child: Column(
            children: [
              Material(
                color: const Color(0xFFEAECF0),
                borderRadius: BorderRadius.circular(24),
                child: TabBar(
                  indicatorWeight: 1,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 2,
                  ),
                  onTap: (int index) {
                    // firstSet = true;
                    widget.initialValue = initialValue[index];
                    widget.onChanged(initialValue[index].toInt());
                    _tabController.index = index;
                    debugPrint('Start Switching');

                    setState(() {});
                  },
                  splashBorderRadius: BorderRadius.circular(16),
                  controller: _tabController,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorPadding: const EdgeInsets.all(0),
                  labelPadding: const EdgeInsets.all(0),
                  labelColor: Colors.white,
                  tabs: [
                    TabItem(
                      title: 'Hours',
                      isSelected: _tabController.index == 0,
                    ),
                    TabItem(
                      title: 'Days',
                      isSelected: _tabController.index == 1,
                    ),
                    TabItem(
                      title: 'Months',
                      isSelected: _tabController.index == 2,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              SleekCircularSlider(
                key: sliderKey,
                onChangeStart: (double value) {},
                onChangeEnd: (double value) {},
                onChange: (double value) {
                  debugPrint('Onchanged Value: $value');
                  initialValue[_tabController.index] = value;
                  widget.onChanged(value.toInt());
                },
                appearance: CircularSliderAppearance(
                    customWidths: CustomSliderWidths(
                      trackWidth: 45,
                      progressBarWidth: 45,
                      shadowWidth: 70,
                      handlerSize: 22,
                    ),
                    customColors: CustomSliderColors(
                        dotColor: Colors.white,
                        trackColors: [
                          Color(0xFFE8E8E8),
                          Color(0xFFF0F0F0),
                        ],
                        progressBarColors: [
                          Color(0xFF3843FF),
                          Color(0xFF6069FF)
                        ],
                        shadowColor: Color(0xFF3843FF),
                        shadowMaxOpacity: 0.2),
                    infoProperties: InfoProperties(
                        bottomLabelStyle: TextStyle(
                            color: Color(0xFF040415),
                            fontSize: 24,
                            fontWeight: FontWeight.w600),
                        bottomLabelText: GoalCategory
                            .goalCategories[_tabController.index].time,
                        mainLabelStyle: TextStyle(
                          color: Color(0xFF040415),
                          fontSize: 96.0,
                          fontWeight: FontWeight.w600,
                          height: 0.9,
                        ),
                        modifier: (double value) {
                          int time = value.round();
                          return '$time';
                        }),
                    startAngle: 270,
                    angleRange: 359,
                    size: 270.0),
                min: GoalCategory.goalCategories[_tabController.index].min,
                max: GoalCategory.goalCategories[_tabController.index].max,
                initialValue: widget.initialValue,
              ),
              ...(widget.recommendedTime.inHours > 0
                  ? [
                      const SizedBox(height: 32),
                      Row(
                        children: [
                          Text(
                            'Recommend:  ',
                            style: TextStyle(
                              color: Color(0xFF040415),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            printDuration(widget.recommendedTime),
                            style: TextStyle(
                              color: Color(0xFF040415),
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Spacer(),
                          OutlinedButton(
                            onPressed: () {
                              if (widget.recommendedTime.inDays > 30) {
                                widget.initialValue =
                                    widget.recommendedTime.inDays / 30;
                                _tabController.index = 2;
                              } else if (widget.recommendedTime.inDays > 0) {
                                widget.initialValue =
                                    widget.recommendedTime.inDays.toDouble();
                                _tabController.index = 1;
                              } else {
                                widget.initialValue =
                                    widget.recommendedTime.inHours.toDouble();
                                _tabController.index = 0;
                              }
                              initialValue[_tabController.index] =
                                  widget.initialValue;
                              widget.onChanged(widget.initialValue.toInt());
                              // sliderKey = UniqueKey();
                              setState(() {});
                            },
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                                vertical: 24,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(64),
                              ),
                              minimumSize: Size(
                                100,
                                50,
                              ),
                            ),
                            child: Text(
                              'Set',
                              style: TextStyle(
                                color: Color(0xFF040415),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]
                  : []),
            ],
          ),
        ),
      ),
    );
  }
}
