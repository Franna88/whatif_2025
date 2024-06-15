import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/AboutServicesMobile/AboutUsLeftContenMobile/AboutUsLeftContentComp/SocialIconsMobile.dart';

import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/AboutServicesMobile/AboutUsLeftContenMobile/AboutUsLeftContentMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/AboutServicesMobile/AboutUsTextContainer/AboutUsTextContainerMobile.dart';
import 'package:webdirectories/myutility.dart';

class AboutServicesMobile extends StatefulWidget {
  const AboutServicesMobile({super.key});

  @override
  State<AboutServicesMobile> createState() => _AboutServicesMobileState();
}

class _AboutServicesMobileState extends State<AboutServicesMobile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AboutUsLeftContentMobile(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 440.88,
                height: MyUtility(context).height * 0.03,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Other Media:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.4,
                        fontFamily: 'raleway',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: SocialIconsMobile(),
            )
          ],
        ),
        AboutUsTextContainerMobile(),
        SizedBox(
          height: 10.0,
        )
      ],
    );
  }
}
