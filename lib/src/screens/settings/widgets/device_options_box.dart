import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:provider/provider.dart';
import 'package:rehabox/src/screens/first_time_setup/widgets/usage_analysis.dart';
import 'package:rehabox/src/screens/settings/devices/controllers/devices_provider.dart';
import 'package:rehabox/src/utils/conditional_render_manager.dart';
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
            vertical: 20,
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
    return Consumer<DevicesProvider>(
      builder: conditionalRenderManager<DevicesProvider>(
        onInitial: (context) => const Center(
          child: CircularProgressIndicator(
            color: Color(0XFF3BA935),
          ),
        ),
        onLoaded: (context) {
          return Selector<DevicesProvider, List<ScanResult>>(
            selector: (BuildContext context, DevicesProvider controller) =>
                controller.devices,
            builder:
                (BuildContext context, List<ScanResult> value, Widget? child) {
              if (value.isEmpty) {
                return child!;
              }
              return Container(
                padding: EdgeInsets.all(
                  context.widthPercent(0.03),
                ),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  // color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Column(
                  children: [
                    ...value.map(
                      (device) => Selector<DevicesProvider, String?>(
                        builder: (BuildContext context, String? value,
                            Widget? child) {
                          if (value != null) {
                            WidgetsBinding.instance
                                .addPostFrameCallback((timeStamp) async {
                              await Navigator.pushNamed(
                                  context, UsageAnalysisScreen.routeName);
                            });
                            return const SizedBox.shrink();
                          }
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                            ),
                            child: DeviceOption(
                              device: device.advertisementData.advName,
                              isSelected: device.device.remoteId.str == value,
                              onPressed: (context) async => await context
                                  .read<DevicesProvider>()
                                  .connectToDevice(
                                    device.device.remoteId.str,
                                  ),
                            ),
                          );
                        },
                        selector: (BuildContext context,
                                DevicesProvider controller) =>
                            controller.connectedDeviceId,
                      ),
                    ),
                  ],
                ),
              );
            },
            child: Center(
              child: Text(
                'No devices found',
                style: TextStyle(
                  color: const Color(0xFF040415),
                  fontSize: context.textScaleFactor(16),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
