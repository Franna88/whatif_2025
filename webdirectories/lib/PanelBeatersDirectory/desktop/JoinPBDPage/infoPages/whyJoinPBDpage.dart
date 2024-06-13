import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/ui/orangeButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/ui/smallGlassContainer.dart';

class WhyJoinPage extends StatelessWidget {
  Function(String) nextContainer;
  Function(int) updateContainerIndex;
  WhyJoinPage(
      {super.key,
      required this.nextContainer,
      required this.updateContainerIndex});

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return SmallGlassContainer(
        nextContainer: nextContainer,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 25, top: 25, bottom: 30, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Why join the ',
                        style: widthDevice < 1500
                            ? const TextStyle(
                                color: Colors.white,
                                fontSize: 65,
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
                              )),
                    TextSpan(
                        text: 'PBD',
                        style: widthDevice < 1500
                            ? const TextStyle(
                                color: Color(0xFFEF9040),
                                fontSize: 65,
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
                                fontSize: 65,
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
                              )),
                    TextSpan(
                        text: '?',
                        style: widthDevice < 1500
                            ? const TextStyle(
                                color: Colors.white,
                                fontSize: 65,
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
                                fontSize: 65,
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
                              )),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: widthDevice * 0.40,
                child: Text(
                  '\nJoin our network of 2 100+ shops and benefit from our decade-long customer support and industry partnerships. \n\nGet seen by more qualified leads thanks to trusted reviews, targeted advertisement opportunities, and first-page Google rankings. Leverage clicks, leads and conversions to maximize your Return on Investment. \n\nManage your profile 24/7 anywhere and reach a wider audience across 8 African countries. Choose features that best suit your budget and target audience.\n\nPartner with us and grow your business!\n',
                  style:  widthDevice < 1500
                              ? TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'raleway',
                                  
                                ) :  
                               TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontFamily: 'raleway',
                                  
                                )
                ),
              ),
              SizedBox(
                width: widthDevice / 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Spacer(),
                    OrangeButton(
                      buttonText: 'What does it cost?',
                      onPressed: () {
                        updateContainerIndex(3);
                      },
                    ),
                    const SizedBox(
                      width: 25,
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
