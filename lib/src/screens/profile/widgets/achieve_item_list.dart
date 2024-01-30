import 'package:flutter/material.dart';
import 'package:rehabox/src/screens/profile/widgets/achieve_item.dart';
import 'package:rehabox/src/screens/profile/widgets/config.dart';
import 'package:rehabox/src/widgets/extensions/build_context_extensions.dart';
import 'package:shimmer/shimmer.dart';

class AchieveItemList extends StatelessWidget {
  const AchieveItemList({
    required this.data,
    super.key,
  });

  /// Data is a list of maps with the following structure:
  /// ```dart
  /// [
  ///  {
  ///   'title': '113 points earned',
  ///  'subtitle': 'Today, 10:00 AM',
  /// 'leading': <Widget>,
  /// 'trailing': <Widget>,
  /// },
  /// ]
  final List<Map<String, dynamic>> data;

  @override
  Widget build(BuildContext context) {
    final widgets = [
      ...data.map(
        (Map<String, dynamic> item) {
          return AchieveItem(
            title: Text(
              item['title'] as String,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: context.textScaleFactor(16),
              ),
            ),
            subtitle: Text(
              item['subtitle'] as String,
              style: TextStyle(
                color: const Color(0xFF9B9BA1),
                fontSize: context.textScaleFactor(14),
              ),
            ),
            trailing: item['trailing'] as Widget?,
            leading: item['leading'] as Widget?,
          );
        },
      ),
    ];

    final widgetsWithSeparators = <Widget>[];

    for (var i = 0; i < widgets.length; i++) {
      widgetsWithSeparators.add(widgets[i]);
      if (i != widgets.length - 1) {
        widgetsWithSeparators.add(const SizedBox(height: 16));
      }
    }

    return Column(
      children: widgetsWithSeparators,
    );
  }
}

class ShimmerAchieveItemLists extends StatelessWidget {
  const ShimmerAchieveItemLists({super.key});

  @override
  Widget build(BuildContext context) {
    final widgets =  [
        for (var i = 0; i < 4; i++)
          Shimmer.fromColors(
            baseColor: baseColor,
            highlightColor: highlightColor,
            child: Container(
              height: context.heightPercent(0.12),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x0F222C5C),
                    blurRadius: 68,
                    offset: Offset(58, 26),
                    spreadRadius: 0,
                  )
                ],
              ),
              padding: EdgeInsets.symmetric(
                horizontal: context.widthPercent(0.04),
                vertical: context.heightPercent(0.02),
              ),
            ),
          ),
      ];

    final widgetsWithSeparators = <Widget>[];

    for (var i = 0; i < widgets.length; i++) {
      widgetsWithSeparators.add(widgets[i]);
      if (i != widgets.length - 1) {
        widgetsWithSeparators.add(const SizedBox(height: 16));
      }
    }
    return Column(
      children: widgetsWithSeparators,
    );
  }
}
