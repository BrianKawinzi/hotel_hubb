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
    apiKey: 'AIzaSyB4kjfDKKaWOP4zmylUD1JILhwGXMl7b40',
    appId: '1:488028831633:web:495fba3a12e4af6729e430',
    messagingSenderId: '488028831633',
    projectId: 'hotelhubb-5a7eb',
    authDomain: 'hotelhubb-5a7eb.firebaseapp.com',
    storageBucket: 'hotelhubb-5a7eb.appspot.com',
    measurementId: 'G-XMSB7XB9DD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAiEFS1Rm2XY3bEy2xYlE02Mw7wKvSu7p0',
    appId: '1:488028831633:android:c5e49d26d1a3f40f29e430',
    messagingSenderId: '488028831633',
    projectId: 'hotelhubb-5a7eb',
    storageBucket: 'hotelhubb-5a7eb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCtH8U8ed6b1wIC5wfYLTAHk1roz_yuwNk',
    appId: '1:488028831633:ios:641cb6131af98e4c29e430',
    messagingSenderId: '488028831633',
    projectId: 'hotelhubb-5a7eb',
    storageBucket: 'hotelhubb-5a7eb.appspot.com',
    iosBundleId: 'com.example.hotelHubb',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCtH8U8ed6b1wIC5wfYLTAHk1roz_yuwNk',
    appId: '1:488028831633:ios:81e95833d1eab34e29e430',
    messagingSenderId: '488028831633',
    projectId: 'hotelhubb-5a7eb',
    storageBucket: 'hotelhubb-5a7eb.appspot.com',
    iosBundleId: 'com.example.hotelHubb.RunnerTests',
  );
}