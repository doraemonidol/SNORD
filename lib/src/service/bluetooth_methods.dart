import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';

Future<int> getAndroidSdk() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  return androidInfo.version.sdkInt ?? 30;
}

Future<bool> checkPermission(Permission permission) async {
  var status = await permission.status;
  return status.isGranted;
}

Future<bool> _requestAccess(Permission permission) async {
  var status = await permission.request();
  return status.isGranted;
}

Future<bool> requestBluetoothAccess() async {
  Future<bool> permStatus;
  if (Platform.isAndroid && await getAndroidSdk() > 30) {
    // It seems some manufacturer misimplement the bluetooth permissions
    // so I have added the request to Permission.bluetooth and inside
    // AndroidManifest.xml I have removed the android:maxSdkVersion="30".
    permStatus = _requestAccess(Permission.bluetooth)
        .then((isGranted) => _requestAccess(Permission.bluetoothScan))
        .then((isGranted) => _requestAccess(Permission.bluetoothConnect))
        .then((isGranted) => isGranted);
  } else {
    permStatus = _requestAccess(Permission.bluetooth);
  }
  return permStatus;
}

void initializeBluetooth() async {
  if (await FlutterBluePlus.isSupported == false) {
    debugPrint("Bluetooth not supported by this device");
    return;
  }
  if (await requestBluetoothAccess() == false) {
    debugPrint("Bluetooth permission not granted");
    return;
  } else {
    debugPrint("Bluetooth permission granted");
  }
  // handle bluetooth on & off
  // note: for iOS the initial state is typically BluetoothAdapterState.unknown
  // note: if you have permissions issues you will get stuck at BluetoothAdapterState.unauthorized
  var subscription =
      FlutterBluePlus.adapterState.listen((BluetoothAdapterState state) {
    print(state);
    if (state == BluetoothAdapterState.on) {
      // usually start scanning, connecting, etc
      print("Bluetooth is on");
      // start scanning and output the devices
      FlutterBluePlus.scanResults.listen((results) {
        for (ScanResult r in results) {
          print('${r.device.platformName} found! rssi: ${r.rssi}');
        }
      });
    } else {
      // show an error to the user, etc
      print("Bluetooth is off");
    }
  });

  // turn on bluetooth ourself if we can
  // for iOS, the user controls bluetooth enable/disable
  if (Platform.isAndroid) {
    await FlutterBluePlus.turnOn();
  }

  // cancel to prevent duplicate listeners
  subscription.cancel();
}
