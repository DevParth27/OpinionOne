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
    apiKey: 'AIzaSyBJwVLbHm19CvBZK-qx-wOtc9D_srUbp8g',
    appId: '1:483180629127:web:e96fb3487fcb6f32707c22',
    messagingSenderId: '483180629127',
    projectId: 'event-management-d9a3c',
    authDomain: 'event-management-d9a3c.firebaseapp.com',
    storageBucket: 'event-management-d9a3c.appspot.com',
    measurementId: 'G-T6ZLG5PGXL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyChfryg3Ct2GifE8GB4KIdV6Ps8hnFMV1A',
    appId: '1:483180629127:android:22bc358ce6c9e7a9707c22',
    messagingSenderId: '483180629127',
    projectId: 'event-management-d9a3c',
    storageBucket: 'event-management-d9a3c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAzth30z8gOyY-xpjD7_T05pOQx-fGW3WQ',
    appId: '1:483180629127:ios:027704a806145a7f707c22',
    messagingSenderId: '483180629127',
    projectId: 'event-management-d9a3c',
    storageBucket: 'event-management-d9a3c.appspot.com',
    iosBundleId: 'com.example.eventUser',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAzth30z8gOyY-xpjD7_T05pOQx-fGW3WQ',
    appId: '1:483180629127:ios:027704a806145a7f707c22',
    messagingSenderId: '483180629127',
    projectId: 'event-management-d9a3c',
    storageBucket: 'event-management-d9a3c.appspot.com',
    iosBundleId: 'com.example.eventUser',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBJwVLbHm19CvBZK-qx-wOtc9D_srUbp8g',
    appId: '1:483180629127:web:ff3700e6dcc5f74d707c22',
    messagingSenderId: '483180629127',
    projectId: 'event-management-d9a3c',
    authDomain: 'event-management-d9a3c.firebaseapp.com',
    storageBucket: 'event-management-d9a3c.appspot.com',
    measurementId: 'G-N9L1DQ3PRL',
  );
}
