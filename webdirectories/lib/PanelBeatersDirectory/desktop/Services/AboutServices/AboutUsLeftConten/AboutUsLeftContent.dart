import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/AboutServices/AboutUsLeftConten/AboutUsLeftContentComp/AboutUSContainerInfo.dart';

class AboutUsLeftContent extends StatefulWidget {
  const AboutUsLeftContent({super.key});

  @override
  State<AboutUsLeftContent> createState() => _AboutUsLeftContentState();
}

class _AboutUsLeftContentState extends State<AboutUsLeftContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AboutUsContainerInfo(
          section1Texts: [
            'B-BBEE Levels',
            'VDQ Registration',
            'FixEezy Finance Option',
            'Lightstone Registration',
            'CRA Membership',
            'Fender Bender Finance',
            'Business Registration Number',
            'SAMBRA Membership'
          ],
          section2Texts: [
            'Level 49',
            '067ABC',
            'FX0000Test',
            '3167',
            '20268',
            '20268',
            '2013/123123/07',
            '12341234'
          ],
        ),
      ],
    );
  }
}
