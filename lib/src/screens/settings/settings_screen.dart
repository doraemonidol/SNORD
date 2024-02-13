import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rehabox/src/mock_app.dart';
import 'package:rehabox/src/screens/onboard/onboarding_screen.dart';
import 'package:rehabox/src/screens/settings/config.dart';
import 'package:rehabox/src/screens/settings/widgets/options_group.dart';
import 'package:rehabox/src/service/firebase_auth_methods.dart';
import 'package:rehabox/src/widgets/custom_app_bar.dart';
import 'package:rehabox/src/widgets/custom_icon_button.dart';
import 'package:rehabox/src/widgets/extensions/build_context_extensions.dart';
import 'package:rehabox/src/widgets/navigation_bar/config.dart';

import 'devices/devices_setting_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    // debugPrint current route
    debugPrint('current route: ${ModalRoute.of(context)?.settings.name}');
    return Scaffold(
      appBar: CustomAppBar(
        appBarHeight: 72,
        title: Row(
          children: [
            Hero(
              tag: 'settings',
              child: Material(
                color: Colors.transparent,
                child: CustomIconButton(
                  onPressed: (context) => Navigator.pop(context),
                  icon: SvgPicture.string(backSvgString),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'Settings',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: context.textScaleFactor(24),
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
          bottom: 12 + kCustomBottomNavigationBarHeight,
        ),
        child: Column(
          children: [
            OptionsGroup(
              title: 'General',
              options: [
                const OptionItem(
                  svgIconString: generalSvgString,
                  title: 'General',
                ),
                const OptionItem(
                  svgIconString: securitySvgString,
                  title: 'Security',
                ),
                const OptionItem(
                  svgIconString: notificationSvgString,
                  title: 'Notifications',
                ),
                Hero(
                  tag: 'devices',
                  child: OptionItem(
                    onTap: (context) => Navigator.pushNamed(  
                      context,
                      DevicesSettingScreen.routeName,
                    ),
                    svgIconString: deviceSvgString,
                    title: 'Devices',
                  ),
                ),
                OptionItem(
                    svgIconString: logoutSvgString,
                    title: 'Log out',
                    onTap: (context) {
                      context.read<FirebaseAuthMethods>().signOut(context);
                      Navigator.popUntil(context, (route) => route.isFirst);
                    }),
              ],
            ),
            const SizedBox(height: 8),
            const OptionsGroup(
              title: 'About us',
              options: [
                OptionItem(
                  svgIconString: rateSvgString,
                  title: 'Rate ReHaBox',
                ),
                OptionItem(
                  svgIconString: shareWithFriendsSvgString,
                  title: 'Share with Friends',
                ),
                OptionItem(
                  svgIconString: aboutUsSvgString,
                  title: 'About Us',
                ),
                OptionItem(
                  svgIconString: supportSvgString,
                  title: 'Support',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
