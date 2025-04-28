import 'package:flutter/material.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage1/MobilePage1.dart';
import 'dart:developer' as developer;

class WebDirectoriesHomeView extends StatefulWidget {
  final VoidCallback? onPanelBeatersPressed;

  const WebDirectoriesHomeView({
    super.key,
    this.onPanelBeatersPressed,
  });

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
      floatingActionButton: widget.onPanelBeatersPressed != null
          ? FloatingActionButton.extended(
              onPressed: () {
                developer
                    .log('Navigating to Panel Beaters section using callback');
                widget.onPanelBeatersPressed!();
              },
              label: const Text('Panel Beaters'),
              icon: const Icon(Icons.car_repair),
              backgroundColor: Colors.blue,
            )
          : null,
    );
  }
}
