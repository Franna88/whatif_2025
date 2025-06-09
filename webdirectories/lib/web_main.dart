import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/panelBeatersHome.dart';

void runWebApp() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'What If 2025',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const PanelBeatersHome(),
    );
  }
}
