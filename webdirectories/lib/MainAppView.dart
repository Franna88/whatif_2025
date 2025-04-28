import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileView.dart';
import 'package:webdirectories/WebDirectories/Mobile/WebDirectoriesHomeView.dart';
import 'dart:developer' as developer;

class MainAppView extends StatefulWidget {
  const MainAppView({super.key});

  @override
  State<MainAppView> createState() => _MainAppViewState();
}

class _MainAppViewState extends State<MainAppView> {
  bool _showPanelBeaters = false;

  void toggleView() {
    setState(() {
      _showPanelBeaters = !_showPanelBeaters;
    });
    developer.log('Toggled view. showPanelBeaters: $_showPanelBeaters');
  }

  @override
  void initState() {
    developer.log('MainAppView: initState called');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    developer
        .log('MainAppView: build called, showPanelBeaters: $_showPanelBeaters');

    if (_showPanelBeaters) {
      return MobileView(onBackPressed: toggleView);
    } else {
      return WebDirectoriesHomeView(onPanelBeatersPressed: toggleView);
    }
  }
}
