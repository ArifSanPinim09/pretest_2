// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyD9x6d0ZOo5Ac0Jyi39_woDf44ucqAt6_U',
    appId: '1:893968199667:web:8a2670ba436612a87bec86',
    messagingSenderId: '893968199667',
    projectId: 'pretest-2',
    authDomain: 'pretest-2.firebaseapp.com',
    storageBucket: 'pretest-2.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDSXC9G2XW1EtV1FYyKwNZI-ZQHRagObS4',
    appId: '1:893968199667:android:bf3de08e3f8ee3437bec86',
    messagingSenderId: '893968199667',
    projectId: 'pretest-2',
    storageBucket: 'pretest-2.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCot2cWLQfSX_A8Txi-_WOd_P8KUJs1evc',
    appId: '1:893968199667:ios:293bef371b5c85477bec86',
    messagingSenderId: '893968199667',
    projectId: 'pretest-2',
    storageBucket: 'pretest-2.firebasestorage.app',
    iosBundleId: 'com.example.pretest2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCot2cWLQfSX_A8Txi-_WOd_P8KUJs1evc',
    appId: '1:893968199667:ios:293bef371b5c85477bec86',
    messagingSenderId: '893968199667',
    projectId: 'pretest-2',
    storageBucket: 'pretest-2.firebasestorage.app',
    iosBundleId: 'com.example.pretest2',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD9x6d0ZOo5Ac0Jyi39_woDf44ucqAt6_U',
    appId: '1:893968199667:web:096266e2199542f67bec86',
    messagingSenderId: '893968199667',
    projectId: 'pretest-2',
    authDomain: 'pretest-2.firebaseapp.com',
    storageBucket: 'pretest-2.firebasestorage.app',
  );
}
