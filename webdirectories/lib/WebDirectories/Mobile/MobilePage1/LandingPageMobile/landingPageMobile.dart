import 'package:flutter/material.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage1/DirectoryContainer/DirectoryContainer.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage1/LandingPageMobile/categorySelectMobile.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobileTopNavBar/MobileTopNavBar.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobileTopNavBar/MobileTopNavBarhome.dart';
import 'package:webdirectories/myutility.dart';
// Uncomment the import below if CircleTextBoxMobile is needed
// import 'package:webdirectories/Mobile/MobilePage1/LandingPageMobile/circleTextBoxMobile.dart';

List directoriesInfo = [
  {
    "1title": "Download\n",
    "2title": "WATIF",
    "description":
        "Register and Download the FREE powerful App for all up-to-date info on Fuel-, Tow-, Repair-, and Services. At your fingertips, Saving Time and Money as you travel, nationwide.",
    "buttonText": "Learn More",
    "url": ""
  },
  {
    "1title": "TOWING\n",
    "2title": "Directory",
    "description":
        "Professional help and roadside assistance in an emergency. Or find any specialist service nationwide. Read Reviews",
    "buttonText": "View Directory",
    "url": "https://www.towingdirectory.co.za/"
  },
  {
    "1title": "FUEL\n",
    "2title": "Directory",
    "description":
        "Locate and Navigate to the Nearest-, Cheapest-, or Specific Fuel Brand. Get fuel prices, rewards, coffee, food, toilets, shops, ATM’s and all other services nationwide.",
    "buttonText": "View Directory",
    "url": "https://www.fueldirectory.co.za/"
  },
  {
    "1title": "PANEL BEATER\n",
    "2title": "Directory",
    "description":
        "Find professional help nearby, or nationwide, for any type of repair, your vehicle brand, acceptable to your Insurance. Read Reviews.",
    "buttonText": "View Directory",
    "url": "https://panelbeatersdirectory.co.za/"
  },
  {
    "1title": "AUTO REPAIR\n",
    "2title": "Directory",
    "description":
        "Locate qualified services nearby or nationwide, for service, spares, or specialist repairs. Read Reviews.",
    "buttonText": "View Directory",
    "url": "https://autorepairdirectory.co.za/"
  },
];
double dialIndex = -0.31;

class LandingPageMobile extends StatefulWidget {
  const LandingPageMobile({super.key});

  @override
  State<LandingPageMobile> createState() => _LandingPageMobileState();
}

class _LandingPageMobileState extends State<LandingPageMobile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int menuIndex = 0;

  final PageController _pageController = PageController();
  // Update menu index
  changeMenu(int value) {
    print(value);
    if (value > -1 && value < 5) {
      setState(() {
        menuIndex = value;
      });
    }

    if (value == 0) {
      setState(() {
        dialIndex = -0.31;
      });
    }

    switch (value) {
      case 0:
        _controller.animateTo(-0.31);
        break;
      case 1:
        _controller.animateTo(-0.15);
        break;

      case 2:
        setState(() {
          dialIndex = 0.0;
          _controller.animateTo(0.0);
        });
        break;

      case 3:
        setState(() {
          dialIndex = 0.17;
          _controller.animateTo(0.17);
        });
        break;

      case 4:
        setState(() {
          dialIndex = 0.325;
          _controller.animateTo(0.325);
        });
        break;
    }
    /* */
  }

  @override
  void initState() {
    _controller = AnimationController(
      lowerBound: -0.6,
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _controller.animateTo(-0.35);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/webDirMobileLanding.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          MobileTopNavBarhome(),
          CategorySelectMobile(
            menuIndex: menuIndex < 0 ? 5 : menuIndex,
            changeMenu: changeMenu,
            dialIndex: dialIndex,
            animateController: _controller,
          ),
          SizedBox(height: 15),
          DirectoryContainer(
            Title1: directoriesInfo[menuIndex]['1title'],
            Title2: directoriesInfo[menuIndex]['2title'],
            description: directoriesInfo[menuIndex]['description'],
            viewdirctoriesbutton: directoriesInfo[menuIndex]['buttonText'],
            menuIndex: menuIndex,
            changeMenu: changeMenu,
            url: directoriesInfo[menuIndex]['url'],
            onpress: () {},
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
