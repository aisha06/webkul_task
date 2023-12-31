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
    apiKey: 'AIzaSyCsS77ebGH0yhNhnc_ztTBioaqNcYzhLN4',
    appId: '1:545371791148:web:caa1ad0f67958e55f75689',
    messagingSenderId: '545371791148',
    projectId: 'whatsapp-backend-28e8c',
    authDomain: 'whatsapp-backend-28e8c.firebaseapp.com',
    storageBucket: 'whatsapp-backend-28e8c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAoMIFm64BlbeIzYO9ul48TXzFG6lNX-Ys',
    appId: '1:545371791148:android:c2703ae2c68e2ae9f75689',
    messagingSenderId: '545371791148',
    projectId: 'whatsapp-backend-28e8c',
    storageBucket: 'whatsapp-backend-28e8c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCAJ0X89z-K4EXlIhXA6d5e92v0OMr2NSM',
    appId: '1:545371791148:ios:25c35cb82f4fe466f75689',
    messagingSenderId: '545371791148',
    projectId: 'whatsapp-backend-28e8c',
    storageBucket: 'whatsapp-backend-28e8c.appspot.com',
    iosClientId: '545371791148-6sfdrarepn15m71s2i55fr575h7i4b2s.apps.googleusercontent.com',
    iosBundleId: 'com.example.whatsappClone',
  );
}
