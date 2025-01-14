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
    apiKey: 'AIzaSyCR21DBWac0L_fzvYtItIjVXyZWI67q_2k',
    appId: '1:521544466601:web:65aff3e63ca126ad90a9b8',
    messagingSenderId: '521544466601',
    projectId: 'flickflix-552c7',
    authDomain: 'flickflix-552c7.firebaseapp.com',
    storageBucket: 'flickflix-552c7.appspot.com',
    measurementId: 'G-187JQR8PT8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBbXLEESSu72GHpVEoCmxPG4OXWL4wx2Ms',
    appId: '1:521544466601:android:c87d0b011e3c4f0b90a9b8',
    messagingSenderId: '521544466601',
    projectId: 'flickflix-552c7',
    storageBucket: 'flickflix-552c7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD1h2EwQcn3mvAdTRs4yIpWfuNdr_NSyg8',
    appId: '1:521544466601:ios:a9f31d3dea38b14f90a9b8',
    messagingSenderId: '521544466601',
    projectId: 'flickflix-552c7',
    storageBucket: 'flickflix-552c7.appspot.com',
    iosBundleId: 'com.flickflix.flickflix',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD1h2EwQcn3mvAdTRs4yIpWfuNdr_NSyg8',
    appId: '1:521544466601:ios:327b4abc00f7a82e90a9b8',
    messagingSenderId: '521544466601',
    projectId: 'flickflix-552c7',
    storageBucket: 'flickflix-552c7.appspot.com',
    iosBundleId: 'com.flickflix.flickflix.RunnerTests',
  );
}
