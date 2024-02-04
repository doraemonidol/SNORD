import 'package:flutter/material.dart';
import 'package:rehabox/src/screens/first_time_setup/widgets/timer_tabs.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

enum GoalType { hour, day, month }

class GoalCategory {
  final String time;
  final int min;
  final int max;
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
          min: 1,
          max: 24,
          type: GoalType.hour,
        ),
        GoalCategory(
          time: 'day',
          min: 1,
          max: 30,
          type: GoalType.day,
        ),
        GoalCategory(
          time: 'month',
          min: 1,
          max: 12,
          type: GoalType.month,
        ),
      ];
}

class TimerSetting extends StatefulWidget {
  final double initialValue;
  final GoalType goalType;
  final Duration recommendedTime;
  final Function(int) onChanged;

  TimerSetting({
    required this.initialValue,
    required this.goalType,
    required this.onChanged,
    this.recommendedTime = const Duration(hours: 0),
  });

  @override
  State<TimerSetting> createState() => _TimerSettingState();
}

class _TimerSettingState extends State<TimerSetting>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController = TabController(
    length: 3,
    vsync: this,
  );

  String printDuration(Duration duration) {
    if (duration.inDays > 30) {
      return '${duration.inDays ~/ 30} months';
    } else if (duration.inDays > 0) {
      return '${duration.inDays} days';
    } else {
      return '${duration.inHours} hours';
    }
  }

  @override
  void initState() {
    _tabController.index = widget.goalType.index;
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
                    _tabController.index = index;
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
                onChangeStart: (double value) {},
                onChangeEnd: (double value) {},
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
                          widget.onChanged(time);
                          return '$time';
                        }),
                    startAngle: 270,
                    angleRange: 359,
                    size: 270.0),
                min: GoalCategory.goalCategories[_tabController.index].min
                    .toDouble(),
                max: GoalCategory.goalCategories[_tabController.index].max
                        .toDouble() +
                    1,
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
                            onPressed: () {},
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
