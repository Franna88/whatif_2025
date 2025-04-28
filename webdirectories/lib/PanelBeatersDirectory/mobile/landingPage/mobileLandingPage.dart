import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/weConnectPage/weConnectMainPage/weConnectMainPage.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/FooterMobile/PanFooterMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/MobileTopNavBar/MobileTopNavBarhome.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/category/mobileCategory.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/menus/menuItems/approvalsServices/mobileApprovalsServices.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/menus/menuItems/areaSearch/mobileFindAllPanelBeaters.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/menus/menuItems/mobileFuelTowing.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/menus/menuItems/mobileNews.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/menus/menuItems/mobileWatifMenu.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/ui/mobileGlassContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/weConnectPage/weConnectMainPage/weConnectMainPage.dart';
import 'dart:developer' as developer;

class Mobilelandingpage extends StatefulWidget {
  const Mobilelandingpage({
    super.key,
  });

  @override
  State<Mobilelandingpage> createState() => _MobilelandingpageState();
}

class _MobilelandingpageState extends State<Mobilelandingpage> {
  int menuIndex = 0;
  late List<Widget> menuContainers;

  @override
  void initState() {
    developer.log('Mobilelandingpage: initState called');
    menuContainers = [
      const Mobilewatifmenu(),
      const MobileFindAllPanelBeaters(),
      const MobileApprovalsServices(),
      const MobileNews(),
      const MobileFuelTowing()
    ];
    super.initState();
  }

  PageController _pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    developer.log('Mobilelandingpage: build called');
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    developer
        .log('Device dimensions: height=$heightDevice, width=$widthDevice');

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: heightDevice,
              width: widthDevice,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/mobileLanding.png'),
                    fit: BoxFit.cover),
              ),
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  developer.log('PageView: page changed to index $index');
                },
                children: [
                  // Add the WeConnectMainPage here
                  Builder(builder: (context) {
                    developer.log('Building WeConnectMainPageMobile');
                    return WeConnectMainPageMobile();
                  }),
                  Builder(builder: (context) {
                    developer.log(
                        'Building main landing page content, menuIndex=$menuIndex');
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MobileTopNavBarhome(),
                          MobileCategorySelect(
                            menuIndex: menuIndex,
                            changeMenu: (value) {
                              developer.log(
                                  'Menu changed from $menuIndex to $value');
                              setState(() {
                                menuIndex = value;
                              });
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Builder(builder: (context) {
                              developer.log(
                                  'Building menu container for index $menuIndex');
                              return Mobileglasscontainer(
                                  child: menuContainers[menuIndex]);
                            }),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
            Builder(builder: (context) {
              developer.log('Building PanFooterMobile');
              return PanFooterMobile();
            })
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    developer.log('Mobilelandingpage: dispose called');
    _pageController.dispose();
    super.dispose();
  }
}
