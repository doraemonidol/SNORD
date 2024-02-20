import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:provider/provider.dart';
import 'package:rehabox/firebase_options.dart';
import 'package:rehabox/src/data_sources/data_sources.dart';
import 'package:rehabox/src/mock_app.dart';
import 'package:rehabox/src/repositories/repositories.dart';
import 'package:rehabox/src/repositories/user_repository/rest_user_repository.dart';
import 'package:rehabox/src/service/firebase_auth_methods.dart';
import 'package:rehabox/src/repositories/timer_activity_repository/local_timer_activity_repository.dart';
import 'package:rehabox/src/repositories/timer_activity_repository/timer_activity_repository_interface.dart';
import 'package:rehabox/src/utils/mock_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  // Mock coupons
  sharedPreferences.setStringList(
      "coupons", coupons.map((e) => jsonEncode(e.toJson())).toList());

  final localDataSource = LocalDataSource(
    sharedPreferences,
  );

  final userRepository = LocalUserRepository(
    localDataSource: localDataSource,
  );

  FlutterBluePlus.setLogLevel(LogLevel.verbose, color: true);

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  // runApp(MyApp(settingsController: settingsController));
  runApp(
    MultiProvider(
      providers: [
        Provider<FirebaseAuthMethods>(
          create: (_) => FirebaseAuthMethods(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<FirebaseAuthMethods>().authState,
          initialData: null,
        ),
        Provider<UserRepositoryInterface>(create: (_) => RestUserRepository()),
        Provider<TimerActivityRepositoryInterface>(
          create: (_) => LocalTimerActivityRepository(),
        ),
      ],
      child: const MockApp(),
    ),
  );
}
