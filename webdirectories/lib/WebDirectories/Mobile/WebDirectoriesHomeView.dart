import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileView.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage1/MobilePage1.dart';
import 'dart:developer' as developer;

class WebDirectoriesHomeView extends StatefulWidget {
  const WebDirectoriesHomeView({super.key});

  @override
  State<WebDirectoriesHomeView> createState() => _WebDirectoriesHomeViewState();
}

class _WebDirectoriesHomeViewState extends State<WebDirectoriesHomeView> {
  @override
  void initState() {
    developer.log('WebDirectoriesHomeView: initState called');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    developer.log('WebDirectoriesHomeView: build called');
    return Scaffold(
      body: MobilePage1(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          developer.log('Navigating to Panel Beaters section');
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const MobileView(),
            ),
          );
        },
        label: const Text('Panel Beaters'),
        icon: const Icon(Icons.car_repair),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
