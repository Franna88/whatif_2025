import 'package:cached_firestorage/cached_firestorage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/MyHome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminPortal.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/services.dart';
import 'package:webdirectories/PanelBeatersDirectory/panelBeatersHome.dart';

import 'package:dart_ipify/dart_ipify.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDrcaRErNxL1GhUvMj4Cx6f0r9eKDwCgko",
            authDomain: "web-directories.firebaseapp.com",
            projectId: "web-directories",
            storageBucket: "web-directories.appspot.com",
            messagingSenderId: "853657273198",
            appId: "1:853657273198:web:d5ebc0dbaecd2023ff377f"));
  } else {
    await Firebase.initializeApp();
  }
  CachedFirestorage.instance.cacheTimeout = 30;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Web Directories',
      home: const MyHome(),
    );
  }
}
