import 'package:flutter/material.dart';

import 'ServiceProfileComp/ImageScrollContainerMobile.dart';
import 'ServiceProfileComp/ProfileIconContact/ProfileIconConactButton/ProfileSocialsMobile.dart';
import 'ServiceProfileComp/ProfileTextContainerMobile.dart';

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
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: ProfileSocialsMobile()),
              ProfileTextContainerMobile(),
            ],
          ),
        )
      ],
    );
  }
}
