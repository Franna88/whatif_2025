import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/AccreditationServiceMobile/AccreditationFilterMobile/AccreditationfilterMobile.dart';

class AccreditationServiceMobile extends StatefulWidget {
  const AccreditationServiceMobile({super.key});

  @override
  State<AccreditationServiceMobile> createState() =>
      _AccreditationServiceMobileState();
}

class _AccreditationServiceMobileState
    extends State<AccreditationServiceMobile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        AccreditationfilterMobile(),
      ],
    );
  }
}
