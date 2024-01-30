import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rehabox/src/screens/settings/config.dart';
import 'package:rehabox/src/screens/settings/widgets/device_options_box.dart';
import 'package:rehabox/src/widgets/custom_app_bar.dart';
import 'package:rehabox/src/widgets/custom_icon_button.dart';
import 'package:rehabox/src/widgets/extensions/build_context_extensions.dart';

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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          left: context.widthPercent(0.03) + 8,
          right: context.widthPercent(0.03) + 8,
          top: context.heightPercent(0.02),
        ),
        child: const DeviceOptionsBox(),
      ),
    );
  }
}
