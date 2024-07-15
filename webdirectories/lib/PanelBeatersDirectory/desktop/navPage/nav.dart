import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JobFinder/JobFiner.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/newJoinPbdPage.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/landingPageDisplay.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/loginMainPage/ownersPortal.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesFeatured.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/services.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/articles/RecentArticles.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/navPage/navBar.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/weConnectPage/weConnectMainPage/weConnectMainPage.dart';

import '../JoinPBDPage/packageInfoPages/packagePagesOptions/packagePage.dart'; // Additional pages
import '../JoinPBDPage/pricingOptions/pricingOptionsPage.dart'; // Additional pages

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _currentIndex = 0;

  void goToWeConnectMainPage() {
    setState(() {
      _currentIndex = 3;
    });
  }

  void goToLandingPageDisplay() {
    setState(() {
      _currentIndex = 0;
    });
  }

  void viewServiceDetails() {
    setState(() {
      _currentIndex = 7;
    });
  }

  void navigateToPricingOptions() {
    setState(() {
      _currentIndex = 8;
    });
  }

  void navigateToPackagePage(String packageType) {
    setState(() {
      switch (packageType) {
        case 'Starter':
          _currentIndex = 9; // Adjust indices accordingly
          break;
        case 'Core':
          _currentIndex = 10; // Adjust indices accordingly
          break;
        case 'Premium':
          _currentIndex = 11; // Adjust indices accordingly
          break;
        case 'PremiumPlus':
          _currentIndex = 12; // Adjust indices accordingly
          break;
      }
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
      NewJointPbdPage(navigateToPricingOptions: navigateToPricingOptions),
      OwnersPortal(),
      Services(),
      PricingOptionsPage(
        updateContainerIndex: (int index) {},
        updatePackageType: (String packageType) {
          navigateToPackagePage(packageType);
        },
      ),
      PackagePage(packageType: "Starter"), // New Pages
      PackagePage(packageType: "Core"), // New Pages
      PackagePage(packageType: "Premium"), // New Pages
      PackagePage(packageType: "PremiumPlus"), // New Pages
    ];

    return Scaffold(
      body: Stack(
        children: [
          _pages[_currentIndex],
          Positioned(
            right: 0,
            child: NavBar(
              onIconTapped: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
