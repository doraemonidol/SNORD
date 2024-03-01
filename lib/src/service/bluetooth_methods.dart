import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
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