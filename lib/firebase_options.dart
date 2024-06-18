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
    apiKey: 'AIzaSyAPDcjN_NUpFodvIVFnuhoj4ln3EtdIoXI',
    appId: '1:1052696179557:web:e6b30d3b0f22246debe78c',
    messagingSenderId: '1052696179557',
    projectId: 'myfakeflix',
    authDomain: 'myfakeflix.firebaseapp.com',
    storageBucket: 'myfakeflix.appspot.com',
    measurementId: 'G-37Z5KKLWE6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyASzf3DUB8ETqjgbyZ1W2QiN5bSbaMwu8U',
    appId: '1:1052696179557:android:d6226d70a53bb1bcebe78c',
    messagingSenderId: '1052696179557',
    projectId: 'myfakeflix',
    storageBucket: 'myfakeflix.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDqm11XIn9Z6Rrot33lRxi9Hyve-z5JuXM',
    appId: '1:1052696179557:ios:932c94ba12860ef6ebe78c',
    messagingSenderId: '1052696179557',
    projectId: 'myfakeflix',
    storageBucket: 'myfakeflix.appspot.com',
    iosBundleId: 'com.example.movieExplorer',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDqm11XIn9Z6Rrot33lRxi9Hyve-z5JuXM',
    appId: '1:1052696179557:ios:932c94ba12860ef6ebe78c',
    messagingSenderId: '1052696179557',
    projectId: 'myfakeflix',
    storageBucket: 'myfakeflix.appspot.com',
    iosBundleId: 'com.example.movieExplorer',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAPDcjN_NUpFodvIVFnuhoj4ln3EtdIoXI',
    appId: '1:1052696179557:web:5f27112bc0063678ebe78c',
    messagingSenderId: '1052696179557',
    projectId: 'myfakeflix',
    authDomain: 'myfakeflix.firebaseapp.com',
    storageBucket: 'myfakeflix.appspot.com',
    measurementId: 'G-J2CGZPEH4V',
  );
}