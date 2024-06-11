import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/category/categorySelect.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/approvalsServices.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/findAllPanelBeatersmenu.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/fuelTowingRepairMenu.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/glassContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/newsMenu.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/watifMenu.dart';
import 'package:webdirectories/myutility.dart';

class LandingPageDisplay extends StatefulWidget {
  const LandingPageDisplay({super.key});

  @override
  State<LandingPageDisplay> createState() => _LandingPageDisplayState();
}

class _LandingPageDisplayState extends State<LandingPageDisplay> {
  // var
  int menuIndex = 0;
  //Container options
  List infoContainers = [
    WatifMenu(),
    FindAllPanelBeaters(),
    ApprovalsServices(),
    NewsMenu(),
    FuelTowingRepairMenu()
  ];

//update menu index
  changeMenu(value) {
    setState(() {
      menuIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
     var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Material(
      child: Container(
        height: MyUtility(context).height,
        width: MyUtility(context).width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/LandingHeroIMG.png'), fit: BoxFit.fill),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50, top: 50),
                child: Image.asset(
                  'images/logoPanel.png',
                  width: 225,
                  height: 110,
                ),
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CategorySelect(
                    menuIndex: menuIndex,
                    changeMenu: changeMenu,
                  ),
                  SizedBox(
                    width: 500,
                    //height: 440,
                    child: GlassEffect(
                      child: Center(
                        child: infoContainers[menuIndex],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
