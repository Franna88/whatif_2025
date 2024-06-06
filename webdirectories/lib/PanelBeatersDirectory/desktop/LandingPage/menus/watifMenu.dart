import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/button.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/menuIndexWidget.dart';

class WatifMenu extends StatelessWidget {
  const WatifMenu({super.key});

  @override
  Widget build(BuildContext context) {
    int menuIndex = 1;

    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        MenuIndexWidget(menuIndex: menuIndex),
        const Text(
          'Download your WATIF App',
          style: TextStyle(
              fontSize: 34,
              fontFamily: 'ralewaybold',
              color: Color.fromARGB(255, 255, 255, 255)),
        ),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          width: 400,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Hit the road with confidence and ditch the stress! ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: 'WATIF',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text:
                      ' is your free, all-in-one automotive app that empowers you with everything you need.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Button(
          backgroundColor: Colors.white,
          circleColor: Colors.black,
          iconColor: Colors.white,
          text1: 'Learn More',
          textColor: Colors.black,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
