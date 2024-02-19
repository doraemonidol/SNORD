import 'package:flutter_blue_plus/flutter_blue_plus.dart';

const backSvgString = '''
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M14.9315 15.9596C15.1647 16.1969 15.1655 16.5824 14.9333 16.8207C14.7221 17.0374 14.391 17.0577 14.1573 16.8814L14.0904 16.8226L9.28241 11.9319C9.06972 11.7155 9.05037 11.3761 9.22438 11.1373L9.28238 11.069L14.0903 6.17745C14.3236 5.94015 14.701 5.94095 14.9332 6.17924C15.1444 6.39586 15.1629 6.73417 14.9893 6.97218L14.9315 7.04035L10.5479 11.5006L14.9315 15.9596Z" fill="#040415"/>
</svg>
''';

const nextSvgString = '''
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M9.38935 7.04039C9.15608 6.80311 9.15527 6.41757 9.38753 6.17927C9.59868 5.96263 9.92976 5.94225 10.1635 6.11861L10.2304 6.17742L15.0384 11.0681C15.2511 11.2845 15.2704 11.6239 15.0964 11.8627L15.0384 11.931L10.2305 16.8225C9.99723 17.0598 9.61985 17.059 9.38757 16.8208C9.1764 16.6041 9.15785 16.2658 9.33146 16.0278L9.38931 15.9597L13.7729 11.4994L9.38935 7.04039Z" fill="#686873"/>
</svg>
''';

const generalSvgString = '''
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M11.8843 18.6217L5.45044 21.8643C4.96457 22.1304 4.35849 21.9527 4.08674 21.4645C4.00737 21.311 3.9654 21.1404 3.96436 20.967V13.709C3.96436 14.4286 4.36647 14.8728 5.42422 15.3702L11.8843 18.6217Z" fill="#CDCDD0"/>
<path fill-rule="evenodd" clip-rule="evenodd" d="M8.81599 2H14.9352C17.6189 2 19.7956 3.06605 19.8218 5.79337V20.9668C19.8207 21.1374 19.7787 21.3051 19.6994 21.4554C19.572 21.7007 19.3519 21.8827 19.0898 21.9598C18.8277 22.0368 18.546 22.0023 18.3095 21.8641L11.8843 18.6215L5.42422 15.3701C4.36647 14.8726 3.96436 14.4284 3.96436 13.7088V5.79337C3.96436 3.06605 6.14104 2 8.81599 2ZM8.15163 9.62227H15.6083C16.038 9.62227 16.3863 9.26828 16.3863 8.83162C16.3863 8.39495 16.038 8.04096 15.6083 8.04096H8.15163C7.72194 8.04096 7.37361 8.39495 7.37361 8.83162C7.37361 9.26828 7.72194 9.62227 8.15163 9.62227Z" fill="#040415"/>
</svg>
''';

const securitySvgString = '''
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M16.1887 2H7.59694C4.23814 2 1.98242 4.378 1.98242 7.917V16.084C1.98242 19.622 4.23814 22 7.59694 22H16.1877C19.5465 22 21.8042 19.622 21.8042 16.084V7.917C21.8042 4.378 19.5475 2 16.1887 2Z" fill="#CDCDD0"/>
<path fill-rule="evenodd" clip-rule="evenodd" d="M11.2134 11.2484H16.8627C17.269 11.2484 17.606 11.5884 17.606 11.9984V13.8484C17.606 14.2684 17.269 14.5984 16.8627 14.5984C16.4464 14.5984 16.1193 14.2684 16.1193 13.8484V12.7484H14.8012V13.8484C14.8012 14.2684 14.4642 14.5984 14.0579 14.5984C13.6416 14.5984 13.3146 14.2684 13.3146 13.8484V12.7484H11.2134C10.8963 13.8184 9.92503 14.5984 8.76545 14.5984C7.33829 14.5984 6.17871 13.4384 6.17871 11.9984C6.17871 10.5684 7.33829 9.39844 8.76545 9.39844C9.92503 9.39844 10.8963 10.1784 11.2134 11.2484ZM7.66534 11.9984C7.66534 12.6084 8.16089 13.0984 8.76545 13.0984C9.36011 13.0984 9.85565 12.6084 9.85565 11.9984C9.85565 11.3884 9.36011 10.8984 8.76545 10.8984C8.16089 10.8984 7.66534 11.3884 7.66534 11.9984Z" fill="#040415"/>
</svg>
''';

const notificationSvgString = '''
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M13.8837 19.2285C13.3883 19.1217 10.3692 19.1217 9.87377 19.2285C9.45021 19.3272 8.99219 19.5568 8.99219 20.0604C9.01681 20.5408 9.29557 20.9648 9.68169 21.2337L9.68071 21.2347C10.1801 21.6275 10.7662 21.8773 11.3798 21.9669C11.7069 22.0122 12.0398 22.0102 12.3786 21.9669C12.9913 21.8773 13.5774 21.6275 14.0768 21.2347L14.0758 21.2337C14.4619 20.9648 14.7407 20.5408 14.7653 20.0604C14.7653 19.5568 14.3073 19.3272 13.8837 19.2285Z" fill="#CDCDD0"/>
<path fill-rule="evenodd" clip-rule="evenodd" d="M19.5933 11.6453C18.8693 10.7923 18.5403 10.0531 18.5403 8.79716V8.37013C18.5403 6.73354 18.167 5.67907 17.3554 4.62459C16.1044 2.98699 13.9985 2 11.9368 2H11.8492C9.8309 2 7.79095 2.94167 6.51833 4.5128C5.66236 5.58842 5.2457 6.68822 5.2457 8.37013V8.79716C5.2457 10.0531 4.93838 10.7923 4.19273 11.6453C3.64408 12.2738 3.46875 13.0815 3.46875 13.9557C3.46875 14.8309 3.75342 15.6598 4.32472 16.3336C5.07037 17.1413 6.12334 17.6569 7.19896 17.7466C8.75626 17.9258 10.3136 17.9933 11.8935 17.9933C13.4725 17.9933 15.0298 17.8805 16.588 17.7466C17.6627 17.6569 18.7156 17.1413 19.4613 16.3336C20.0316 15.6598 20.3173 14.8309 20.3173 13.9557C20.3173 13.0815 20.1419 12.2738 19.5933 11.6453Z" fill="#040415"/>
</svg>
''';

const deviceSvgString = '''
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<rect x="3.96436" y="4" width="15.8574" height="16" rx="4" fill="#040415"/>
</svg>
''';

const rateSvgString = '''
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M12.8609 3.11361L15.0676 7.58789C15.2301 7.91205 15.5404 8.13717 15.8983 8.18719L20.8548 8.91556C21.1442 8.95658 21.4069 9.11066 21.5844 9.34578C21.7598 9.5779 21.8352 9.87205 21.7925 10.1612C21.7579 10.4013 21.6458 10.6234 21.4743 10.7935L17.8829 14.3063C17.6202 14.5514 17.5012 14.9146 17.5646 15.2698L18.4489 20.2083C18.5431 20.8046 18.1515 21.3669 17.5646 21.48C17.3228 21.519 17.0749 21.478 16.8569 21.3659L12.4356 19.0417C12.1075 18.8746 11.7199 18.8746 11.3918 19.0417L6.9706 21.3659C6.42737 21.657 5.75427 21.4589 5.45192 20.9187C5.33991 20.7036 5.30026 20.4584 5.33693 20.2193L6.22118 15.2798C6.28462 14.9256 6.16467 14.5604 5.90297 14.3153L2.31148 10.8045C1.88423 10.3883 1.87134 9.70296 2.28273 9.27175C2.29165 9.26274 2.30157 9.25274 2.31148 9.24273C2.48198 9.06764 2.70602 8.95658 2.9479 8.92757L7.90441 8.1982C8.26127 8.14717 8.57155 7.92406 8.73512 7.59789L10.8625 3.11361C11.0518 2.72942 11.4443 2.4903 11.8706 2.5003H12.0034C12.3732 2.54533 12.6954 2.77644 12.8609 3.11361Z" fill="#040415"/>
</svg>
''';

const shareWithFriendsSvgString = '''
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M14.2792 8.99977V7.40977C14.2792 6.51977 15.3496 6.06977 15.974 6.69977L20.5231 11.2898C20.9096 11.6798 20.9096 12.3098 20.5231 12.6998L15.974 17.2898C15.3496 17.9198 14.2792 17.4798 14.2792 16.5898V14.8998C9.32379 14.8998 5.85498 16.4998 3.37725 19.9998C4.36834 14.9998 7.34161 9.99977 14.2792 8.99977Z" fill="#040415"/>
</svg>
''';

const aboutUsSvgString = '''
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M16.1946 2H7.6019C4.24211 2 1.98242 4.38 1.98242 7.92V16.09C1.98242 19.62 4.24211 22 7.6019 22H16.1946C19.5544 22 21.8042 19.62 21.8042 16.09V7.92C21.8042 4.38 19.5544 2 16.1946 2Z" fill="#CDCDD0"/>
<path fill-rule="evenodd" clip-rule="evenodd" d="M11.0255 8.18945C11.0255 8.67145 11.413 9.06445 11.8878 9.06445C12.3764 9.06445 12.7649 8.67145 12.7649 8.18945C12.7649 7.70745 12.3764 7.31445 11.8977 7.31445C11.417 7.31445 11.0255 7.70745 11.0255 8.18945ZM12.7549 11.3623C12.7549 10.8803 12.3654 10.4873 11.8877 10.4873C11.41 10.4873 11.0205 10.8803 11.0205 11.3623V15.7823C11.0205 16.2643 11.41 16.6573 11.8877 16.6573C12.3654 16.6573 12.7549 16.2643 12.7549 15.7823V11.3623Z" fill="#040415"/>
</svg>
''';

const supportSvgString = '''
<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M2.97314 17.2747V9.4C2.97314 7.15979 2.97314 6.03969 3.40523 5.18404C3.78531 4.43139 4.39178 3.81947 5.13772 3.43597C5.98574 3 7.09587 3 9.31611 3H14.4698C16.69 3 17.8001 3 18.6482 3.43597C19.3941 3.81947 20.0006 4.43139 20.3807 5.18404C20.8127 6.03969 20.8127 7.15979 20.8127 9.4V10.6C20.8127 12.8402 20.8127 13.9603 20.3807 14.816C20.0006 15.5686 19.3941 16.1805 18.6482 16.564C17.8001 17 16.69 17 14.4698 17H10.2667C9.76997 17 9.52158 17 9.28851 17.0578C9.0819 17.109 8.88481 17.1935 8.70481 17.3079C8.50176 17.4371 8.32929 17.6174 7.98437 17.9781L7.06353 18.9411C5.78496 20.2782 5.14568 20.9468 4.59498 20.9975C4.11733 21.0415 3.64799 20.8503 3.33453 20.484C2.97314 20.0617 2.97314 19.1327 2.97314 17.2747Z" fill="#CDCDD0"/>
<path d="M7.92859 11C8.47595 11 8.91968 10.5523 8.91968 10C8.91968 9.44772 8.47595 9 7.92859 9C7.38123 9 6.9375 9.44772 6.9375 10C6.9375 10.5523 7.38123 11 7.92859 11Z" fill="#040415"/>
<path d="M12.884 10C12.884 10.5523 12.4403 11 11.8929 11C11.3456 11 10.9019 10.5523 10.9019 10C10.9019 9.44772 11.3456 9 11.8929 9C12.4403 9 12.884 9.44772 12.884 10Z" fill="#040415"/>
<path d="M16.8484 10C16.8484 10.5523 16.4047 11 15.8573 11C15.3099 11 14.8662 10.5523 14.8662 10C14.8662 9.44772 15.3099 9 15.8573 9C16.4047 9 16.8484 9.44772 16.8484 10Z" fill="#040415"/>
</svg>
''';

const logoutSvgString = '''
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
<path fill-rule="evenodd" clip-rule="evenodd" d="M1.98242 6.447C1.98242 3.996 3.99457 2 6.46664 2H11.3835C13.8506 2 15.8577 3.99 15.8577 6.437V17.553C15.8577 20.005 13.8455 22 11.3724 22H6.45756C3.98953 22 1.98242 20.01 1.98242 17.563V16.623V6.447Z" fill="#CDCDD0"/>
<path fill-rule="evenodd" clip-rule="evenodd" d="M21.5849 11.455L18.7645 8.54604C18.473 8.24604 18.0039 8.24604 17.7134 8.54804C17.4238 8.85004 17.4247 9.33704 17.7153 9.63704L19.2606 11.23H17.779H9.46345C9.05322 11.23 8.72021 11.575 8.72021 12C8.72021 12.426 9.05322 12.77 9.46345 12.77H19.2606L17.7153 14.363C17.4247 14.663 17.4238 15.15 17.7134 15.452C17.8591 15.603 18.0493 15.679 18.2404 15.679C18.4296 15.679 18.6197 15.603 18.7645 15.454L21.5849 12.546C21.7249 12.401 21.804 12.205 21.804 12C21.804 11.796 21.7249 11.6 21.5849 11.455" fill="#040415"/>
</svg>
''';

final devicesMock = [
  ScanResult(
    device: BluetoothDevice(
      remoteId: const DeviceIdentifier("1"),
    ),
    advertisementData: AdvertisementData(
      serviceUuids: [],
      advName: 'Iphone 13',
      txPowerLevel: null,
      connectable: true,
      manufacturerData: {},
      serviceData: {},
    ),
    rssi: 12,
    timeStamp: DateTime.now(),
  ),
  ScanResult(
    device: BluetoothDevice(
      remoteId: const DeviceIdentifier("2"),
    ),
    advertisementData: AdvertisementData(
      serviceUuids: [],
      advName: 'Iphone 11',
      txPowerLevel: null,
      connectable: true,
      manufacturerData: {},
      serviceData: {},
    ),
    rssi: 13,
    timeStamp: DateTime.now(),
  ),
  ScanResult(
    device: BluetoothDevice(
      remoteId: const DeviceIdentifier("3"),
    ),
    advertisementData: AdvertisementData(
      serviceUuids: [],
      advName: 'Samsung Galaxy S24',
      txPowerLevel: null,
      connectable: true,
      manufacturerData: {},
      serviceData: {},
    ),
    rssi: 9,
    timeStamp: DateTime.now(),
  ),
  ScanResult(
    device: BluetoothDevice(
      remoteId: const DeviceIdentifier("5"),
    ),
    advertisementData: AdvertisementData(
      serviceUuids: [],
      advName: 'Google Pixel 6',
      txPowerLevel: null,
      connectable: true,
      manufacturerData: {},
      serviceData: {},
    ),
    rssi: 10,
    timeStamp: DateTime.now(),
  ),
];
