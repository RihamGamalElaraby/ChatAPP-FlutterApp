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
    apiKey: 'AIzaSyAyRECZcKorwhoTsQrzgtT5r1uano7AlHg',
    appId: '1:147980288969:web:cbebd0c53d989a63c7de18',
    messagingSenderId: '147980288969',
    projectId: 'chat-app-a5574',
    authDomain: 'chat-app-a5574.firebaseapp.com',
    storageBucket: 'chat-app-a5574.appspot.com',
    measurementId: 'G-3W55ZVY1ZX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCVOvQrxT0hIToFEq5xxgA4vigkm0KP4P8',
    appId: '1:147980288969:android:1be1f4ef1fe8c4e0c7de18',
    messagingSenderId: '147980288969',
    projectId: 'chat-app-a5574',
    storageBucket: 'chat-app-a5574.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBbrOBF1KaQVLVhr6Tw92OFXhnbEm3U2i4',
    appId: '1:147980288969:ios:b3192f391a4d79f1c7de18',
    messagingSenderId: '147980288969',
    projectId: 'chat-app-a5574',
    storageBucket: 'chat-app-a5574.appspot.com',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBbrOBF1KaQVLVhr6Tw92OFXhnbEm3U2i4',
    appId: '1:147980288969:ios:6c05a12b47716940c7de18',
    messagingSenderId: '147980288969',
    projectId: 'chat-app-a5574',
    storageBucket: 'chat-app-a5574.appspot.com',
    iosBundleId: 'com.example.chatapp.RunnerTests',
  );
}
