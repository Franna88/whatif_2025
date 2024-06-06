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
              const EdgeInsets.only(left: 15, top: 25, bottom: 30, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Why join the ',
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
                        fontSize: widthDevice / 36,
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
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Join our network of 2 100+ shops and benefit from our \ndecade-long customer support and industry partnerships. \n\nGet seen by more qualified leads thanks to trusted \nreviews, targeted advertisement opportunities, and \nfirst-page Google rankings. Leverage clicks, leads and \nconversions to maximize your Return on Investment. \n\nManage your profile 24/7 anywhere and reach a wider \naudience across 8 African countries. Choose features \nthat best suit your budget and target audience.\n\nPartner with us and grow your business!\n',
                style: TextStyle(
                    color: Color(0xFFF4F4F4),
                    fontSize: widthDevice / 73,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w400,
                    height: 1.2),
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
