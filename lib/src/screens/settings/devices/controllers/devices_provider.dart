import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:rehabox/src/utils/controllers_status.dart';

part 'devices_provider_state.dart';

class DevicesProvider extends ChangeNotifier
    implements ControllersStatusInterface {
  DevicesProvider();

  late final StreamSubscription<BluetoothAdapterState> _streamSubscription =
      FlutterBluePlus.adapterState.listen((state) {
    debugPrint('DevicesProvider._streamSubscription.listen');
    debugPrint('state: $state');
    _state = _state.copyWith(
      bluetoothState: state,
    );
    notifyListeners();
  })
        ..onError((error, stackTrace) {
          debugPrint('DevicesProvider._streamSubscription.onError');
          debugPrint('error: $error');
          debugPrint('stackTrace: $stackTrace');
          _state = _state.copyWith(
            status: ControllersStatus.error,
            errorMessage:
                "An error occurred while trying to connect to the device. Please try again.",
          );
        })
        ..onDone(() {
          debugPrint('DevicesProvider._streamSubscription.onDone');
        });

  late final StreamSubscription<List<ScanResult>> _devicesScanner =
      FlutterBluePlus.onScanResults.listen(
    (results) {
      debugPrint('DevicesProvider._devicesScanner.listen');
      if (results.isNotEmpty) {
        debugPrint('DevicesProvider._devicesScanner.listen');
        debugPrint('results: $results');
        _state = _state.copyWith(
          devices: results,
        );
        notifyListeners();
      }
    },
    onError: (e) => debugPrint(e),
  );

  DevicesProviderState _state = DevicesProviderState.initial();

  void init() {
    debugPrint('DevicesProvider.init');
    _streamSubscription.resume();
    FlutterBluePlus.startScan();
  }

  void reset() {
    debugPrint('DevicesProvider.reset');
    _state = DevicesProviderState.initial();
    _devicesScanner.resume();
    FlutterBluePlus.startScan();
    notifyListeners();
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    FlutterBluePlus.cancelWhenScanComplete(_devicesScanner);
    super.dispose();
  }

  BluetoothAdapterState get bluetoothState => _state.bluetoothState;

  List<ScanResult> get devices => _state.devices;

  String? get connectedDeviceId => _state.connectedDeviceId;

  @override
  String? get errorMessage => _state.errorMessage;

  @override
  bool get isError => _state.status == ControllersStatus.error;

  @override
  bool get isInitial => _state.status == ControllersStatus.initial;

  @override
  bool get isLoaded => _state.status == ControllersStatus.loaded;

  @override
  bool get isLoading => _state.status == ControllersStatus.loading;
}
