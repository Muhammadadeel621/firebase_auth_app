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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBF1CZFc8zPylib5lRUDE84YLM8YNQorUw',
    appId: '1:1047629338767:web:b3ea84d1b387ab761038fa',
    messagingSenderId: '1047629338767',
    projectId: 'fir-authentication-app-490be',
    authDomain: 'fir-authentication-app-490be.firebaseapp.com',
    storageBucket: 'fir-authentication-app-490be.firebasestorage.app',
    measurementId: 'G-ZJ4QGFGVRP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyABmN0AS-SulLIUuQAxLqwU2hBnEozHzNM',
    appId: '1:1047629338767:android:0ea099672a605fb21038fa',
    messagingSenderId: '1047629338767',
    projectId: 'fir-authentication-app-490be',
    storageBucket: 'fir-authentication-app-490be.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA9hm9A8UNEwhn0ZPWITnxTyk7FSmloWVQ',
    appId: '1:1047629338767:ios:1b39807a7e1dcf171038fa',
    messagingSenderId: '1047629338767',
    projectId: 'fir-authentication-app-490be',
    storageBucket: 'fir-authentication-app-490be.firebasestorage.app',
    iosBundleId: 'com.example.assignfirebaseauthapp',
  );
}
