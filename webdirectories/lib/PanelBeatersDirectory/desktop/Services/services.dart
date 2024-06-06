import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/AboutServices/AboutServices.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/AccreditationService/AccreditationService.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/DocumentsServices/DocumentsServices.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Finance/Finance.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/Reviews.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServiceContact/ServiceContact.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServiceProfile/ServiceProfile.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesMaps/ServicesMaps.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesNavButton/ServicesNavButton.dart';
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
      child: Container(
          height: MyUtility(context).height,
          width: MyUtility(context).width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/mainbackgroundPanel.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
              child: Container(
                  width: MyUtility(context).width * 0.88,
                  height: MyUtility(context).height * 0.95,
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
                  child: Column(children: [
                    SizedBox(
                      height: 20,
                    ),
                    ServicesNavButton(updatePageIndex: updatePageIndex),
                    servicesPages[pageIndex]
                  ])))),
    );
  }
}
