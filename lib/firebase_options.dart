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
    apiKey: 'AIzaSyAVDsM1W2DnUaZtsxS4rBlJJhWmtmOU5K8',
    appId: '1:878958965039:web:0a42ef2b96cda7275bf1da',
    messagingSenderId: '878958965039',
    projectId: 'blooddonationapp-c70b9',
    authDomain: 'blooddonationapp-c70b9.firebaseapp.com',
    storageBucket: 'blooddonationapp-c70b9.appspot.com',
    measurementId: 'G-HGB5NL33B5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDs7nvyOfe7FkmLFc-E0Rs2hz8UNl1zWSc',
    appId: '1:878958965039:android:13fd404ae6d91eae5bf1da',
    messagingSenderId: '878958965039',
    projectId: 'blooddonationapp-c70b9',
    storageBucket: 'blooddonationapp-c70b9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC4TVZK6vBW05k_RK6SMjkvjhlfvZIaOds',
    appId: '1:878958965039:ios:30c2aad90cd886915bf1da',
    messagingSenderId: '878958965039',
    projectId: 'blooddonationapp-c70b9',
    storageBucket: 'blooddonationapp-c70b9.appspot.com',
    iosBundleId: 'com.example.myapp',
  );
}
