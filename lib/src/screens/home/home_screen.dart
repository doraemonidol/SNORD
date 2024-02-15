import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rehabox/src/screens/home/controllers/home_controllers.dart';
import 'package:rehabox/src/screens/home/widgets/daily_chart.dart';
import 'package:rehabox/src/screens/home/widgets/date_button.dart';
import 'package:rehabox/src/screens/home/widgets/home_app_bar.dart';
import 'package:rehabox/src/screens/home/widgets/weekly_chart.dart';
import 'package:rehabox/src/utils/computation.dart';
import 'package:rehabox/src/utils/conditional_render_manager.dart';
import 'package:rehabox/src/widgets/extensions/build_context_extensions.dart';
import 'package:rehabox/src/widgets/navigation_bar/custom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeControllers()..fetchData(),
      child: Consumer<HomeControllers>(
        builder: conditionalRenderManager<HomeControllers>(
          onInitial: (BuildContext context) => Scaffold(
            appBar: const HomeAppBar(),
            body: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: min(context.heightPercent(0.10), 80),
                    child: Selector<HomeControllers, DateTime>(
                      selector:
                          (BuildContext context, HomeControllers controller) =>
                              controller.state.endDate,
                      builder: (BuildContext context, DateTime endDate,
                              Widget? child) =>
                          ListView.separated(
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(
                          top: 12,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            Selector<HomeControllers, DateTime?>(
                          selector: (context, controller) =>
                              controller.state.selectedDate,
                          builder: (context, selectedDate, child) {
                            final date =
                                endDate.subtract(Duration(days: index));
                            final isSelected = selectedDate != null &&
                                matchDate(date, selectedDate);
                            return DateButton(
                              date: date,
                              onTap: (context) {
                                context
                                    .read<HomeControllers>()
                                    .selectDate(date);
                                context
                                    .read<HomeControllers>()
                                    .fetchData();
                              },
                              isSelected: isSelected,
                            );
                          },
                        ),
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 10),
                        itemCount: 7,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Selector<HomeControllers, DateTime?>(
                    builder:
                        (BuildContext context, DateTime? value, Widget? child) {
                      if (value == null) {
                        return const SizedBox();
                      }
                      return Selector<HomeControllers, TabState>(
                        selector: (context, controller) =>
                            controller.state.tabState,
                        builder: (context, tabState, child) {
                          switch (tabState) {
                            case TabState.daily:
                              return const DailyChart();
                            case TabState.weekly:
                              return const WeeklyChart();
                            case TabState.monthly:
                              return Container();
                          }
                        },
                      );
                    },
                    selector:
                        (BuildContext context, HomeControllers controller) =>
                            controller.state.selectedDate,
                  ),
                ],
              ),
            ),
            extendBody: true,
            bottomNavigationBar: const CustomNavigationBar(),
          ),
        ),
      ),
    );
  }
}
