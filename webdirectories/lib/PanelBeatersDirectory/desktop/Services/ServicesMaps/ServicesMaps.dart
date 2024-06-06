import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesMaps/BusinessHours/BusinessHours.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesMaps/MapsContainercomp/MapsContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/commonButton.dart';

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
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CommonButton(buttonText: 'Navigate Me Now', onPress: () {}),
            ],
          ),
        )
      ],
    );
  }
}
