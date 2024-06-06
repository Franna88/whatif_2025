import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/MobileTopNavBar/MobileTopNavBarhome.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileJobFinder/ui/dreamJobMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileJobFinder/ui/employeePlatform.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileJobFinder/ui/employerPlatform.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileJobFinder/ui/whatIsJobFinder.dart';
import 'package:webdirectories/myutility.dart';

class MobileJobFinder extends StatefulWidget {
  const MobileJobFinder({super.key});

  @override
  State<MobileJobFinder> createState() => _MobileJobFinderState();
}

class _MobileJobFinderState extends State<MobileJobFinder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MyUtility(context).height,
          width: MyUtility(context).width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/mainbackgroundPanel.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(children: [
              MobileTopNavBarhome(),
              Text(
                'Job Finder:',
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'ralewaybold',
                  color: Colors.white,
                ),
              ),
              Text(
                'Connect with top employers for free',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontFamily: 'ralewaymedium',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                  width: MyUtility(context).width * 0.87,
                  height: MyUtility(context).height * 0.8,
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
                      ),
                    ],
                  ),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          DreamJobMobile(),
                          SizedBox(
                            height: 15,
                          ),
                          WhatIsJobFinderMobile(),
                          SizedBox(
                            height: 15,
                          ),
                          EmployeePlatform(),
                          SizedBox(
                            height: 15,
                          ),
                          EmployerPlatform(),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  )),
            ]),
          )),
    );
  }
}
