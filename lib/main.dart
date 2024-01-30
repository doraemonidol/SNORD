import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rehabox/src/data_sources/data_sources.dart';
import 'package:rehabox/src/mock_app.dart';
import 'package:rehabox/src/repositories/repositories.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  final localDataSource = LocalDataSource(
    await SharedPreferences.getInstance(),
  );

  final userRepository = LocalUserRepository(
    localDataSource: localDataSource,
  );

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  // runApp(MyApp(settingsController: settingsController));
  runApp(
    MultiProvider(
      providers: [
        Provider<UserRepositoryInterface>(create: (_) => userRepository),
      ],
      child: const MockApp(),
    ),
  );
}
