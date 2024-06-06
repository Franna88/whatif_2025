import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JobFinder/JobFiner.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/joinPbdPage.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/landingPageDisplay.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/loginMainPage/ownersPortal.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesFeatured.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/services.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/articles/RecentArticles.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/navPage/navBar.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/weConnectPage/weConnect.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _currentIndex = 0;

//viewService details
  viewServiceDetails() {
    setState(() {
      _currentIndex = 7;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      LandingPageDisplay(),
      ServicesFeatured(viewServiceDetails: viewServiceDetails),
      JobFinder(),
      WeConnect(),
      RecentArticles(),
      JoinPbd(),
      OwnersPortal(),
      Services(),
    ];

    return Stack(
      children: [
        _pages[_currentIndex],
        Positioned(
          right: 1,
          child: NavBar(
            onIconTapped: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
      ],
    );
  }
}
