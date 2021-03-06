// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDyfIQcrbGnvfjvXCcvtlsvSN_MBdHXskY',
    appId: '1:1036694702033:web:0dd3bccaec3659f4b8c2f0',
    messagingSenderId: '1036694702033',
    projectId: 'fluttertask-3c7b7',
    authDomain: 'fluttertask-3c7b7.firebaseapp.com',
    storageBucket: 'fluttertask-3c7b7.appspot.com',
    measurementId: 'G-XF20RMQR75',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBS8ktHQ_mJzGl8b08Nf2qJKn61ovceJRI',
    appId: '1:1036694702033:android:a650e1f6d0ab18d0b8c2f0',
    messagingSenderId: '1036694702033',
    projectId: 'fluttertask-3c7b7',
    storageBucket: 'fluttertask-3c7b7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD5tDTSvHmLZPJ5_bg_CzRspT8nwRFoKdg',
    appId: '1:1036694702033:ios:7ff78b74c9c72955b8c2f0',
    messagingSenderId: '1036694702033',
    projectId: 'fluttertask-3c7b7',
    storageBucket: 'fluttertask-3c7b7.appspot.com',
    androidClientId: '1036694702033-r1nt87am023ouae9jhcrkdh7oev18fa4.apps.googleusercontent.com',
    iosClientId: '1036694702033-caqpv4b927cciokk22pvd826e0ul7nv5.apps.googleusercontent.com',
    iosBundleId: 'com.jaymalave.fluttertask',
  );
}
