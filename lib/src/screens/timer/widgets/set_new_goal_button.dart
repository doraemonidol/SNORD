import 'package:flutter/material.dart';
import 'package:rehabox/src/widgets/extensions/build_context_extensions.dart';

class SetNewGoalButton extends StatelessWidget {
  const SetNewGoalButton({
    required this.onPressed,
    super.key,
  });

  final Future<void> Function(BuildContext) onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await onPressed(context);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          context.colorScheme.primaryContainer,
        ),
        surfaceTintColor: MaterialStateProperty.all(
          context.colorScheme.primaryContainer,
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            vertical: context.heightPercent(0.02),
            horizontal: context.widthPercent(0.04),
          ),
        ),
        fixedSize: MaterialStateProperty.all(
          Size(
            context.widthPercent(0.94) - 8,
            90,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: ShapeDecoration(
              shape: OvalBorder(
                side: BorderSide(
                  width: 2,
                  color: context.colorScheme.errorContainer,
                ),
              ),
            ),
            alignment: Alignment.center,
            child: Icon(
              Icons.check,
              color: context.colorScheme.primary,
              size: 25,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "You've made great progress! 🔥",
                  style: context.textTheme.titleMedium?.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Click here to set new goal',
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
