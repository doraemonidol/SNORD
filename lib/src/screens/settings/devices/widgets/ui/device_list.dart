import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:provider/provider.dart';
import 'package:rehabox/src/screens/home/home_screen.dart';
import 'package:rehabox/src/screens/settings/devices/widgets/ui/device_interactor_screen.dart';
import 'package:rehabox/src/screens/settings/widgets/device_options_box.dart';
import 'package:rehabox/src/widgets/ble/ble_device_connector.dart';
import 'package:rehabox/src/widgets/ble/ble_scanner.dart';
import 'package:rehabox/src/widgets/extensions/build_context_extensions.dart';
import 'package:rehabox/src/widgets/navigation_bar/config.dart';

class DeviceListScreen extends StatelessWidget {
  const DeviceListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Consumer3<BleScanner, BleScannerState?, BleDeviceConnector>(
        builder: (_, bleScanner, bleScannerState, bleDeviceConnector, __) =>
            _DeviceList(
          scannerState: bleScannerState ??
              const BleScannerState(
                discoveredDevices: [],
                scanIsInProgress: false,
              ),
          startScan: bleScanner.startScan,
          stopScan: bleScanner.stopScan,
          deviceConnector: bleDeviceConnector,
        ),
      );
}

class _DeviceList extends StatefulWidget {
  const _DeviceList({
    required this.scannerState,
    required this.startScan,
    required this.stopScan,
    required this.deviceConnector,
  });

  final BleDeviceConnector deviceConnector;
  final BleScannerState scannerState;
  final void Function(List<Uuid>) startScan;
  final VoidCallback stopScan;
  @override
  __DeviceListState createState() => __DeviceListState();
}

class __DeviceListState extends State<_DeviceList> {
  bool _isScanning = false;

  @override
  void initState() {
    super.initState();
    widget.startScan([]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // shrinkWrap: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ...widget.scannerState.discoveredDevices,
            DiscoveredDevice(
              id: "mock-device",
              name: "SNORD Module",
              serviceData: const {},
              manufacturerData: Uint8List(12),
              rssi: 12,
              serviceUuids: const [],
            ),
          ]
              .where((element) =>
                  element.name.isNotEmpty) // !element.name.contains(':'))
              .map(
            (device) {
              return DeviceOption(
                device: device.name,
                isSelected: false,
                onPressed: (context) async {
                  if (device.name.isNotEmpty) {
                    await Navigator.pushNamed(context, HomeScreen.routeName);
                    return;
                  }
                  widget.stopScan();
                  widget.deviceConnector.connect(device.id);
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DeviceInteractorScreen(
                        deviceId: device.id,
                      ),
                    ),
                  );
                  widget.deviceConnector.disconnect(device.id);
                  widget.startScan([]);
                },
              );
            },
            // ListTile(
            //   title: Text(device.name),
            //   subtitle: Text("${device.id}\nRSSI: ${device.rssi}"),
            //   leading: const Icon(Icons.bluetooth),
            //   trailing: const Icon(Icons.arrow_forward_ios),
            //   onTap: () async {
            //     widget.stopScan();
            //     widget.deviceConnector.connect(device.id);
            //     await Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) => DeviceInteractorScreen(
            //               deviceId: device.id)),
            //     );
            //     widget.deviceConnector.disconnect(device.id);
            //     widget.startScan([]);
            //   },
            // ),
          ).toList(),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.widthPercent(0.03) + 8,
        ),
        child: SizedBox(
          height: kCustomBottomNavigationBarHeight + 25,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Haven’t found your device?',
                  style: TextStyle(
                    color: const Color(0xFF040415),
                    fontSize: context.textScaleFactor(16),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  _isScanning
                      ? (widget.scannerState.scanIsInProgress
                          ? widget.stopScan
                          : null)
                      : (!widget.scannerState.scanIsInProgress
                          ? () => widget.startScan([])
                          : null);
                  setState(() {
                    _isScanning = _isScanning;
                  });
                },
                style: ButtonStyle(
                  padding: MaterialStatePropertyAll(
                    EdgeInsets.symmetric(
                      horizontal: context.widthPercent(0.03),
                      vertical: context.heightPercent(0.02),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.resolveWith(
                    (states) {
                      if (states.contains(MaterialState.pressed)) {
                        return const Color(0xFF3843FF).withOpacity(0.9);
                      } else {
                        return const Color(0xFF3843FF);
                      }
                    },
                  ),
                  minimumSize: const MaterialStatePropertyAll(
                    Size(
                      double.infinity,
                      50,
                    ),
                  ),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
                child: Text(
                  _isScanning ? 'Stop' : 'Retry',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: context.textScaleFactor(16),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
