import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyAisj5eS7z2W1Ne-xhRkFakLDL-9MMIhRc',
    appId: '1:272658838521:web:37443c74ad1ec23dd2c328',
    messagingSenderId: '272658838521',
    projectId: 'personal-finance-applica-ed95f',
    authDomain: 'personal-finance-applica-ed95f.firebaseapp.com',
    storageBucket: 'personal-finance-applica-ed95f.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBmWC1m8366AyL9n5_d0fqvejB3whNuSCA',
    appId: '1:272658838521:android:d7fb3e67b2cbccf6d2c328',
    messagingSenderId: '272658838521',
    projectId: 'personal-finance-applica-ed95f',
    storageBucket: 'personal-finance-applica-ed95f.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDS2zS_8in-N2wAk4jExLYUCZrWRlpJlYo',
    appId: '1:272658838521:ios:71719daaf7c305f8d2c328',
    messagingSenderId: '272658838521',
    projectId: 'personal-finance-applica-ed95f',
    storageBucket: 'personal-finance-applica-ed95f.firebasestorage.app',
    iosBundleId: 'com.example.personalFinanceApplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDS2zS_8in-N2wAk4jExLYUCZrWRlpJlYo',
    appId: '1:272658838521:ios:71719daaf7c305f8d2c328',
    messagingSenderId: '272658838521',
    projectId: 'personal-finance-applica-ed95f',
    storageBucket: 'personal-finance-applica-ed95f.firebasestorage.app',
    iosBundleId: 'com.example.personalFinanceApplication',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAisj5eS7z2W1Ne-xhRkFakLDL-9MMIhRc',
    appId: '1:272658838521:web:16b1715a92f783acd2c328',
    messagingSenderId: '272658838521',
    projectId: 'personal-finance-applica-ed95f',
    authDomain: 'personal-finance-applica-ed95f.firebaseapp.com',
    storageBucket: 'personal-finance-applica-ed95f.firebasestorage.app',
  );
}
