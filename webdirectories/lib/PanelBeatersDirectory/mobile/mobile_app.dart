import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class MobileApp extends StatelessWidget {
  const MobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'What If 2025',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MobileHomeScreen(),
    );
  }
}

class MobileHomeScreen extends StatefulWidget {
  const MobileHomeScreen({super.key});

  @override
  State<MobileHomeScreen> createState() => _MobileHomeScreenState();
}

class _MobileHomeScreenState extends State<MobileHomeScreen> {
  @override
  void initState() {
    super.initState();
    _initFirebase();
  }

  Future<void> _initFirebase() async {
    try {
      await Firebase.initializeApp();
      print("Firebase initialized for mobile");
    } catch (e) {
      print("Failed to initialize Firebase: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('What If 2025'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 200,
              height: 200,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.image, size: 200);
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome to What If 2025',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Mobile App Coming Soon',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
