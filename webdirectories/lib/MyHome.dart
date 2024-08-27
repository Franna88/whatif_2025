import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/loginMainPage/ownersPortal.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesFeatured.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/services.dart';
import 'package:webdirectories/PanelBeatersDirectory/panelBeatersHome.dart';

import 'package:webdirectories/WebDirectories/Mobile/MobilePage1/MobilePage1.dart';

import 'package:webdirectories/WebDirectories/Page1/Page1.dart';

import 'package:webdirectories/myutility.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MyUtility(context).width < 600 ? MobilePage1() : Page1(),
        //   child: Services(
        // listingId: '396',
        // )
      ),
    );
  }
}
