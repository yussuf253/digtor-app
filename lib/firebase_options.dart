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
    apiKey: 'AIzaSyCYy2nyVXHl7rd7CYhjeUupKmMvxzWGGDk',
    appId: '1:892066469328:web:2ec45d3accee7abcda55d5',
    messagingSenderId: '892066469328',
    projectId: 'digtor253',
    authDomain: 'digtor253.firebaseapp.com',
    storageBucket: 'digtor253.firebasestorage.app',
    measurementId: 'G-Q7CVBSZC5L',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAJxkRGKbbqH59qzKflwYBZfufx8dtYs_0',
    appId: '1:892066469328:android:a888cf99fcf703c2da55d5',
    messagingSenderId: '892066469328',
    projectId: 'digtor253',
    storageBucket: 'digtor253.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCitAIm07tRRIXqq2NWnwEkBW0eV2A5wFo',
    appId: '1:892066469328:ios:8a38e6232b6d212eda55d5',
    messagingSenderId: '892066469328',
    projectId: 'digtor253',
    storageBucket: 'digtor253.firebasestorage.app',
    iosBundleId: 'com.digtor.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCitAIm07tRRIXqq2NWnwEkBW0eV2A5wFo',
    appId: '1:892066469328:ios:8a38e6232b6d212eda55d5',
    messagingSenderId: '892066469328',
    projectId: 'digtor253',
    storageBucket: 'digtor253.firebasestorage.app',
    iosBundleId: 'com.digtor.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCYy2nyVXHl7rd7CYhjeUupKmMvxzWGGDk',
    appId: '1:892066469328:web:33437a3017fa8561da55d5',
    messagingSenderId: '892066469328',
    projectId: 'digtor253',
    authDomain: 'digtor253.firebaseapp.com',
    storageBucket: 'digtor253.firebasestorage.app',
    measurementId: 'G-MF911RGNS8',
  );
}
