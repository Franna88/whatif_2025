import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/iconButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/LocationsMobile/LocationFeatureMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/LocationsMobile/LocationFeaturedComponents/stackedMobilebutton.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/LocationsMobile/LocationOtherMobileFeature/ImageMobileContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/LocationsMobile/LocationOtherMobileFeature/LocationOtherContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/MobileTopNavBar/MobileTopNavBarhome.dart';
import 'package:webdirectories/myutility.dart';

class LocationMobileOther extends StatefulWidget {
  const LocationMobileOther({Key? key}) : super(key: key);

  @override
  State<LocationMobileOther> createState() => _LocationMobileOtherState();
}

class _LocationMobileOtherState extends State<LocationMobileOther> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MyUtility(context).height,
        width: MyUtility(context).width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/mainBackgroundpan.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MobileTopNavBarhome(),
              SizedBox(height: MyUtility(context).height * 0.025),
              SizedBox(
                width: MyUtility(context).width / 1.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StackedMobileButtons(
                      selectedIndex: selectedIndex,
                      onButtonPressed: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                        // Navigate if needed
                        if (index == 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LocationFeatureMobile(),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
              Container(
                width: MyUtility(context).width / 1.1,
                height: 34.68,
                padding: const EdgeInsets.only(
                  top: 10.80,
                  left: 10.80,
                  right: 21.59,
                  bottom: 10.80,
                ),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: TextField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    hintText: 'Search Featured',
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 14.6812,
                      fontFamily: 'raleway',
                      fontWeight: FontWeight.w400,
                      height: 1.0,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.only(
                      top: 10.80,
                      left: 10.80,
                      right: 21.59,
                      bottom: 10.80,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.83),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.6812,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: MyUtility(context).height * 0.025),
                  LocationMobileOtherContainer(
                    businessImage: 'images/pending.png',
                    businessName: 'Ramcom Trucks & Load Bodies',
                    businessAddress: 'Pacaltsville, George, Western Cape, 6530',
                    OnPressed: () {},
                    views: '16 133',
                  ),
                  LocationMobileOtherContainer(
                    businessImage: 'images/pending.png',
                    businessName: 'Ramcom Trucks & Load Bodies',
                    businessAddress: 'Pacaltsville, George, Western Cape, 6530',
                    OnPressed: () {},
                    views: '16 133',
                  ),
                  ImageMobileContainer(image: 'images/hippo.png'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButtons(),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
