import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Footer/panelFooter.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/category/categorySelect.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/approvalsServices.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/findAllPanelBeatersmenu.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/fuelTowingRepairMenu.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/newsMenu.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/watifMenu.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/glassContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/weConnectPage/weConnect.dart';
import 'package:webdirectories/myutility.dart';

class LandingPageDisplay extends StatefulWidget {
  final VoidCallback goToWeConnectMainPage;

  const LandingPageDisplay({super.key, required this.goToWeConnectMainPage});

  @override
  State<LandingPageDisplay> createState() => _LandingPageDisplayState();
}

class _LandingPageDisplayState extends State<LandingPageDisplay> {
  int menuIndex = 0;

  List infoContainers = [
    WatifMenu(),
    FindAllPanelBeaters(),
    ApprovalsServices(),
    NewsMenu(),
    FuelTowingRepairMenu()
  ];

  changeMenu(value) {
    setState(() {
      menuIndex = value;
    });
  }

  @override
  bool _isHovered = false;

  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MyUtility(context).height,
              width: MyUtility(context).width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/LandingHeroIMG.png'), fit: BoxFit.fill),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50, top: 50),
                    child: Image.asset(
                      'images/logoPanel.png',
                      height: 70,
                    ),
                  ),
                  SizedBox(
                    height: heightDevice * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: MouseRegion(
                            onEnter: (_) => setState(() {
                              _isHovered = true;
                            }),
                            onExit: (_) => setState(() {
                              _isHovered = false;
                            }),
                            child: GestureDetector(
                              onTap: widget.goToWeConnectMainPage,
                              child: Icon(
                                Icons.keyboard_arrow_left_rounded,
                                size: heightDevice * 0.12,
                                color:
                                    _isHovered ? Colors.white : Color(0xFFFF8828),
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (widthDevice > 1477)
                        SizedBox(
                          width: widthDevice * 0.06,
                        ),
                      CategorySelect(
                        menuIndex: menuIndex,
                        changeMenu: changeMenu,
                      ),
                      SizedBox(
                        width: widthDevice * 0.05,
                      ),
                      GlassEffect(
                        child: Center(
                          child: infoContainers[menuIndex],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            PanelFooter()
          ],
        ),
      ),
    );
  }
}
