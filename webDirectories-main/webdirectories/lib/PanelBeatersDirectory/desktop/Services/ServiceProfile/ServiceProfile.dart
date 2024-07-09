import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

import 'ServiceProfileComp/ImageScrollContainer.dart';
import 'ServiceProfileComp/ProfileIconContact/ProfileIconConactButton/ProfileSocials.dart';
import 'ServiceProfileComp/ProfileTextContainer.dart';

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
