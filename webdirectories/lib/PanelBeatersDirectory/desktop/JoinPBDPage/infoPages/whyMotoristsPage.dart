import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/ui/orangeButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/ui/smallGlassContainer.dart';

class WhyMotoristsPage extends StatelessWidget {
  Function(String) nextContainer;
  WhyMotoristsPage({super.key, required this.nextContainer});

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return SmallGlassContainer(
      nextContainer: nextContainer,
      child: Padding(
        padding: const EdgeInsets.only(left: 0, top: 0, right: 0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Why motorists use \nthe ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: widthDevice / 40,
                            fontFamily: 'ralewaybold',
                            fontWeight: FontWeight.w700,
                            height: 1,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(1, 1),
                                blurRadius: 1,
                                color: const Color.fromARGB(255, 53, 53, 53),
                              ),
                            ],
                          ),
                        ),
                        TextSpan(
                          text: 'PBD',
                          style: TextStyle(
                            color: Color(0xFFEF9040),
                            fontSize: widthDevice / 38,
                            fontFamily: 'ralewaybold',
                            fontWeight: FontWeight.w700,
                            height: 1,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(1, 1),
                                blurRadius: 1,
                                color: const Color.fromARGB(255, 53, 53, 53),
                              ),
                            ],
                          ),
                        ),
                        TextSpan(
                          text: '?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: widthDevice / 25,
                            fontFamily: 'ralewaybold',
                            fontWeight: FontWeight.w700,
                            height: 1,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(1, 1),
                                blurRadius: 1,
                                color: const Color.fromARGB(255, 53, 53, 53),
                              ),
                            ],
                          ),
                        ),
                        TextSpan(
                          text:
                              '\n\nWe are a proudly South African information service that \nempowers the motoring public and industry professionals to find \ntrusted and skilled auto body repairers instantly.  ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: widthDevice / 85,
                            fontFamily: 'raleway',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text:
                              '\n\nOur transparent, user friendly platform helps customers find and \ncompare relevant options, read real reviews, see industry ratings \nand make informed decisions, saving both time and money.\n',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: widthDevice / 85,
                            fontFamily: 'raleway',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Coming soon, the WATIF App.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: widthDevice / 85,
                          fontFamily: 'raleway',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Your AI Co-Driver ',
                          style: TextStyle(
                            color: Color(0xFFEF9040),
                            fontSize: widthDevice / 85,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xFFEF9040),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: widthDevice / 2.5,
                        child: OrangeButton(
                          buttonText: 'Back to Register Page',
                          onPressed: () {
                            //ADD LOGIC HERE
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
