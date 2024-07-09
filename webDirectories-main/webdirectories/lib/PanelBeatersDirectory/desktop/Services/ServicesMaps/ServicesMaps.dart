import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesMaps/BusinessHours/BusinessHours.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesMaps/MapsContainercomp/MapButtons.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesMaps/MapsContainercomp/MapsContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/commonButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';

class ServicesMaps extends StatefulWidget {
  const ServicesMaps({super.key});

  @override
  State<ServicesMaps> createState() => _ServicesMapsState();
}

class _ServicesMapsState extends State<ServicesMaps> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [MapsContainer(), BusinessHours()],
        ),
        SizedBox(
          width: MyUtility(context).width * 0.85,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(alignment: Alignment.topLeft, child: MapButtons()),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child:
                    CommonButton(buttonText: 'Navigate Me Now', onPress: () {}),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
