import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/ServiceProfile/ServiceProfileComp/ImageScrollContainerMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/ServiceProfile/ServiceProfileComp/ProfileIconContact/ProfileIconConactButton/ProfileSocialsMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/ServiceProfile/ServiceProfileComp/ProfileTextContainerMobile.dart';

class ServiceProfileMobile extends StatefulWidget {
  const ServiceProfileMobile({super.key});

  @override
  State<ServiceProfileMobile> createState() => _ServiceProfileMobileState();
}

class _ServiceProfileMobileState extends State<ServiceProfileMobile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        ImageScrollContainerMobile(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: ProfileSocialsMobile()),
            ProfileTextContainerMobile(),
          ],
        )
      ],
    );
  }
}
