import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/infoPages/freeDirectoryPage.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/infoPages/whyJoinPBDpage.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/infoPages/whyMotoristsPage.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/packageInfoPages/packagePagesOptions/packagePage.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/pricingOptions/pricingOptionsPage.dart';
import 'package:webdirectories/myutility.dart';

class JoinPbd extends StatefulWidget {
  const JoinPbd({super.key});

  @override
  State<JoinPbd> createState() => _JoinPbdState();
}

class _JoinPbdState extends State<JoinPbd> {
  // Variables
  int containerIndex = 0;
  String packageType = "";

  // List of containers
  final List<Widget> infoContainers = [];

  @override
  void initState() {
    super.initState();
    infoContainers.addAll([
      WhyMotoristsPage(nextContainer: nextContainer),
      WhyJoinPage(
          nextContainer: nextContainer,
          updateContainerIndex: updateContainerIndex),
      FreeDirectory(nextContainer: nextContainer),
    ]);
  }

  // Update containerIndex
  updateContainerIndex(value) {
    setState(() {
      containerIndex = value;
    });
  }

  // Update package type var
  updatePackageType(value) {
    setState(() {
      packageType = value;
    });
  }

  // Update container index
  nextContainer(value) {
    setState(() {
      if (value == '+' && containerIndex < infoContainers.length - 1) {
        containerIndex = containerIndex + 1;
      } else if (value == '-' && containerIndex > 0) {
        containerIndex = containerIndex - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    return Material(
      child: Container(
        height: MyUtility(context).height,
        width: MyUtility(context).width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/joinBackground.png'),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2),
              BlendMode.darken,
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50, top: 50),
                child: Image.asset(
                  'images/logoPanel.png',
                  height: 70,
                ),
              ),
              SizedBox(
                height: heightDevice * 0.07,
              ),
              infoContainers[containerIndex],
            ],
          ),
        ),
      ),
    );
  }
}
/*PricingOptionsPage(
        updateContainerIndex: updateContainerIndex,
        updatePackageType: updatePackageType,
      ),
      PackagePage(
        packageType: packageType,
      ),*/