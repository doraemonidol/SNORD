// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDlub35hor6TkusTytzeYGCUMjmHbqEKGk',
    appId: '1:583332305252:web:c0c45126fbb0d78023c271',
    messagingSenderId: '583332305252',
    projectId: 'hcmuwus-rehabox',
    authDomain: 'hcmuwus-rehabox.firebaseapp.com',
    storageBucket: 'hcmuwus-rehabox.appspot.com',
    measurementId: 'G-L6QENTELXK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBiw2loh2kaqAV648oZe4YIiuZAtDX4I9o',
    appId: '1:583332305252:android:0ac7cde0ff4f238723c271',
    messagingSenderId: '583332305252',
    projectId: 'hcmuwus-rehabox',
    storageBucket: 'hcmuwus-rehabox.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDyOLoGbgbhs006v7puBEPj1nM_MEewlM8',
    appId: '1:583332305252:ios:f715ae36c370037423c271',
    messagingSenderId: '583332305252',
    projectId: 'hcmuwus-rehabox',
    storageBucket: 'hcmuwus-rehabox.appspot.com',
    iosBundleId: 'com.example.rehabox',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDyOLoGbgbhs006v7puBEPj1nM_MEewlM8',
    appId: '1:583332305252:ios:98d23838e7cbaa1623c271',
    messagingSenderId: '583332305252',
    projectId: 'hcmuwus-rehabox',
    storageBucket: 'hcmuwus-rehabox.appspot.com',
    iosBundleId: 'com.example.rehabox.RunnerTests',
  );
}
