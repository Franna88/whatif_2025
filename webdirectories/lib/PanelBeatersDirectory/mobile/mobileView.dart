import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/mobileLandingPage.dart';

class MobileView extends StatefulWidget {
  const MobileView({super.key});

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  @override
  void initState() {
    developer.log('MobileView: initState called');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    developer.log('MobileView: build called');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel Beaters Directory'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            developer.log('Navigating back to WebDirectories');
            Navigator.of(context).pop();
          },
        ),
      ),
      body: const Mobilelandingpage(),
    );
  }
}
