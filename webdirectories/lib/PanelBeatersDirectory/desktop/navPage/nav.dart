import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JobFinder/JobFiner.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/joinPbdPage.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/landingPageDisplay.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/loginMainPage/ownersPortal.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesFeatured.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/services.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/articles/RecentArticles.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/navPage/navBar.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/weConnectPage/weConnectMainPage/weConnectMainPage.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _currentIndex = 0;

  void goToWeConnectMainPage() {
    setState(() {
      _currentIndex = 3; // Assuming 3 is the index of WeConnectMainPage
    });
  }

  void goToLandingPageDisplay() {
    setState(() {
      _currentIndex = 0; // Assuming 0 is the index of LandingPageDisplay
    });
  }

  void viewServiceDetails() {
    setState(() {
      _currentIndex = 7;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      LandingPageDisplay(goToWeConnectMainPage: goToWeConnectMainPage),
      ServicesFeatured(viewServiceDetails: viewServiceDetails),
      JobFinder(),
      WeConnectMainPage(goToLandingPageDisplay: goToLandingPageDisplay),
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
