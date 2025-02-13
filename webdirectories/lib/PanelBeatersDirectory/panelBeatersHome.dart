import 'package:flutter/material.dart';

import 'package:webdirectories/PanelBeatersDirectory/desktop/navPage/nav.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileView.dart';
import 'package:webdirectories/myutility.dart';

import 'desktop/AdminPortal/SideNavBar/SideNavBar.dart';
import 'seo/SeoComposer.dart';

class PanelBeatersHome extends StatefulWidget {
  const PanelBeatersHome({super.key});

  @override
  State<PanelBeatersHome> createState() => _PanelBeatersHomeState();
}

class _PanelBeatersHomeState extends State<PanelBeatersHome> {
  @override
  Widget build(BuildContext context) {
    print('DEBUG: Building PanelBeatersHome');
    final mainContent = MyUtility(context).width < 600 ? MobileView() : Nav();

    return SeoComposer.compose(
      child: mainContent,
      title: 'Find Professional Panel Beaters Near You',
      description:
          'Search for qualified panel beaters in your area. Read reviews, check insurance approvals, and get instant quotes for vehicle repairs across South Africa.',
      path: '/panelbeaters-directory',
    );
  }
}
