import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/weConnectPage/ui/checkMarkedText.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/weConnectPage/ui/stackedInfo.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/weConnectPage/ui/weConnectText.dart';

class WeConnectMainPage extends StatelessWidget {
  final VoidCallback goToLandingPageDisplay;

  const WeConnectMainPage({super.key, required this.goToLandingPageDisplay});

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: heightDevice,
            width: widthDevice,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/mobileLanding.png'),
                  fit: BoxFit.cover),
            ),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    child: SizedBox(
                      width: widthDevice * 0.82,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50, top: 50),
                          child: Image.asset(
                            'images/logoPanel.png',
                            height: 70,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: widthDevice * 0.82,
                    height: heightDevice * 0.72,
                    decoration: ShapeDecoration(
                      color: Color(0xFF181B1D),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 0.64,
                          strokeAlign: BorderSide.strokeAlignOutside,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(9.57),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: widthDevice / 2.8,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Need a Panel Beater?',
                                    style: TextStyle(
                                      color: Color(0xFFF19A41),
                                      fontSize: 22,
                                      fontFamily: 'ralewaybold',
                                      height: 1,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 15, top: 10),
                                    child: Text(
                                      '#WeConnect',
                                      style: TextStyle(
                                        color: Color(0xFFFAFAFA),
                                        fontSize: 45,
                                        fontFamily: 'ralewaybold',
                                        height: 1,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: widthDevice * 0.3,
                                    child: Text(
                                      WeConnectText().description1,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'raleway',
                                        height: 1.2,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: widthDevice * 0.3,
                                    child: Text(
                                      WeConnectText().description2,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'raleway',
                                        height: 1.2,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CheckMarkedText(
                                    text: 'Find specific services fast',
                                  ),
                                  CheckMarkedText(
                                    text: 'Support verified businesses',
                                  ),
                                  CheckMarkedText(
                                    text:
                                        'Make informed decisions\nbased on accurate\ninformation',
                                  ),
                                ]),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: Container(
                                      height: heightDevice * 0.63,
                                      width: widthDevice * 0.35,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'images/WeConnect.png'),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 350,
                                    top: 0,
                                    child: StackedInfo(),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 150,
            child: Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: goToLandingPageDisplay,
                  child: Icon(
                    Icons.keyboard_arrow_right_rounded,
                    size: heightDevice * 0.12,
                    color: Color(0xFFFF8828),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
