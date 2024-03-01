// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:rehabox/src/screens/settings/devices/controllers/devices_provider.dart';
// import 'package:rehabox/src/screens/settings/widgets/device_options_box.dart';
// import 'package:rehabox/src/utils/conditional_render_manager.dart';
// import 'package:rehabox/src/widgets/debounce_button.dart';
// import 'package:rehabox/src/widgets/extensions/build_context_extensions.dart';
// import 'package:rehabox/src/widgets/navigation_bar/config.dart';

// class DeviceScreen extends StatefulWidget {
//   const DeviceScreen({super.key});

//   static const routeName = '/fts-devices';

//   @override
//   State<DeviceScreen> createState() => _DeviceScreenState();
// }

// class _DeviceScreenState extends State<DeviceScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => DevicesProvider()..init(),
//       child: Scaffold(
//         body: Consumer<DevicesProvider>(
//           builder: conditionalRenderManager<DevicesProvider>(
//             onInitial: (BuildContext context) => SafeArea(
//               child: SingleChildScrollView(
//                 physics: const BouncingScrollPhysics(),
//                 padding: EdgeInsets.only(
//                   left: context.widthPercent(0.03) + 8,
//                   right: context.widthPercent(0.03) + 8,
//                   top: context.heightPercent(0.02),
//                 ),
//                 child: const Center(
//                   child: Column(
//                     children: [
//                       CircularProgressIndicator(
//                         valueColor: AlwaysStoppedAnimation<Color>(
//                           Color(0xFF3843FF),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             onLoaded: (BuildContext context) => const SafeArea(
//               child: DeviceOptionsBox(),
//             ),
//             onError: (BuildContext context) => Center(
//               child: Text(
//                 'Error\n${context.read<DevicesProvider>().errorMessage}',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   fontSize: context.textScaleFactor(24),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         bottomNavigationBar: Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: context.widthPercent(0.03) + 8,
//           ),
//           child: SizedBox(
//             height: kCustomBottomNavigationBarHeight + 25,
//             child: Column(
//               children: [
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'Haven’t found your device?',
//                     style: TextStyle(
//                       color: const Color(0xFF040415),
//                       fontSize: context.textScaleFactor(16),
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Consumer<DevicesProvider>(
//                   child: Text(
//                     'Retry',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: context.textScaleFactor(16),
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   builder: (context, value, child) => DebounceButton(
//                     onPressed: (context) =>
//                         context.read<DevicesProvider>().reset(),
//                     style: ButtonStyle(
//                       padding: MaterialStatePropertyAll(
//                         EdgeInsets.symmetric(
//                           horizontal: context.widthPercent(0.03),
//                           vertical: context.heightPercent(0.02),
//                         ),
//                       ),
//                       backgroundColor: MaterialStateProperty.resolveWith(
//                         (states) {
//                           if (states.contains(MaterialState.pressed)) {
//                             return const Color(0xFF3843FF).withOpacity(0.9);
//                           } else {
//                             return const Color(0xFF3843FF);
//                           }
//                         },
//                       ),
//                       minimumSize: const MaterialStatePropertyAll(
//                         Size(
//                           double.infinity,
//                           70,
//                         ),
//                       ),
//                       shape: MaterialStatePropertyAll(
//                         RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(40),
//                         ),
//                       ),
//                     ),
//                     title: child!,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
