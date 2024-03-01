import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:rehabox/src/screens/settings/config.dart';
import 'package:rehabox/src/screens/settings/devices/controllers/devices_provider.dart';
import 'package:rehabox/src/screens/settings/devices/widgets/ui/ble_status_screen.dart';
import 'package:rehabox/src/screens/settings/devices/widgets/ui/device_list.dart';
import 'package:rehabox/src/screens/settings/widgets/device_options_box.dart';
import 'package:rehabox/src/utils/conditional_render_manager.dart';
import 'package:rehabox/src/widgets/ble/ble_logger.dart';
import 'package:rehabox/src/widgets/ble/ble_scanner.dart';
import 'package:rehabox/src/widgets/custom_app_bar.dart';
import 'package:rehabox/src/widgets/custom_icon_button.dart';
import 'package:rehabox/src/widgets/extensions/build_context_extensions.dart';
import 'package:rehabox/src/widgets/navigation_bar/config.dart';

class DevicesSettingScreen extends StatefulWidget {
  const DevicesSettingScreen({super.key});

  static const routeName = '/settings/devices';

  @override
  State<DevicesSettingScreen> createState() => _DevicesSettingScreenState();
}

class _DevicesSettingScreenState extends State<DevicesSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          appBarHeight: 72,
          title: Row(
            children: [
              CustomIconButton(
                onPressed: (context) => Navigator.pop(context),
                icon: SvgPicture.string(backSvgString),
              ),
              const SizedBox(width: 8),
              Hero(
                tag: 'devices',
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    'Devices',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: context.textScaleFactor(24),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Consumer<BleStatus?>(
        builder: (_, status, __) {
          if (status == BleStatus.ready) {
            return const DeviceListScreen();
          } else {
            return BleStatusScreen(status: status ?? BleStatus.unknown);
          }
        },
        ),
        // Consumer<DevicesProvider>(
        //   builder: conditionalRenderManager<DevicesProvider>(
        //     onInitial: (BuildContext context) => SingleChildScrollView(
        //       physics: const BouncingScrollPhysics(),
        //       padding: EdgeInsets.only(
        //         left: context.widthPercent(0.03) + 8,
        //         right: context.widthPercent(0.03) + 8,
        //         top: context.heightPercent(0.02),
        //       ),
        //       child: const DeviceOptionsBox(),
        //     ),
        //     onError: (BuildContext context) => Center(
        //       child: Text(
        //         'Error\n${context.read<DevicesProvider>().errorMessage}',
        //         textAlign: TextAlign.center,
        //         style: TextStyle(
        //           color: Colors.black,
        //           fontWeight: FontWeight.bold,
        //           fontSize: context.textScaleFactor(24),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        // bottomNavigationBar: Consumer<DevicesProvider>(
        //   builder: conditionalRenderManager<DevicesProvider>(
        //     onInitial: (BuildContext context) => const SizedBox.shrink(),
        //     onLoading: (context) => const SizedBox.shrink(),
        //     onLoaded: (context) => Padding(
        //       padding: EdgeInsets.symmetric(
        //         horizontal: context.widthPercent(0.03) + 8,
        //       ),
        //       child: SizedBox(
        //         height: kCustomBottomNavigationBarHeight + 25,
        //         child: Column(
        //           children: [
        //             Align(
        //               alignment: Alignment.centerLeft,
        //               child: Text(
        //                 'Haven’t found your device?',
        //                 style: TextStyle(
        //                   color: const Color(0xFF040415),
        //                   fontSize: context.textScaleFactor(16),
        //                   fontWeight: FontWeight.w500,
        //                 ),
        //               ),
        //             ),
        //             const SizedBox(height: 10),
        //             Consumer<DevicesProvider>(
        //               builder: (context, value, child) => TextButton(
        //                 onPressed: () =>
        //                     context.read<DevicesProvider>().reset(),
        //                 style: ButtonStyle(
        //                   padding: MaterialStatePropertyAll(
        //                     EdgeInsets.symmetric(
        //                       horizontal: context.widthPercent(0.03),
        //                       vertical: context.heightPercent(0.02),
        //                     ),
        //                   ),
        //                   backgroundColor: MaterialStateProperty.resolveWith(
        //                     (states) {
        //                       if (states.contains(MaterialState.pressed)) {
        //                         return const Color(0xFF3843FF).withOpacity(0.9);
        //                       } else {
        //                         return const Color(0xFF3843FF);
        //                       }
        //                     },
        //                   ),
        //                   minimumSize: const MaterialStatePropertyAll(
        //                     Size(
        //                       double.infinity,
        //                       50,
        //                     ),
        //                   ),
        //                   shape: MaterialStatePropertyAll(
        //                     RoundedRectangleBorder(
        //                       borderRadius: BorderRadius.circular(40),
        //                     ),
        //                   ),
        //                 ),
        //                 child: Text(
        //                   'Retry',
        //                   textAlign: TextAlign.center,
        //                   style: TextStyle(
        //                     color: Colors.white,
        //                     fontSize: context.textScaleFactor(16),
        //                     fontWeight: FontWeight.w500,
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      );
  }
}