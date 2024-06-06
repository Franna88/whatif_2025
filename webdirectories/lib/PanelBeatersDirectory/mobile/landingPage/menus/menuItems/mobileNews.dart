import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/ui/directOrangeButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/ui/mobileMenuIndex.dart';

class MobileNews extends StatelessWidget {
  const MobileNews({super.key});

  @override
  Widget build(BuildContext context) {
    int menuIndex = 4;
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
        const Text(
          'News',
          textAlign: TextAlign.center,
          style: TextStyle(
              height: 1,
              fontSize: 31,
              fontFamily: 'ralewaybold',
              color: Color.fromARGB(255, 255, 255, 255)),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'Discover the latest updates in the Auto Body Repair industry. Stay informed with our informative articles.',
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
        const DirectOrangeButton(buttonTitle: 'Articles'),
        const SizedBox(
          height: 15,
        ),
        const DirectOrangeButton(buttonTitle: 'CSI Lightstone EchoMBR'),
        const SizedBox(
          height: 15,
        ),
        const DirectOrangeButton(buttonTitle: 'Industry News'),
        const SizedBox(
          height: 15,
        ),
        const DirectOrangeButton(buttonTitle: 'Repair Finance'),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
