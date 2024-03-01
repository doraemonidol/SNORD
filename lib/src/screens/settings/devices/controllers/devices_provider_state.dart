// part of 'devices_provider.dart';

// @immutable
// final class DevicesProviderState {
//   const DevicesProviderState({
//     required this.scanState,
//     required this.status,
//     this.connectedDeviceId,
//     this.errorMessage,
//   });

//   final BleScannerState scanState;
//   final ControllersStatus status;
//   final String? connectedDeviceId;
//   final String? errorMessage;

//   factory DevicesProviderState.initial() => const DevicesProviderState(
//         scanState:
//             BleScannerState(discoveredDevices: [], scanIsInProgress: false),
//         status: ControllersStatus.initial,
//       );

//   DevicesProviderState copyWith({
//     BleScannerState? scanState,
//     ControllersStatus? status,
//     String? errorMessage,
//     String? connectedDeviceId,
//   }) {
//     return DevicesProviderState(
//       scanState: scanState ?? this.scanState,
//       status: status ?? this.status,
//       errorMessage: errorMessage ?? this.errorMessage,
//       connectedDeviceId: connectedDeviceId ?? this.connectedDeviceId,
//     );
//   }
// }
