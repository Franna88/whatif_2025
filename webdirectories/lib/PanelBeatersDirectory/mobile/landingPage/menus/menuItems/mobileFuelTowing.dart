import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/ui/directOrangeButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/ui/mobileMenuIndex.dart';

class MobileFuelTowing extends StatelessWidget {
  const MobileFuelTowing({super.key});

  @override
  Widget build(BuildContext context) {
    int menuIndex = 5;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 15,
        ),
        MobileMenuIndex(menuIndex: menuIndex),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: const Text(
            'Fuel, Towing & Repair',
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 1,
              fontSize: 31,
              fontFamily: 'ralewaybold',
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'Locate and navigate to other service directories.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(255, 206, 205, 205),
              fontSize: 14,
              fontFamily: 'raleway',
              height: 1,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const DirectOrangeButton(buttonTitle: 'Fuel, Food & Pricing'),
        const SizedBox(
          height: 15,
        ),
        const DirectOrangeButton(buttonTitle: 'Repair, Parts & Tyres'),
        const SizedBox(
          height: 15,
        ),
        const DirectOrangeButton(buttonTitle: 'Towing Services'),
        const SizedBox(
          height: 15,
        ),
        const DirectOrangeButton(buttonTitle: 'Emergency on Call'),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
