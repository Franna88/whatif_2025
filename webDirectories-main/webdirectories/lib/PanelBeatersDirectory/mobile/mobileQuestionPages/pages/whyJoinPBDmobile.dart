import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobilePricingOptionsPages/pricingOptions/pricingOptionsMobileMain.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileQuestionPages/ui/questionOrangeButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileQuestionPages/ui/questionPageContainer.dart';

class WhyJoinPBDmobile extends StatefulWidget {
  Function(String) nextContainer;
  WhyJoinPBDmobile({super.key, required this.nextContainer});

  @override
  State<WhyJoinPBDmobile> createState() => _WhyJoinPBDmobileState();
}

class _WhyJoinPBDmobileState extends State<WhyJoinPBDmobile> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: QuestionPageContainer(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 15, top: 25, bottom: 25, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Why join the\n',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 27.6,
                        fontFamily: 'ralewaybold',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: 'Panel Beater Directory?',
                      style: TextStyle(
                        color: Color(0xFFE5882F),
                        fontSize: 47.6,
                        fontFamily: 'ralewaybold',
                        fontWeight: FontWeight.w700,
                        height: 1.1,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: heightDevice * 0.22,
                  width: widthDevice * 0.8,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/questionsHero.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                'Join our network of 2 100+ shops and benefit from our decade-long customer support and industry partnerships. \n\nGet seen by more qualified leads thanks to trusted reviews, targeted advertisement opportunities, and first-page Google rankings. Leverage clicks, leads and conversions to maximize your Return on Investment. \n\nManage your profile 24/7 anywhere and reach a wider audience across 8 African countries. Choose features that best suit your budget and target audience.\n\nPartner with us and grow your business!',
                style: TextStyle(
                  color: Color(0xFFF4F4F4),
                  fontSize: 15.64,
                  fontFamily: 'raleway',
                  height: 1.2,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 15),
              QuestionOrangeButton(
                buttonText: 'What does it cost?',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PricingOptionsMobileMain(
                        closeDialog: () => Navigator.pop(context),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          widget.nextContainer("-");
                        },
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: ShapeDecoration(
                            shape: OvalBorder(
                              side:
                                  BorderSide(width: 0.94, color: Colors.black),
                            ),
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
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      widget.nextContainer("+");
                    },
                    child: Container(
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
                  ),
                ],
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
