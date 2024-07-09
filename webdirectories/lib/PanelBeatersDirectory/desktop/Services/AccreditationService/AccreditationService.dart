import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/AccreditationService/AccreditationFilter/Accreditationfilter.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/AccreditationService/AccreditationImageContainer/AccreditationImageContainer.dart';
import 'package:webdirectories/myutility.dart';

class AccreditationServices extends StatefulWidget {
  const AccreditationServices({super.key});

  @override
  State<AccreditationServices> createState() => _AccreditationServicesState();
}

class _AccreditationServicesState extends State<AccreditationServices> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [AccreditationFilter(), AccreditationImageContainer()],
        ),
        SizedBox(
          height: MyUtility(context).height * 0.05,
        )
      ],
    );
  }
}
