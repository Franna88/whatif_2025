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
      appBar: AppBar(
        title: const Text('Panel Beaters Directory'),
        leading: widget.onBackPressed != null
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  developer
                      .log('Navigating back to WebDirectories using callback');
                  widget.onBackPressed!();
                },
              )
            : null,
      ),
      body: const Mobilelandingpage(),
    );
  }
}
