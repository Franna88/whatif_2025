import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Footer/panelFooter.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/AboutServices/AboutServices.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/AccreditationService/AccreditationService.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/DocumentsServices/DocumentsServices.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Finance/Finance.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/Reviews.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServiceContact/ServiceContact.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServiceProfile/ServiceProfile.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesMaps/ServicesMaps.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesNavButton/ServicesNavButton.dart';
import 'package:webdirectories/WebDirectories/Footer/Footer.dart';
import 'package:webdirectories/myutility.dart';

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  var pageIndex = 0;

  ///change page
  updatePageIndex(value) {
    setState(() {
      pageIndex = value;
    });
  }

  var servicesPages = [
    ServiceProfile(),
    ServiceContact(),
    ServicesMaps(),
    AccreditationServices(),
    AboutServices(),
    DocumentsServices(),
    Reviews(),
    Finance(),
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (pageIndex == 0)
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: SizedBox(
                            width: MyUtility(context).width * 0.88,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'images/logoPanel.png',
                                  height: 70,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(1),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 0.5,
                                              ),
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons.keyboard_arrow_left,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            'Go Back',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17.68,
                                              fontFamily: 'raleway',
                                              fontWeight: FontWeight.w400,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      Center(
                        child: Container(
                          width: MyUtility(context).width * 0.88,
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(-0.57, -0.83),
                              end: Alignment(0.56, 0.83),
                              colors: [
                                Colors.white.withOpacity(0.1),
                                Colors.white.withOpacity(0.25),
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
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              ServicesNavButton(updatePageIndex: updatePageIndex),
                              servicesPages[pageIndex],
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
            PanelFooter(),
          ],
        ),
      ),
    );
  }
}
