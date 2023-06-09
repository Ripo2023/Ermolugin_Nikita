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
    apiKey: 'AIzaSyBFz8NzsvB5XzdcBWyCSAXVK2B1PnIy6ts',
    appId: '1:758770823766:web:64414b63cfca10e5cc01f7',
    messagingSenderId: '758770823766',
    projectId: 'coffee-eb396',
    authDomain: 'coffee-eb396.firebaseapp.com',
    databaseURL: 'https://coffee-eb396-default-rtdb.firebaseio.com',
    storageBucket: 'coffee-eb396.appspot.com',
    measurementId: 'G-GNTKDSCXN4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB3zNcBco7FKnoYJq_KGbhAoALFfs_AKhM',
    appId: '1:758770823766:android:1b28a5e91ada1d68cc01f7',
    messagingSenderId: '758770823766',
    projectId: 'coffee-eb396',
    databaseURL: 'https://coffee-eb396-default-rtdb.firebaseio.com',
    storageBucket: 'coffee-eb396.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDDLWdY_zX-Sc9CcToVVzSe4FefIJUrsXg',
    appId: '1:758770823766:ios:9e848b8e90052461cc01f7',
    messagingSenderId: '758770823766',
    projectId: 'coffee-eb396',
    databaseURL: 'https://coffee-eb396-default-rtdb.firebaseio.com',
    storageBucket: 'coffee-eb396.appspot.com',
    androidClientId: '758770823766-e62hqm2de3b9trtiu7noji0kv6sefvij.apps.googleusercontent.com',
    iosClientId: '758770823766-s5g34h254h6211dt3c7g758rgcupp44g.apps.googleusercontent.com',
    iosBundleId: 'com.example.staffApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDDLWdY_zX-Sc9CcToVVzSe4FefIJUrsXg',
    appId: '1:758770823766:ios:022250f52d4122f0cc01f7',
    messagingSenderId: '758770823766',
    projectId: 'coffee-eb396',
    databaseURL: 'https://coffee-eb396-default-rtdb.firebaseio.com',
    storageBucket: 'coffee-eb396.appspot.com',
    androidClientId: '758770823766-e62hqm2de3b9trtiu7noji0kv6sefvij.apps.googleusercontent.com',
    iosClientId: '758770823766-4lbq0idiamrci0b70fhsloq2b17p3jda.apps.googleusercontent.com',
    iosBundleId: 'com.example.staffApp.RunnerTests',
  );
}
