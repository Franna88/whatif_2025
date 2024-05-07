import 'package:flutter/material.dart';
import 'package:webdirectories/Mobile/MobilePage1/DirectoryContainer/DirectoryContainer.dart';
import 'package:webdirectories/Mobile/MobilePage1/LandingPageMobile/categorySelectMobile.dart';
import 'package:webdirectories/Mobile/MobileTopNavBar/MobileTopNavBar.dart';
import 'package:webdirectories/Mobile/MobileTopNavBar/MobileTopNavBarhome.dart';
import 'package:webdirectories/myutility.dart';
// Uncomment the import below if CircleTextBoxMobile is needed
// import 'package:webdirectories/Mobile/MobilePage1/LandingPageMobile/circleTextBoxMobile.dart';

List directoriesInfo = [
  {
    "1title": "Download\n",
    "2title": "WATIF",
    "description":
        "Register and Download the FREE powerful App for all up-to-date info on Fuel-, Tow-, Repair-, and Services. At your fingertips, Saving Time and Money as you travel, nationwide."
  },
  {
    "1title": "TOWING\n",
    "2title": "Directory",
    "description":
        "Professional help and roadside assistance in an emergency. Or find any specialist service nationwide. Read Reviews"
  },
  {
    "1title": "FUEL\n",
    "2title": "Directory",
    "description":
        "Locate and Navigate to the Nearest-, Cheapest-, or Specific Fuel Brand. Get fuel prices, rewards, coffee, food, toilets, shops, ATM’s and all other services nationwide."
  },
  {
    "1title": "PANEL BEATER\n",
    "2title": "Directory",
    "description":
        "Find professional help nearby, or nationwide, for any type of repair, your vehicle brand, acceptable to your Insurance. Read Reviews."
  },
  {
    "1title": "AUTO REPAIR\n",
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

  // Update menu index
  void changeMenu(int value) {
    setState(() {
      menuIndex = value;
    });
  }

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/glasses.gif"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          MobileTopNavBarhome(),
          CategorySelectMobile(
            menuIndex: menuIndex,
            changeMenu: changeMenu,
          ),
          SizedBox(height: 15),
          DirectoryContainer(
            Title1: directoriesInfo[menuIndex]['1title'],
            Title2: directoriesInfo[menuIndex]['2title'],
            description: directoriesInfo[menuIndex]['description'],
            menuIndex: menuIndex,
            onpress: () {
              // Add your onPress action here
            },
            pageController: _pageController,
          ),
          // Uncomment the code below if CircleTextBoxMobile is needed
          // CircleTextBoxMobile(
          //   Title1: directoriesInfo[menuIndex]['1title'],
          //   Title2: directoriesInfo[menuIndex]['2title'],
          //   description: directoriesInfo[menuIndex]['description'],
          //   menuIndex: menuIndex,
          // ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
