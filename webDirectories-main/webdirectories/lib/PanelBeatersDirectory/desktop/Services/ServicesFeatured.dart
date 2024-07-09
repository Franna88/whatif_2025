import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Footer/panelFooter.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Locations/LocationFeaturedComponents/BuisnessImageContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesComponent/ServiceStackedButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesComponent/ServicesContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/iconButton.dart';
import 'package:webdirectories/myutility.dart';

class ServicesFeatured extends StatefulWidget {
  Function viewServiceDetails;
  ServicesFeatured({super.key, required this.viewServiceDetails});

  @override
  State<ServicesFeatured> createState() => _ServicesFeaturedState();
}

class _ServicesFeaturedState extends State<ServicesFeatured> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MyUtility(context).height,
              width: MyUtility(context).width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/mainbackgroundPanel.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: MyUtility(context).height * 0.025,
                  ),
                  SizedBox(
                    width: MyUtility(context).width / 1.06,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ServicesStackedButton(),
                        Row(
                          children: [
                            IconButtons(),
                            SizedBox(
                              width: MyUtility(context).width * 0.03,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
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
                            borderRadius: BorderRadius.circular(24.83),
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
                      SizedBox(
                        width: MyUtility(context).width * 0.01,
                      )
                    ],
                  ),
                  SizedBox(
                    height: MyUtility(context).height * 0.85,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: MyUtility(context).height * 0.025,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ServiceFeaturedContainer(
                              businessImage: 'images/williespan.png',
                              businessName: 'Willies Panelbeaters',
                              businessAddress:
                                  '26 Foundry Street, George Industria, Western Cape, 6530',
                              OnPressed: () {
                                widget.viewServiceDetails();
                              },
                              views: '16 133',
                              distance: '12km',
                            ),
                            ServiceFeaturedContainer(
                              businessImage: 'images/southcity.jpeg',
                              businessName: 'South City Motors Auto Body Repair',
                              businessAddress:
                                  '6 Lances Street, Cannon Hill, Kariega, Eastern Cape, 6229',
                              OnPressed: () {
                                widget.viewServiceDetails();
                              },
                              views: '16 133',
                              distance: '12km',
                            ),
                            BuisnessImageContainer(
                              topImage: 'images/hurricane.png',
                              bottomImage: 'images/hurricane2.png',
                            ),
                            ServiceFeaturedContainer(
                              businessImage: 'images/williespannal.png',
                              businessName: 'Star Panelbeaters',
                              businessAddress:
                                  'c/o PW Botha Blv & Ossie Urban Street, Tamsui, George, Western Cape, 6529',
                              OnPressed: () {
                                widget.viewServiceDetails();
                              },
                              views: '16 133',
                              distance: '12km',
                            ),
                            ServiceFeaturedContainer(
                              businessImage: 'images/edencoach.png',
                              businessName: 'Eden Coachworks',
                              businessAddress:
                                  '6 Luven Street, George Industria, George, Western Cape, 6530',
                              OnPressed: () {
                                widget.viewServiceDetails();
                              },
                              views: '16 133',
                              distance: '12km',
                            ),
                            SizedBox(
                              width: MyUtility(context).width * 0.02,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            BuisnessImageContainer(
                              topImage: 'images/Bulldog.png',
                              bottomImage: 'images/Bulldog2.png',
                            ),
                            ServiceFeaturedContainer(
                              businessImage: 'images/autotechpan.png',
                              businessName: 'Autotech Panelbeaters',
                              businessAddress:
                                  'c/o PW Botha Blv & Ossie Urban Street, Tamsui, George, Western Cape, 6529',
                              OnPressed: () {
                                widget.viewServiceDetails();
                              },
                              views: '16 133',
                              distance: '12km',
                            ),
                            ServiceFeaturedContainer(
                              businessImage: 'images/denys.png',
                              businessName: 'Denys Edwardes',
                              businessAddress:
                                  'c/o PW Botha Blv & Ossie Urban Street, Tamsui, George, Western Cape, 6529',
                              OnPressed: () {
                                widget.viewServiceDetails();
                              },
                              views: '16 133',
                              distance: '12km',
                            ),
                            BuisnessImageContainer(
                              topImage: 'images/glasurit.png',
                              bottomImage: 'images/glasurit2.png',
                            ),
                            ServiceFeaturedContainer(
                              businessImage: 'images/denys.png',
                              businessName: 'JF Autobody Services',
                              businessAddress:
                                  'c/o PW Botha Blv & Ossie Urban Street, Tamsui, George, Western Cape, 6529',
                              OnPressed: () {
                                widget.viewServiceDetails();
                              },
                              views: '16 133',
                              distance: '12km',
                            ),
                            SizedBox(
                              width: MyUtility(context).width * 0.02,
                            )
                          ],
                        ),
                      ],
                    ),
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
