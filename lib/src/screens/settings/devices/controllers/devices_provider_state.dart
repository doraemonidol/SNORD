part of 'devices_provider.dart';

@immutable
final class DevicesProviderState {
  const DevicesProviderState({
    required this.bluetoothState,
    required this.devices,
    required this.status,
    this.connectedDeviceId,
    this.errorMessage,
  });

  final BluetoothAdapterState bluetoothState;
  final List<ScanResult> devices;
  final ControllersStatus status;
  final String? connectedDeviceId;
  final String? errorMessage;

  factory DevicesProviderState.initial() => const DevicesProviderState(
        bluetoothState: BluetoothAdapterState.unknown,
        devices: [],
        status: ControllersStatus.initial,
      );

  DevicesProviderState copyWith({
    BluetoothAdapterState? bluetoothState,
    List<ScanResult>? devices,
    ControllersStatus? status,
    String? errorMessage,
    String? connectedDeviceId,
  }) {
    return DevicesProviderState(
      bluetoothState: bluetoothState ?? this.bluetoothState,
      devices: devices ?? this.devices,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      connectedDeviceId: connectedDeviceId ?? this.connectedDeviceId,
    );
  }
}