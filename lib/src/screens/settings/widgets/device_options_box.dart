import 'package:flutter/material.dart';
import 'package:rehabox/src/widgets/extensions/build_context_extensions.dart';

class DeviceOption extends StatelessWidget {
  const DeviceOption({
    required this.device,
    required this.isSelected,
    this.onPressed,
    super.key,
  });

  final String device;

  final bool isSelected;

  final void Function(BuildContext context)? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed != null ? () => onPressed!(context) : null,
      style: ButtonStyle(
        padding: MaterialStatePropertyAll(
          EdgeInsets.symmetric(
            horizontal: context.widthPercent(0.03),
            vertical: context.heightPercent(0.02),
          ),
        ),
        backgroundColor: MaterialStatePropertyAll(
          isSelected ? const Color(0xFFDDF2FC) : Colors.transparent,
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        overlayColor: const MaterialStatePropertyAll(
          Colors.transparent,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              device,
              style: TextStyle(
                color: const Color(0xFF040415),
                fontSize: context.textScaleFactor(16),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          if (isSelected)
            Container(
              width: 24,
              height: 24,
              decoration: const ShapeDecoration(
                color: Color(0xFF4AC443),
                shape: OvalBorder(),
              ),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 16,
              ),
            ),
        ],
      ),
    );
  }
}

class DeviceOptionsBox extends StatelessWidget {
  const DeviceOptionsBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        context.widthPercent(0.03),
      ),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: const Column(
        children: [
          DeviceOption(
            device: 'iPhone 12 Pro Max',
            isSelected: true,
          ),
          // const SizedBox(height: 8),
          DeviceOption(
            device: 'iPhone 12 Pro',
            isSelected: false,
          ),
          // const SizedBox(height: 8),
          DeviceOption(
            device: 'iPhone 12',
            isSelected: false,
          ),
        ],
      ),
    );
  }
}
