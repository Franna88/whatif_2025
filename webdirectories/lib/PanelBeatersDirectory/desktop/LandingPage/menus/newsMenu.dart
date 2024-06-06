import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/mainButtonDirect.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/menuIndexWidget.dart';

class NewsMenu extends StatelessWidget {
  const NewsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    int menuIndex = 4;
    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        MenuIndexWidget(menuIndex: menuIndex),
        const Text(
          'News',
          style: TextStyle(
              fontSize: 34,
              fontFamily: 'ralewaybold',
              color: Color.fromARGB(255, 255, 255, 255)),
        ),
        const SizedBox(
          width: 430,
          child: Text(
            'Discover the latest updates in the Auto Body Repair industry. Stay informed with our informative articles.',
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
        const MainButtonDirect(buttonTitle: 'Articles'),
        const SizedBox(
          height: 15,
        ),
        const MainButtonDirect(buttonTitle: 'CSI Lightstone EchoMBR'),
        const SizedBox(
          height: 15,
        ),
        const MainButtonDirect(buttonTitle: 'Industry News'),
        const SizedBox(
          height: 15,
        ),
        const MainButtonDirect(buttonTitle: 'Repair Finance'),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
