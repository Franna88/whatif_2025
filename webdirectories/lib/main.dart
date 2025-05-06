import 'package:cached_firestorage/cached_firestorage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:webdirectories/MainAppView.dart';
import 'package:webdirectories/Watif/watif_home.dart';
import 'package:webdirectories/Watif/WatifLoginPages/watif_login.dart';
import 'package:webdirectories/Watif/watif_landing.dart';
import 'package:webdirectories/Watif/watif_routes.dart';
import 'package:webdirectories/routes/mobileRouterConfig.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Initialize Firebase with appropriate options based on platform
    if (kIsWeb) {
      // Web platform Firebase configuration
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey:
              "AIzaSyCKp1rAZ9wTXDQqVVfVnB_CQXIVRXSt-Tk", // This is a public API key, not a secret
          authDomain: "web-directories.firebaseapp.com",
          projectId: "web-directories",
          storageBucket: "web-directories.appspot.com",
          messagingSenderId: "328180612387",
          appId: "1:328180612387:web:e0ea8c2c05a60fad7ee1f4",
        ),
      );
      print("Firebase initialized for web");
    } else {
      // Default initialization for mobile platforms
      await Firebase.initializeApp();
      print("Firebase initialized for mobile");
    }
  } catch (e) {
    print("Failed to initialize Firebase: $e");
    // Continue without Firebase to allow UI to load for debugging
  }

  // Configure cache timeout for Firestorage
  try {
    CachedFirestorage.instance.cacheTimeout = 30;
  } catch (e) {
    print("Failed to configure CachedFirestorage: $e");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print('Building Mobile App');

    return MaterialApp(
      title: 'Web Directories Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: WatifRoutes.landing,
      onGenerateRoute: WatifRoutes.generateRoute,
      navigatorKey: GlobalKey<NavigatorState>(),
    );
  }
}
