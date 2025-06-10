import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/mobileLandingPage.dart';

class MobileView extends StatefulWidget {
  final VoidCallback? onBackPressed;

  const MobileView({
    super.key,
    this.onBackPressed,
  });

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
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Panel Beaters Directory',
          style: TextStyle(color: Colors.white),
        ),
        leading: widget.onBackPressed != null
            ? IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  developer
                      .log('Navigating back to WebDirectories using callback');
                  widget.onBackPressed!();
                },
              )
            : IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
      ),
      body: const Mobilelandingpage(),
    );
  }
}
