import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/MobileTopNavBar/MobileTopNavBarhome.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileQuestionPages/pages/freeDirectoryMobilePage.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileQuestionPages/pages/whyJoinPBDmobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileQuestionPages/pages/whyMotoristsMobilePage.dart';

class MobileQuestionLanding extends StatefulWidget {
  const MobileQuestionLanding({super.key});

  @override
  State<MobileQuestionLanding> createState() => _MobileQuestionLandingState();
}

class _MobileQuestionLandingState extends State<MobileQuestionLanding> {
  final PageController _pageController = PageController();

  // Index to keep track of the current page in PageView
  int _currentPageIndex = 0;

  // Function to handle page changes
  void onPageChanged(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  // Function to navigate to the next or previous page
  void nextContainer(String direction) {
    if (direction == '+') {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;

    final List<Widget> infoContainers = [
      FreeDirectoryMobile(nextContainer: nextContainer),
      WhyMotoristsMobilePage(nextContainer: nextContainer),
      WhyJoinPBDmobile(nextContainer: nextContainer),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: heightDevice,
              width: widthDevice,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/pbdimage.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MobileTopNavBarhome(),
                  const SizedBox(height: 25),
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: onPageChanged,
                      children: infoContainers,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
