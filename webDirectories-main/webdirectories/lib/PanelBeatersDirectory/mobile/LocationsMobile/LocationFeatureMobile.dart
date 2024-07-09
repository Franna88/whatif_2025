import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/iconButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/LocationsMobile/LocationFeaturedComponents/BuisnessImageContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/LocationsMobile/LocationFeaturedComponents/LocationMobileContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/LocationsMobile/LocationFeaturedComponents/stackedMobilebutton.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/LocationsMobile/LocationMobileOther.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/MobileTopNavBar/MobileTopNavBarhome.dart';
import 'package:webdirectories/myutility.dart';

class LocationFeatureMobile extends StatefulWidget {
  const LocationFeatureMobile({Key? key}) : super(key: key);

  @override
  State<LocationFeatureMobile> createState() => _LocationFeatureMobileState();
}

class _LocationFeatureMobileState extends State<LocationFeatureMobile> {
  int selectedIndex = 0;

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
                width: MyUtility(context).width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StackedMobileButtons(
                      selectedIndex: selectedIndex,
                      onButtonPressed: (index) {
                        setState(() {
                          selectedIndex = index;
                        });

                        if (index == 1) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LocationMobileOther(),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
              Container(
                width: MyUtility(context).width * 0.9,
                height: MyUtility(context).height * 0.05,
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
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: MyUtility(context).height * 0.025),
                    LocationMobileContainer(
                      businessImage: 'images/southcity.jpeg',
                      businessName: 'South City Motors Auto Body Repair',
                      businessAddress:
                          '6 Lances Street, Cannon Hill, Kariega, Eastern Cape, 6229',
                      OnPressed: () {},
                      views: '16 133',
                      distance: '12km',
                    ),
                    LocationMobileContainer(
                      businessImage: 'images/denys.png',
                      businessName: 'Denys Edwardes',
                      businessAddress:
                          'c/o PW Botha Blv & Ossie Urban Street, Tamsui, George, Western Cape, 6529',
                      OnPressed: () {},
                      views: '16 133',
                      distance: '12km',
                    ),
                    BuisnessImageMobileContainer(
                      topImage: 'images/hurricane.png',
                      bottomImage: 'images/hurricane2.png',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(child: IconButtons()),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
