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
    apiKey: 'AIzaSyD4Ld55Q1rurU-LdcBWUC6dcqGFE4rRqIM',
    appId: '1:241956199411:web:9538c7e606bf25a1755086',
    messagingSenderId: '241956199411',
    projectId: 'fsterapi',
    authDomain: 'fsterapi.firebaseapp.com',
    storageBucket: 'fsterapi.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCb749mhDHDW4uFnYL5N3mkU6tyxbuzst8',
    appId: '1:241956199411:android:a0cda8b6c4c314e4755086',
    messagingSenderId: '241956199411',
    projectId: 'fsterapi',
    storageBucket: 'fsterapi.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBmtAvsaHyfwJ3FscLpcngqU87xTStxaU8',
    appId: '1:241956199411:ios:9196b9605f28e048755086',
    messagingSenderId: '241956199411',
    projectId: 'fsterapi',
    storageBucket: 'fsterapi.appspot.com',
    iosBundleId: 'com.nusantaratechgroup.fisioterapiku',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBmtAvsaHyfwJ3FscLpcngqU87xTStxaU8',
    appId: '1:241956199411:ios:9196b9605f28e048755086',
    messagingSenderId: '241956199411',
    projectId: 'fsterapi',
    storageBucket: 'fsterapi.appspot.com',
    iosBundleId: 'com.nusantaratechgroup.fisioterapiku',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD4Ld55Q1rurU-LdcBWUC6dcqGFE4rRqIM',
    appId: '1:241956199411:web:7ea118ee8c7fa821755086',
    messagingSenderId: '241956199411',
    projectId: 'fsterapi',
    authDomain: 'fsterapi.firebaseapp.com',
    storageBucket: 'fsterapi.appspot.com',
  );
}
