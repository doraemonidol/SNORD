import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rehabox/src/screens/home/controllers/home_controllers.dart';
import 'package:rehabox/src/screens/home/widgets/chart.dart';
import 'package:rehabox/src/screens/profile/widgets/config.dart';
import 'package:rehabox/src/widgets/custom_icon_button.dart';
import 'package:rehabox/src/widgets/extensions/build_context_extensions.dart';
import 'package:shimmer/shimmer.dart';

class WeeklyChart extends StatelessWidget {
  const WeeklyChart({super.key});

  Widget bottomTitleWidgets(
    BuildContext context,
    double value,
    TitleMeta meta,
  ) {
    final style = context.textTheme.titleSmall?.copyWith(
      color: const Color(0XFF9B9BA1),
    );
    Widget text = value.toInt() % 2 != 0
        ? Text(
            '${value.toInt()}',
            style: style,
            textAlign: TextAlign.center,
          )
        : Container();

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Selector<HomeControllers, List<double>?>(
      builder: (BuildContext context, List<double>? value, Widget? child) {
        if (value == null) {
          return Shimmer.fromColors(
            baseColor: baseColor,
            highlightColor: highlightColor,
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: context.widthPercent(0.03),
              ),
              height: context.heightPercent(0.20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
            ),
          );
        }
        final spots = List<FlSpot>.empty(growable: true);
        for (var i = 0; i <= DateTime.now().hour; i++) {
          spots.add(FlSpot(i.toDouble(), value[i]));
        }
        final max = spots
            .reduce((value, element) => value.y > element.y ? value : element)
            .y;
        final min = spots
            .reduce((value, element) => value.y < element.y ? value : element)
            .y;
        return Chart(
          data: spots,
          onTouchCallback: (context, value) =>
              context.read<HomeControllers>().changeIndicatedValue(
                    value,
                  ),
          onTouchEndCallback: (context) =>
              context.read<HomeControllers>().changeIndicatedValue(null),
          bottomTitleWidgets: bottomTitleWidgets,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomIconButton(
                color: Color(0XFFF0F0F0),
                icon: Text(
                  '📈',
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Usage frequency',
                      style: context.textTheme.titleSmall,
                    ),
                    Text(
                      'Comparison by hour',
                      style: context.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              CustomIconButton(
                icon: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '🔥 Oh no!',
                      style: context.textTheme.labelLarge?.copyWith(
                        color: context.colorScheme.onPrimaryContainer,
                      ),
                    ),
                    Selector<HomeControllers, double?>(
                      builder: (BuildContext context, double? value,
                              Widget? child) =>
                          Text(
                        '${value?.toStringAsFixed(0) ?? '0'} ml',
                        style: context.textTheme.bodySmall?.copyWith(
                          color: context.colorScheme.onPrimaryContainer,
                        ),
                      ),
                      selector: (context, controller) =>
                          controller.state.indicatedValue,
                    ),
                  ],
                ),
              ),
            ],
          ),
          maxY: max,
          minY: min,
        );
      },
      selector: (context, controller) => controller.state.data,
    );
  }
}
