import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServiceProfile/ServiceProfileComp/ImageScrollContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServiceProfile/ServiceProfileComp/ProfileIconContact/ProfileIconConactButton/ProfileSocials.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServiceProfile/ServiceProfileComp/ProfileTextContainer.dart';
import 'package:webdirectories/myutility.dart';

class ServiceProfile extends StatefulWidget {
  const ServiceProfile({super.key});

  @override
  State<ServiceProfile> createState() => _ServiceProfileState();
}

class _ServiceProfileState extends State<ServiceProfile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: MyUtility(context).width * 0.85,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ImageScrollContainer(),
              Column(
                children: [
                  ProfileSocials(),
                  ProfileTextContainer(),
                  SizedBox(
                    height: MyUtility(context).height * 0.05,
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
