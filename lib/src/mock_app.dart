import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rehabox/src/screens/challenges/challenge_view_screen.dart';
import 'package:rehabox/src/screens/challenges/challenges_screen.dart';
import 'package:rehabox/src/screens/coupons/coupons_screen.dart';
import 'package:rehabox/src/screens/timer/screens/congratulation_screen.dart';
import 'package:rehabox/src/screens/timer/screens/set_timer_screen.dart';
import 'package:rehabox/src/screens/timer/screens/timer_screen.dart';
import 'package:rehabox/src/screens/profile/widgets/profile_screen.dart';
import 'package:rehabox/src/screens/settings/devices/devices_setting_screen.dart';
import 'package:rehabox/src/screens/settings/settings_screen.dart';
import 'package:rehabox/src/theme/themedata.dart';

import 'models/models.dart';

class MockApp extends StatelessWidget {
  const MockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Providing a restorationScopeId allows the Navigator built by the
      // MaterialApp to restore the navigation stack when a user leaves and
      // returns to the app after it has been killed while running in the
      // background.
      restorationScopeId: 'app',

      // Provide the generated AppLocalizations to the MaterialApp. This
      // allows descendant Widgets to display the correct translations
      // depending on the user's locale.
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
      ],

      // Use AppLocalizations to configure the correct application title
      // depending on the user's locale.
      //
      // The appTitle is defined in .arb files found in the localization
      // directory.
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,

      // Define a light and dark color theme. Then, read the user's
      // preferred ThemeMode (light, dark, or system default) from the
      // SettingsController to display the correct theme.
      theme: ThemeHelper().themeData(),
      darkTheme: ThemeData.dark(),
      // themeMode: settingsController.themeMode,
      routes: {
        ProfileScreen.routeName: (context) => const ProfileScreen(),
        SettingsScreen.routeName: (context) => const SettingsScreen(),
        DevicesSettingScreen.routeName: (context) => const DevicesSettingScreen(),
        CouponsScreen.routeName: (context) => const CouponsScreen(),
        ChallengesScreen.routeName: (context) => const ChallengesScreen(),
        ChallengeViewScreen.routeName: (context) {
          final challenge = ModalRoute.of(context)!.settings.arguments as Challenge;
          return ChallengeViewScreen(challenge: challenge);
        },
        TimerScreen.routeName: (context) => const TimerScreen(),
        CongratulationScreen.routeName: (context) => const CongratulationScreen(),
        SetTimerScreen.routeName: (context) => const SetTimerScreen(),
      },
      initialRoute: TimerScreen.routeName,
    );
  }
}
