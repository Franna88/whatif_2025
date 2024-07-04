import 'dart:html';

import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/articles/RecentArticlesPage/RecentArticlesPage.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileRecentArticles/RecentArticlesPageMobile/RecentArticlesPageMobile.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage1/MobilePage1.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage2/MobilePage2.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage3/MobilePage3.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage4/MobilePage4.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage5/MobilePage5.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage6/MobilePage6.dart';
import 'package:webdirectories/WebDirectories/Page1/AboutUS/AboutUs.dart';
import 'package:webdirectories/WebDirectories/Page1/AiCoDriver/AiCoDriver.dart';
import 'package:webdirectories/WebDirectories/Page1/Comments/Comments.dart';
import 'package:webdirectories/WebDirectories/ErrorPage/ErrorPage.dart';
import 'package:webdirectories/WebDirectories/Page1/Page1.dart';
import 'package:webdirectories/WebDirectories/Page2/Page2.dart';

import 'package:webdirectories/WebDirectories/Page5/Page5.dart';
import 'package:webdirectories/WebDirectories/Page7/GetinTouch/GetinTouch.dart';
import 'package:webdirectories/WebDirectories/Page6/EchoMBR/EchoMBR.dart';
import 'package:webdirectories/WebDirectories/Page4/DownloadWatif/DownloadWatif.dart';
import 'package:webdirectories/WebDirectories/Footer/Footer.dart';
import 'package:webdirectories/WebDirectories/Page1/JoinUs/JoinUs.dart';
import 'package:webdirectories/WebDirectories/Page1/LandingPage/LandingPage.dart';
import 'package:webdirectories/WebDirectories/Page1/LandingPage/LandingPageComponents/LandingPageDisplay.dart';
import 'package:webdirectories/WebDirectories/Page3/Our%20Eagle%20Proclamation/OurEagleProclamation.dart';
import 'package:webdirectories/WebDirectories/Page3/OurMission/OurMission.dart';
import 'package:webdirectories/WebDirectories/Page3/OurStory/OurStory.dart';
import 'package:webdirectories/WebDirectories/Page3/OurStory/OurStoryExtention.dart';
import 'package:webdirectories/WebDirectories/Page3/Page3.dart';
import 'package:webdirectories/WebDirectories/Page4/Page4.dart';
import 'package:webdirectories/WebDirectories/Page6/Page6.dart';
import 'package:webdirectories/WebDirectories/Page7/Maps/Maps.dart';
import 'package:webdirectories/WebDirectories/Page7/Page7.dart';
import 'package:webdirectories/WebDirectories/Page1/PartnerWithUs/PartnerWithUs.dart';
import 'package:webdirectories/WebDirectories/Page4/Watif/Watif.dart';
import 'package:webdirectories/WebDirectories/Page3/WebDirectoriesWay/WebDirectoriesWay.dart';
import 'package:webdirectories/WebDirectories/Page5/RecentArticles/RecentAtricles.dart';
import 'package:webdirectories/WebDirectories/Page6/UltimateBuisnessTool/UltimateBuisnessTool.dart';
import 'package:webdirectories/WebDirectories/TopNavBar/TopNavBar.dart';
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
      ),
    );
  }
}
