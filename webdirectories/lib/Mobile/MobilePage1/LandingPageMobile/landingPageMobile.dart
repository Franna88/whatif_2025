import 'package:flutter/material.dart';
import 'package:webdirectories/Mobile/MobilePage1/LandingPageMobile/categorySelectMobile.dart';
import 'package:webdirectories/Mobile/MobilePage1/LandingPageMobile/circleTextBoxMobile.dart';

List directoriesInfo = [
  {
    "1title": "Download ",
    "2title": "WATIF",
    "description":
        "Register and Download the FREE powerful App for all up-to-date info on Fuel-, Tow-, Repair-, and Services. At your fingertips, Saving Time and Money as you travel, nationwide."
  },
  {
    "1title": "TOWING",
    "2title": "Directory",
    "description":
        "Professional help and roadside assistance in an emergency. Or find any specialist service nationwide.  Read Reviews"
  },
  {
    "1title": "Fuel",
    "2title": "Directory",
    "description":
        "Locate and Navigate to the Nearest-, Cheapest-, or Specific Fuel Brand. Get fuel prices, rewards, coffee, food, toilets, shops, ATM’s and all other services nationwide. Read Reviews."
  },
  {
    "1title": "PANEL BEATER",
    "2title": "Directory",
    "description":
        "Find professional help nearby, or nationwide, for any type of repair, your vehicle brand, acceptable to your Insurance. Read Reviews."
  },
  {
    "1title": "AUTO REPAIR",
    "2title": "Directory",
    "description":
        "Locate qualified services nearby or nationwide, for service, spares, or specialist repairs. Read Reviews."
  },
];

class LandingPageMobile extends StatefulWidget {
  const LandingPageMobile({super.key});

  @override
  State<LandingPageMobile> createState() => _LandingPageMobileState();
}

class _LandingPageMobileState extends State<LandingPageMobile> {
  int menuIndex = 0;
//update menu index
  changeMenu(value) {
    setState(() {
      menuIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategorySelectMobile(
          menuIndex: menuIndex,
          changeMenu: changeMenu,
        ),
        SizedBox(
          height: 15,
        ),
        CircleTextboxMobile(
          Title1: directoriesInfo[menuIndex]['1title'],
          Title2: directoriesInfo[menuIndex]['2title'],
          description: directoriesInfo[menuIndex]['description'],
          menuIndex: menuIndex,
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
