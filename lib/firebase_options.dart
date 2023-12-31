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
    apiKey: 'AIzaSyDBnkJhpEmjSZ-15EcRJS78Tt3_tvQELLc',
    appId: '1:901416996063:web:56dbaad77b233ab3336d6a',
    messagingSenderId: '901416996063',
    projectId: 'my-sandbox-8c7e5',
    authDomain: 'my-sandbox-8c7e5.firebaseapp.com',
    storageBucket: 'my-sandbox-8c7e5.appspot.com',
    measurementId: 'G-FK00GL3CJ5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB9qtVF1vYLoi5qthYt22_FAuG0X7kVbXc',
    appId: '1:901416996063:android:fbf2373305673e1d336d6a',
    messagingSenderId: '901416996063',
    projectId: 'my-sandbox-8c7e5',
    storageBucket: 'my-sandbox-8c7e5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDNkxgx6QD_POLDIMtMLQK_bDcpYEE9Od8',
    appId: '1:901416996063:ios:4c59310b31712121336d6a',
    messagingSenderId: '901416996063',
    projectId: 'my-sandbox-8c7e5',
    storageBucket: 'my-sandbox-8c7e5.appspot.com',
    iosBundleId: 'com.omsoftpos.mobile.omsoftPosMobile',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDNkxgx6QD_POLDIMtMLQK_bDcpYEE9Od8',
    appId: '1:901416996063:ios:a8f27c5f169b051d336d6a',
    messagingSenderId: '901416996063',
    projectId: 'my-sandbox-8c7e5',
    storageBucket: 'my-sandbox-8c7e5.appspot.com',
    iosBundleId: 'com.omsoftpos.mobile.omsoftPosMobile.RunnerTests',
  );
}
