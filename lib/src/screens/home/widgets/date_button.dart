import 'package:flutter/material.dart';
import 'package:rehabox/src/utils/computation.dart';
import 'package:rehabox/src/widgets/extensions/build_context_extensions.dart';

class DateButton extends StatelessWidget {
  const DateButton({
    required this.date,
    required this.onTap,
    required this.isSelected,
    super.key,
  });

  final DateTime date;
  final bool isSelected;
  final void Function(BuildContext context) onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => onTap(context),
      style: ButtonStyle(
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 8,
          ),
        ),
        // maximumSize: MaterialStateProperty.all(
        //   Size(
        //     context.widthPercent(0.1),
        //     context.heightPercent(0.1),
        //   ),
        // ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        side: MaterialStateProperty.all(
          isSelected
              ? const BorderSide(
                  width: 2,
                  color: Color(0xFF6B73FF),
                )
              : const BorderSide(
                  width: 2,
                  color: Color(0XFF9B9BA1),
                ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            date.day.toString(),
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: isSelected
                  ? const Color(0xFF6B73FF)
                  : const Color(0XFF0F0F0F),
            ),
          ),
          Text(
            getDayOfWeek(date).substring(0, 3),
            style: context.textTheme.bodySmall?.copyWith(
              color: isSelected
                  ? const Color(0xFF6B73FF)
                  : const Color(0XFF9B9BA1),
            ),
          ),
        ],
      ),
    );
  }
}
