import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:rehabox/src/widgets/custom_icon_button.dart';
import 'package:rehabox/src/widgets/extensions/build_context_extensions.dart';

class DailyChart extends StatelessWidget {
  const DailyChart({super.key});

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
    final spots = List<FlSpot>.empty(growable: true);
    for (var i = 0; i <= DateTime.now().hour; i++) {
      // Random data from 3 to 10
      final random = Random().nextInt(7) + 3;
      spots.add(FlSpot(i.toDouble(), random.toDouble()));
    }
    final stops = spots.map((e) {
      if (e.y <= 3) {
        return context.colorScheme.errorContainer.withOpacity(1);
      } else if (e.y <= 5) {
        return const Color(0XFFFFCA00);
      } else if (e.y <= 6) {
        return const Color(0XFFE3524F).withOpacity(0.9);
      } else {
        return const Color(0XFFE3524F);
      }
    }).toList();
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: context.widthPercent(0.03),
      ),
      height: context.heightPercent(0.35),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: context.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.onPrimaryContainer.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
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
                    Text(
                      '100 ml',
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: LineChart(
              LineChartData(
                backgroundColor: Colors.transparent,
                clipData: const FlClipData.all(),
                lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                    tooltipBgColor: context.colorScheme.surface,
                    getTooltipItems: (touchedSpots) {
                      return touchedSpots.map((touchedSpot) {
                        return LineTooltipItem(
                          '${touchedSpot.y} ml',
                          context.textTheme.bodySmall!,
                        );
                      }).toList();
                    },
                  ),
                  touchCallback: (event, touchResponse) {},
                  handleBuiltInTouches: true,
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 1,
                  getDrawingHorizontalLine: (value) {
                    return const FlLine(
                      color: Color(0XFFF0F0F0),
                      strokeWidth: 1,
                    );
                  },
                ),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                  leftTitles: const AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      interval: 1,
                      getTitlesWidget: (value, meta) =>
                          bottomTitleWidgets(context, value, meta),
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                minX: 0,
                maxX: 23,
                minY: 0,
                maxY: 10,
                lineBarsData: [
                  LineChartBarData(
                    spots: spots,
                    isCurved: true,
                    gradient: LinearGradient(
                      colors: stops,
                      stops: List.generate(
                        stops.length,
                        (index) => index / stops.length,
                      ),
                    ),
                    barWidth: 2,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) {
                        return FlDotCirclePainter(
                          radius: 6,
                          color: context.colorScheme.primaryContainer,
                          strokeWidth: 2,
                          strokeColor: context.colorScheme.surface,
                        );
                      },
                      checkToShowDot: (spot, barData) =>
                          spot.x == DateTime.now().hour,
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [
                          context.colorScheme.primaryContainer.withOpacity(0.1),
                          context.colorScheme.primaryContainer.withOpacity(0.1),
                        ],
                      ),
                      spotsLine: BarAreaSpotsLine(
                        show: true,
                        checkToShowSpotLine: (spot) =>
                            spot.x == DateTime.now().hour,
                        flLineStyle: FlLine(
                          color: context.colorScheme.primaryContainer
                              .withOpacity(0.5),
                          strokeWidth: 5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
