import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rehabox/src/screens/authentication/widgets/login_form.dart';
import 'package:rehabox/src/screens/authentication/widgets/signup_form.dart';
import 'package:rehabox/src/screens/challenges/challenge_view_screen.dart';
import 'package:rehabox/src/screens/challenges/challenges_screen.dart';
import 'package:rehabox/src/screens/coupons/coupons_screen.dart';
import 'package:rehabox/src/screens/first_time_setup/widgets/device_screen.dart';
import 'package:rehabox/src/screens/first_time_setup/widgets/grant_access_screen.dart';
import 'package:rehabox/src/screens/first_time_setup/widgets/usage_analysis.dart';
import 'package:rehabox/src/screens/onboard/onboarding_screen.dart';
import 'package:rehabox/src/screens/home/home_screen.dart';
import 'package:rehabox/src/screens/timer/screens/congratulation_screen.dart';
import 'package:rehabox/src/screens/timer/screens/timer_screen.dart';
import 'package:rehabox/src/screens/profile/widgets/profile_screen.dart';
import 'package:rehabox/src/screens/settings/devices/devices_setting_screen.dart';
import 'package:rehabox/src/screens/settings/settings_screen.dart';
import 'package:rehabox/src/theme/themedata.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:rehabox/src/widgets/goal_setter/choose_goal_screen.dart';

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
        HomeScreen.routeName: (context) => const HomeScreen(),
        ProfileScreen.routeName: (context) => const ProfileScreen(),
        SettingsScreen.routeName: (context) => const SettingsScreen(),
        DevicesSettingScreen.routeName: (context) =>
            const DevicesSettingScreen(),
        CouponsScreen.routeName: (context) => const CouponsScreen(),
        ChallengesScreen.routeName: (context) => const ChallengesScreen(),
        ChallengeViewScreen.routeName: (context) {
          final challenge =
              ModalRoute.of(context)!.settings.arguments as Challenge;
          return ChallengeViewScreen(challenge: challenge);
        },
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
        LoginForm.routeName: (context) => const LoginForm(),
        SignupForm.routeName: (context) => const SignupForm(),
        GrantAccessScreen.routeName: (context) => const GrantAccessScreen(),
        DeviceScreen.routeName: (context) => const DeviceScreen(),
        AuthWrapper.routeName: (context) => const AuthWrapper(),
        CongratulationScreen.routeName: (context) =>
            const CongratulationScreen(),
        TimerScreen.routeName: (context) => const TimerScreen(),
        UsageAnalysisScreen.routeName: (context) => const UsageAnalysisScreen(
              timeLeft: Duration(seconds: 10),
            ),
        ChooseGoalScreen.routeName: (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map;
          final recommendedTime = args['recommendedTime'] as Duration?;
          final canBack = args['canBack'] as bool?;
          return ChooseGoalScreen(
            title: args['title'],
            description: args['description'],
            recommendedTime: recommendedTime ?? const Duration(hours: 0),
            canBack: canBack ?? false,
          );
        },
      },
      // home: const AuthWrapper(),
      // phatalways-sleeping: I commented this out to use initialRoute instead,
      // avoiding the need to use a const AuthWrapper() as the home route since we have a named route for it.
      initialRoute: AuthWrapper.routeName,
      onUnknownRoute: (settings) {
        return MaterialPageRoute<void>(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text(AppLocalizations.of(context)!.appTitle),
            ),
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
      },
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);
  static const routeName = '/auth-wrapper';

  @override
  Widget build(BuildContext context) {
    debugPrint('AuthWrapper.build');

    return StreamBuilder<auth.User?>(
      stream: auth.FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          if (user == null) {
            return const OnboardingScreen();
          }
          return const GrantAccessScreen();
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
