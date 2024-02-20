import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:rehabox/src/widgets/extensions/build_context_extensions.dart';

class Chart extends StatelessWidget {
  const Chart({
    required this.data,
    required this.bottomTitleWidgets,
    required this.title,
    required this.maxY,
    required this.minY,
    required this.onTouchCallback,
    required this.onTouchEndCallback,
    this.checkToShowBelowBar,
    this.checkToShowDot,
    this.curveColor,
    this.gradientColors,
    this.maxX = 23,
    this.minX = 0,
    super.key,
  });

  final Widget title;
  final List<FlSpot> data;
  final Widget Function(BuildContext context, double value, TitleMeta meta)
      bottomTitleWidgets;
  final double maxX;
  final double maxY;
  final double minY;
  final double minX;

  final Color? curveColor;
  final Gradient Function(List<FlSpot> points)? gradientColors;

  final void Function(BuildContext context, double value) onTouchCallback;
  final void Function(BuildContext context) onTouchEndCallback;
  final bool Function(FlSpot spot, LineChartBarData data)? checkToShowDot;
  final bool Function(FlSpot spot)? checkToShowBelowBar;

  @override
  Widget build(BuildContext context) {
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
          title,
          const SizedBox(height: 8),
          Expanded(
            child: LineChart(
              LineChartData(
                backgroundColor: Colors.transparent,
                clipData: const FlClipData.all(),
                lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                    getTooltipItems: (touchedSpots) => List.filled(
                      touchedSpots.length,
                      null,
                    ),
                    tooltipBgColor: Colors.transparent,
                  ),
                  touchCallback: (event, touchResponse) {
                    if (event is FlLongPressEnd || event is FlTapUpEvent) {
                      onTouchEndCallback(context);
                      return;
                    }
                    if (touchResponse == null) {
                      return;
                    }
                    double value = touchResponse.lineBarSpots!.first.y;
                    onTouchCallback(context, value);
                  },
                  handleBuiltInTouches: true,
                  getTouchedSpotIndicator:
                      (LineChartBarData barData, List<int> spotIndexes) {
                    return spotIndexes.map(
                      (spotIndex) {
                        return TouchedSpotIndicatorData(
                          FlLine(
                            color: context.colorScheme.primaryContainer
                                .withOpacity(0.5),
                            strokeWidth: 5,
                          ),
                          FlDotData(
                            getDotPainter: (spot, percent, barData, index) {
                              return FlDotCirclePainter(
                                radius: 6,
                                color: context.colorScheme.primaryContainer,
                                strokeWidth: 2,
                                strokeColor: context.colorScheme.surface,
                              );
                            },
                          ),
                        );
                      },
                    ).toList();
                  },
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
                minY: minY - 100,
                maxY: maxY + 100,
                minX: minX,
                maxX: maxX,
                lineBarsData: [
                  LineChartBarData(
                    spots: data,
                    isCurved: true,
                    color: curveColor ?? context.colorScheme.primaryContainer,
                    gradient: gradientColors?.call(data),
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
                      checkToShowDot: checkToShowDot ??
                          (spot, data) => spot.x == DateTime.now().hour,
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      color: context.colorScheme.primaryContainer
                          .withOpacity(0.25),
                      spotsLine: BarAreaSpotsLine(
                        show: true,
                        checkToShowSpotLine: checkToShowBelowBar ??
                            (spot) => spot.x == DateTime.now().hour,
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
