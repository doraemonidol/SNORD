// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
// import 'package:rehabox/src/screens/settings/config.dart';
// import 'package:rehabox/src/utils/controllers_status.dart';
// import 'package:rehabox/src/widgets/ble/ble_device_connector.dart';
// import 'package:rehabox/src/widgets/ble/ble_logger.dart';
// import 'package:rehabox/src/widgets/ble/ble_scanner.dart';

// part 'devices_provider_state.dart';

// class DevicesProvider extends ChangeNotifier
//     implements ControllersStatusInterface {
//   final BleScanner _devicesScanner;
//   final BleDeviceConnector _deviceConnector;

//   DevicesProvider({
//     required BleScanner devicesScanner,
//     required BleDeviceConnector deviceConnector,
//   })  : _devicesScanner = devicesScanner,
//         _deviceConnector = deviceConnector;

//   DevicesProviderState _state = DevicesProviderState.initial();

//   late StreamSubscription<BleScannerState> _streamSubscription;

//   Future<void> init() async {
//     debugPrint('DevicesProvider.init');

//     _state = _state.copyWith(
//       status: ControllersStatus.loading,
//     );

//     notifyListeners();

//     _streamSubscription = _devicesScanner.state.listen((state) {
//       _state = _state.copyWith(
//         scanState: state,
//         status: ControllersStatus.loaded,
//       );
//       notifyListeners();
//     });
//   }

//   Future<void> connectToDevice(String deviceId) async {
//     debugPrint('DevicesProvider.connectToDevice');
//     _state = _state.copyWith(
//       status: ControllersStatus.loading,
//     );
//     notifyListeners();
//     try {
//       await _deviceConnector.connect(deviceId);
//       _state = _state.copyWith(
//         status: ControllersStatus.loaded,
//         connectedDeviceId: deviceId,
//       );
//     } catch (e) {
//       _state = _state.copyWith(
//         status: ControllersStatus.error,
//         errorMessage: e.toString(),
//       );
//     }
//     notifyListeners();
//   }

//   Future<void> reset() async {
//     debugPrint('DevicesProvider.reset');
//     _state = DevicesProviderState.initial().copyWith(
//       status: ControllersStatus.loading,
//     );
//     _devicesScanner.resume();
//     FlutterBluePlus.startScan();
//     notifyListeners();
//     await Future.delayed(const Duration(seconds: 3));
//     _state = _state.copyWith(
//       status: ControllersStatus.loaded,
//       devices: devicesMock,
//     );
//     notifyListeners();
//   }

//   @override
//   void dispose() {
//     _streamSubscription.cancel();
//     FlutterBluePlus.cancelWhenScanComplete(_devicesScanner);
//     super.dispose();
//   }

//   BluetoothAdapterState get bluetoothState => _state.scanState;

//   List<ScanResult> get devices => _state.devices;

//   String? get connectedDeviceId => _state.connectedDeviceId;

//   @override
//   String? get errorMessage => _state.errorMessage;

//   @override
//   bool get isError => _state.status == ControllersStatus.error;

//   @override
//   bool get isInitial => _state.status == ControllersStatus.initial;

//   @override
//   bool get isLoaded => _state.status == ControllersStatus.loaded;

//   @override
//   bool get isLoading => _state.status == ControllersStatus.loading;
// }
