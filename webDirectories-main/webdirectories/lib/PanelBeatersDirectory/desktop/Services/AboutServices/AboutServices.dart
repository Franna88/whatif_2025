import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/AboutServices/AboutUsLeftConten/AboutUsLeftContent.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/AboutServices/AboutUsLeftConten/AboutUsLeftContentComp/SocialIcons.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/AboutServices/AboutUsTextContainer/AboutUsTextContainer.dart';
import 'package:webdirectories/myutility.dart';

class AboutServices extends StatefulWidget {
  const AboutServices({super.key});

  @override
  State<AboutServices> createState() => _AboutServicesState();
}

class _AboutServicesState extends State<AboutServices> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MyUtility(context).width * 0.85,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AboutUsLeftContent(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MyUtility(context).width * 0.28,
                      height: MyUtility(context).height * 0.06,
                      child: Align(
                        alignment: Alignment.centerLeft,
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
                  SocialIcons()
                ],
              ),
              AboutUSTextContainer()
            ],
          ),
          SizedBox(
            height: MyUtility(context).height * 0.05,
          )
        ],
      ),
    );
  }
}
