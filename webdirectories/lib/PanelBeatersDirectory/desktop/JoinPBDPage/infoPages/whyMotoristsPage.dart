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
              padding: const EdgeInsets.only(left: 25, top: 25 ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //SizedBox(height: heightDevice * 0.04,),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Why motorists \nuse the ',
                          style: widthDevice < 1500
                              ? const TextStyle(
                                  color: Colors.white,
                                  fontSize: 60,
                                  fontFamily: 'ralewaybold',
                                  fontWeight: FontWeight.w700,
                                  height: 1,
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(1, 1),
                                      blurRadius: 1,
                                      color: Color.fromARGB(255, 53, 53, 53),
                                    ),
                                  ],
                                )
                              : const TextStyle(
                                  color: Colors.white,
                                  fontSize: 85,
                                  fontFamily: 'ralewaybold',
                                  fontWeight: FontWeight.w700,
                                  height: 1,
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(1, 1),
                                      blurRadius: 1,
                                      color: Color.fromARGB(255, 53, 53, 53),
                                    ),
                                  ],
                                ),
                        ),
                        TextSpan(
                          text: 'PBD',
                          style: widthDevice < 1500
                              ? const TextStyle(
                                  color: Color(0xFFEF9040),
                                  fontSize: 60,
                                  fontFamily: 'ralewaybold',
                                  fontWeight: FontWeight.w700,
                                  height: 1,
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(1, 1),
                                      blurRadius: 1,
                                      color: Color.fromARGB(255, 53, 53, 53),
                                    ),
                                  ],
                                )
                              : const TextStyle(
                                  color: Color(0xFFEF9040),
                                  fontSize: 85,
                                  fontFamily: 'ralewaybold',
                                  fontWeight: FontWeight.w700,
                                  height: 1,
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(1, 1),
                                      blurRadius: 1,
                                      color: Color.fromARGB(255, 53, 53, 53),
                                    ),
                                  ],
                                ),
                        ),
                        TextSpan(
                          text: '?',
                          style: widthDevice < 1500
                              ? const TextStyle(
                                  color: Colors.white,
                                  fontSize: 60,
                                  fontFamily: 'ralewaybold',
                                  fontWeight: FontWeight.w700,
                                  height: 1,
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(1, 1),
                                      blurRadius: 1,
                                      color: Color.fromARGB(255, 53, 53, 53),
                                    ),
                                  ],
                                )
                              : const TextStyle(
                                  color: Colors.white,
                                  fontSize: 85,
                                  fontFamily: 'ralewaybold',
                                  fontWeight: FontWeight.w700,
                                  height: 1,
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(1, 1),
                                      blurRadius: 1,
                                      color: Color.fromARGB(255, 53, 53, 53),
                                    ),
                                  ],
                                ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: widthDevice * 0.40,
                    child: Text(
                        '\nWe are a proudly South African information service that empowers the motoring public and industry professionals to find trusted and skilled auto body repairers instantly.  ',
                        style: widthDevice < 1500
                            ? TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'raleway',
                                fontWeight: FontWeight.w400,
                                height: 1.2
                              )
                            : TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontFamily: 'raleway',
                                fontWeight: FontWeight.w400,
                                height: 1.2
                              )),
                  ),
                  SizedBox(width: widthDevice * 0.40,
                    child: Text(
                        '\nOur transparent, user friendly platform helps customers find and compare relevant options, read real reviews, see industry ratings and make informed decisions, saving both time and money.\n',
                        style: widthDevice < 1500
                            ? TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'raleway',
                                fontWeight: FontWeight.w400,
                                height: 1.2
                              )
                            : TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontFamily: 'raleway',
                                fontWeight: FontWeight.w400,
                                height: 1.2
                              )),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Coming soon, the WATIF App.',
                            style: widthDevice < 1500
                                ? TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: 'raleway',
                                    fontWeight: FontWeight.w400,
                                    height: 1.2
                                  )
                                : TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontFamily: 'raleway',
                                    fontWeight: FontWeight.w400,
                                    height: 1.2
                                  )),
                        TextButton(
                          onPressed: () {},
                          child: Text('Your AI Co-Driver ',
                              style: widthDevice < 1500
                                  ? TextStyle(
                                      color: Color(0xFFEF9040),
                                      fontSize: 18,
                                      fontFamily: 'raleway',
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Color(0xFFEF9040),
                                      height: 1.2
                                    )
                                  : TextStyle(
                                      color: Color(0xFFEF9040),
                                      fontSize: 22,
                                      fontFamily: 'raleway',
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Color(0xFFEF9040),
                                      height: 1.2
                                    )),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: heightDevice * 0.02,
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
