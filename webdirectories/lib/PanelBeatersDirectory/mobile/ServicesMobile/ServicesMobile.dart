import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/MobileTopNavBar/MobileTopNavBarhome.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/AboutServicesMobile/AboutServicesMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/AccreditationServiceMobile/AccreditationServiceMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/DocumentsServicesMobile/DocumentsServicesMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/FinanceMobile/FinanceMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/ReviewsMobile/ReviewsMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/ServiceContactMobile/ServiceContactMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/ServiceProfile/ServiceProfileMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/ServicesMapsMobile/ServicesMapsMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/ServicesNavButton/ServicesNavButtonMobile.dart';
import 'package:webdirectories/myutility.dart';

class ServicesMobile extends StatefulWidget {
  const ServicesMobile({super.key});

  @override
  State<ServicesMobile> createState() => _ServicesMobileState();
}

class _ServicesMobileState extends State<ServicesMobile> {
  var pageIndex = 0;

  ///change page
  updatePageIndex(value) {
    setState(() {
      pageIndex = value;
    });
  }

  var servicesPages = [
    ServiceProfileMobile(),
    ServiceContactMobile(),
    ServicesMapsMobile(),
    AccreditationServiceMobile(),
    AboutServicesMobile(),
    DocumentsServicesMobile(),
    ReviewsMobile(),
    FinanceMobile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
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
                Center(
                    child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                      width: MyUtility(context).width * 0.95,
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.56, -0.83),
                          end: Alignment(-0.56, 0.83),
                          colors: [
                            Colors.white.withOpacity(0.10000000149011612),
                            Colors.white.withOpacity(0.4000000059604645)
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0xBF000000),
                            blurRadius: 24,
                            offset: Offset(0, 4),
                            spreadRadius: -1,
                          )
                        ],
                      ),
                      child: SingleChildScrollView(
                        child: Column(children: [
                          SizedBox(
                            height: 20,
                          ),
                          ServicesNavButtonMobile(
                              updatePageIndex: updatePageIndex),
                          servicesPages[pageIndex]
                        ]),
                      )),
                )),
              ],
            ),
          )),
    );
  }
}
