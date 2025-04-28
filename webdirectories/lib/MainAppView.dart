import 'package:flutter/material.dart';
import 'package:webdirectories/WebDirectories/Mobile/WebDirectoriesHomeView.dart';
import 'dart:developer' as developer;

class MainAppView extends StatefulWidget {
  const MainAppView({super.key});

  @override
  State<MainAppView> createState() => _MainAppViewState();
}

class _MainAppViewState extends State<MainAppView> {
  @override
  void initState() {
    developer.log('MainAppView: initState called');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    developer.log('MainAppView: build called');
    return const WebDirectoriesHomeView();
  }
}
