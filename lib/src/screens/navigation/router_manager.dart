import 'package:flutter/material.dart';
import 'package:rehabox/src/screens/navigation/animated_page_route.dart';
import 'package:rehabox/src/screens/profile/widgets/profile_screen.dart';
import 'package:rehabox/src/screens/settings/devices/devices_setting_screen.dart';
import 'package:rehabox/src/screens/settings/settings_screen.dart';

class RouteManager {
  RouteManager._();
  
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const Placeholder(),
        );
      case ProfileScreen.routeName:
        return AnimatedPageRoute(
          child: const ProfileScreen(),
        );
      case SettingsScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const SettingsScreen(),
        );
      case DevicesSettingScreen.routeName:
        return AnimatedPageRoute(
          child: const DevicesSettingScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Placeholder(),
        );
    }
  }
}