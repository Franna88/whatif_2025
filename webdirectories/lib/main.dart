import 'package:cached_firestorage/cached_firestorage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:webdirectories/routes/mobileRouterConfig.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase for mobile platforms
  await Firebase.initializeApp();

  // Configure cache timeout for Firestorage
  CachedFirestorage.instance.cacheTimeout = 30;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print('Building Mobile App');
    GoRouter _router = MobileRouterconfig.returnRouter();

    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      routerDelegate: _router.routerDelegate,
      title: 'Web Directories Mobile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
