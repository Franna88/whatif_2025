import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/customPlanMobilePages/customPlan.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileQuestionPages/ui/questionOrangeButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileQuestionPages/ui/questionPageContainer.dart';

class WhyMotoristsMobilePage extends StatefulWidget {
  Function(String) nextContainer;
  WhyMotoristsMobilePage({super.key, required this.nextContainer});

  @override
  State<WhyMotoristsMobilePage> createState() => _WhyMotoristsMobilePageState();
}

class _WhyMotoristsMobilePageState extends State<WhyMotoristsMobilePage> {
  bool isPressed = false;

  //Open popup custom plan
  Future openRegistrationProcess() => showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            child: CustomPlanMobile(closeDialog: () => Navigator.pop(context)));
      });

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return QuestionPageContainer(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Why motorists use the ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontFamily: 'ralewaybold',
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
                        fontSize: 50,
                        fontFamily: 'ralewaybold',
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
                        fontSize: 50,
                        fontFamily: 'ralewaybold',
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
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: heightDevice * 0.22,
                  width: widthDevice * 0.78,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/questionsHero.png'),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text.rich(
                textAlign: TextAlign.start,
                TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'We are a proudly South African information service that empowers the motoring public and industry professionals to find trusted and skilled auto body repairers instantly.\n\n',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'raleway',
                          height: 1.2),
                    ),
                    TextSpan(
                      text:
                          'Our transparent, user friendly platform helps customers find and compare relevant options, read real reviews, see industry ratings and make informed decisions, saving both time and money.',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'raleway',
                          height: 1.2),
                    ),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Coming soon, the WATIF App.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'raleway',
                      ),
                    ),
                    TextSpan(
                      text: ' Your AI Co-Driver ',
                      style: TextStyle(
                        color: Color(0xFFEF9040),
                        fontSize: 16,
                        fontFamily: 'raleway',
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFFEF9040),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              QuestionOrangeButton(
                  buttonText: 'Back to Register Page',
                  onPressed: () {
                    openRegistrationProcess();
                  }),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 25,
                        height: 25,
                        decoration: ShapeDecoration(
                          shape: OvalBorder(
                            side: BorderSide(width: 0.94, color: Colors.black),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 4,
                        top: 5,
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          color: Colors.black,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.zero,
                    child: Icon(
                      Icons.keyboard_arrow_right_outlined,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
