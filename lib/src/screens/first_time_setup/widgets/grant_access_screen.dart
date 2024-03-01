import 'package:flutter/material.dart';
import 'package:rehabox/src/screens/first_time_setup/config.dart';
import 'package:rehabox/src/screens/first_time_setup/widgets/device_screen.dart';
import 'package:rehabox/src/screens/settings/devices/devices_setting_screen.dart';
import 'package:rehabox/src/service/bluetooth_methods.dart';
import 'package:rehabox/src/widgets/extensions/build_context_extensions.dart';
import 'package:rehabox/src/widgets/svg_icon.dart';

class GrantAccessScreen extends StatelessWidget {
  const GrantAccessScreen({Key? key}) : super(key: key);
  static const String routeName = '/grant_access';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' '),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: const Color(0xFF0c0a12),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ONLY ONE THING AND WE'RE DONE",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withOpacity(0.60),
                  ),
                ),
                const Text(
                  "We need access to Bluetooth",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  "By using Bluetooth as a background process, we can connect to the device and analyze your usage.",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: Image(image: AssetImage('assets/gif/bluetooth.gif')),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.9),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SvgIcon(
                  iconString: likeSvgString,
                  size: 20,
                ),
                const SizedBox(height: 16),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontFamily: "AirbnbCereal",
                      color: Color(0xFFFFFFFF),
                    ),
                    children: [
                      TextSpan(
                        text: "It is very important that you choose the",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: " Always Allow ",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text:
                            "option in the next dialog. It makes the system work better. Thank you.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: context.heightPercent(0.06),
                  child: ElevatedButton(
                    onPressed: () {
                      requestBluetoothAccess().then((value) {
                        if (value) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              DevicesSettingScreen.routeName, (route) => false);
                        }
                      });
                    },
                    child: const Text(
                      'Grant Access to Rehabox',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF040415),
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFFFFFFFF)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
