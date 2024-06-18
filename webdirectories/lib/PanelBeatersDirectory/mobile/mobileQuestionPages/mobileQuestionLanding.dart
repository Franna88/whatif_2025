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
  //var
  int containerIndex = 0;
  String packageType = "";

//update containerIndex
  updateContainerIndex(value) {
    setState(() {
      containerIndex = value;
    });
  }

  //update package type var
  updatePackageType(value) {
    setState(() {
      packageType = value;
    });
  }

//update container index
  nextContainer(value) {
    if (containerIndex > -1 && containerIndex < 2) {
      setState(() {
        if (value == '+') {
          containerIndex = containerIndex + 1;
        } else {
          containerIndex = containerIndex - 1;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;

    final List<Widget> infoContainers = [
      FreeDirectoryMobile(nextContainer: nextContainer),
      WhyJoinPBDmobile(nextContainer: nextContainer),
      WhyMotoristsMobilePage(nextContainer: nextContainer)
    ];

    return Scaffold(
      body: Container(
        height: heightDevice,
        width: widthDevice,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/mobileLanding.png' , ), fit: BoxFit.cover, ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MobileTopNavBarhome(),
                const SizedBox(
                  height: 25,
                ),
                infoContainers[containerIndex]
                //   WeAreDoneMobile()
                //AdvancedFeaturesMobile()
                //ClientManagementMobile()
                //BusinessOperationsMobile()
                //OnlinePresenceMobile()
                // ClientCommunicationMobile()
                //LetsFindYourPlanMobile()

                //WhyMotoristsMobilePage()
                //FreeDirectoryMobile()
                //WhyJoinPBDmobile(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
