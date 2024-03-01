import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:provider/provider.dart';
import 'package:rehabox/firebase_options.dart';
import 'package:rehabox/src/mock_app.dart';
import 'package:rehabox/src/repositories/repositories.dart';
import 'package:rehabox/src/repositories/authentication_repository/authentication_repository.dart';
import 'package:rehabox/src/repositories/user_repository/rest_user_repository.dart';
import 'package:rehabox/src/repositories/user_repository/user_repository_interface.dart';
import 'package:rehabox/src/widgets/ble/ble_device_connector.dart';
import 'package:rehabox/src/widgets/ble/ble_device_interactor.dart';
import 'package:rehabox/src/widgets/ble/ble_logger.dart';
import 'package:rehabox/src/widgets/ble/ble_scanner.dart';
import 'package:rehabox/src/widgets/ble/ble_status_monitor.dart';
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

  // final SharedPreferences sharedPreferences =
  //     await SharedPreferences.getInstance();

  // // Mock coupons
  // sharedPreferences.setStringList(
  //     "coupons", coupons.map((e) => jsonEncode(e.toJson())).toList());

  // final localDataSource = LocalDataSource(
  //   sharedPreferences,
  // );

  // final userRepository = LocalUserRepository(
  //   localDataSource: localDataSource,
  // );

  final _bleLogger = BleLogger();
  final _ble = FlutterReactiveBle();
  final _scanner = BleScanner(ble: _ble, logMessage: _bleLogger.addToLog);
  final _monitor = BleStatusMonitor(_ble);
  final _connector = BleDeviceConnector(
    ble: _ble,
    logMessage: _bleLogger.addToLog,
  );
  final _serviceDiscoverer = BleDeviceInteractor(
    bleDiscoverServices: _ble.discoverServices,
    readCharacteristic: _ble.readCharacteristic,
    writeWithResponse: _ble.writeCharacteristicWithResponse,
    writeWithOutResponse: _ble.writeCharacteristicWithoutResponse,
    subscribeToCharacteristic: _ble.subscribeToCharacteristic,
    logMessage: _bleLogger.addToLog,
  );

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  // runApp(MyApp(settingsController: settingsController));
  runApp(
    MultiProvider(
      providers: [
        Provider<AuthenticationRepository>(
          create: (_) => AuthenticationRepository(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationRepository>().authState(context),
          initialData: null,
        ),

        Provider.value(value: _scanner),
        Provider.value(value: _monitor),
        Provider.value(value: _connector),
        Provider.value(value: _serviceDiscoverer),
        Provider.value(value: _bleLogger),
        StreamProvider<BleScannerState?>(
          create: (_) => _scanner.state,
          initialData: const BleScannerState(
            discoveredDevices: [],
            scanIsInProgress: false,
          ),
        ),
        StreamProvider<BleStatus?>(
          create: (_) => _monitor.state,
          initialData: BleStatus.unknown,
        ),
        StreamProvider<ConnectionStateUpdate>(
          create: (_) => _connector.state,
          initialData: const ConnectionStateUpdate(
            deviceId: 'Unknown device',
            connectionState: DeviceConnectionState.disconnected,
            failure: null,
          ),
        ),
        // Provider<UserRepositoryInterface>(
        //   create: (_) => RestUserRepository(),
        // ),
        // Provider<TimerActivityRepositoryInterface>(
        //   create: (_) => LocalTimerActivityRepository(),
        // ),
      ],
      // When authenticated, RESTUserRepository will be created with the token
      // from AuthenticationRepository.
      // The call looks like this:
      child: Consumer<AuthenticationRepository>(
        builder: (context, authRepo, child) {
          return FutureBuilder(
            future: authRepo.token,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              final String token = snapshot.data ?? "";
              debugPrint('Token: $token');
              return Provider<UserRepositoryInterface>(
                create: (_) => RESTUserRepository(token: token),
                child: const MockApp(),
              );
            },
          );
        },
      ),
      //
      // ),
      // For now we are using a mock token.
      // child: Provider(
      //   create: (_) => RESTUserRepository(
      //     token: "this-is-a-mock-token",
      //   ),
      //   child: const MockApp(),
      // ),
    ),
  );
}
