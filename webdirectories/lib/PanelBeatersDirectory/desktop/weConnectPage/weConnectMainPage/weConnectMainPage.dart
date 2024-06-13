import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/weConnectPage/ui/checkMarkedText.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/weConnectPage/ui/stackedInfo.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/weConnectPage/ui/weConnectText.dart';

class WeConnectMainPage extends StatelessWidget {
  const WeConnectMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: heightDevice,
        width: widthDevice,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/mobileLanding.png'), fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 60,
                      width: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/logoPanel.png'),
                            fit: BoxFit.fill),
                      ),
                    ),
                    Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 25,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: widthDevice * 0.90,
                height: heightDevice * 0.80,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: widthDevice / 2.2,
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
                              Text(
                                '#WeConnect',
                                style: TextStyle(
                                  color: Color(0xFFFAFAFA),
                                  fontSize: 45,
                                  fontFamily: 'ralewaybold',
                                  height: 1,
                                ),
                              ),
                              Text(
                                WeConnectText().description1,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'raleway',
                                  height: 1.2,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                WeConnectText().description2,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'raleway',
                                  height: 1.2,
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
                                    'Make informed decisions based on accurate information',
                              ),
                            ]),
                      ),
                      Column(
                        children: [
                          StackedInfo(),
                          Container(
                            height: heightDevice / 2.2,
                            width: widthDevice / 2.4,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('images/WeConnect.png'),
                                  fit: BoxFit.contain),
                            ),
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
    );
  }
}
