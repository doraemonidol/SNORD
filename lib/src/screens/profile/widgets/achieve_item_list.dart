import 'package:flutter/material.dart';
import 'package:rehabox/src/widgets/custom_item_widget.dart';
import 'package:rehabox/src/widgets/extensions/build_context_extensions.dart';

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
          return CustomItemWidget(
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


