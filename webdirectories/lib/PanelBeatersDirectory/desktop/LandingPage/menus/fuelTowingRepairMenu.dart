import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/mainButtonDirect.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/menuIndexWidget.dart';

class FuelTowingRepairMenu extends StatelessWidget {
  const FuelTowingRepairMenu({super.key});

  @override
  Widget build(BuildContext context) {
    int menuIndex = 5;
    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        MenuIndexWidget(menuIndex: menuIndex),
        const Text(
          'Fuel, Towing & Repair',
          style: TextStyle(
            fontSize: 34,
            fontFamily: 'ralewaybold',
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        const SizedBox(
          width: 430,
          child: Text(
            'Locate and navigate to other service directories.',
            style: TextStyle(
              color: Color.fromARGB(255, 206, 205, 205),
              fontSize: 16,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const MainButtonDirect(buttonTitle: 'Fuel, Food & Pricing'),
        const SizedBox(
          height: 15,
        ),
        const MainButtonDirect(buttonTitle: 'Repair, Parts & Tyres'),
        const SizedBox(
          height: 15,
        ),
        const MainButtonDirect(buttonTitle: 'Towing Services'),
        const SizedBox(
          height: 15,
        ),
        const MainButtonDirect(buttonTitle: 'Emergency on Call'),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
