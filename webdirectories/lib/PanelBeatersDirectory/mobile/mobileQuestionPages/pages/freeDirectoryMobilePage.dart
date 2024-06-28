import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileQuestionPages/ui/mobileCheckMarkText.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileQuestionPages/ui/questionPageContainer.dart';

class FreeDirectoryMobile extends StatefulWidget {
  Function(String) nextContainer;
  FreeDirectoryMobile({super.key, required this.nextContainer});

  @override
  State<FreeDirectoryMobile> createState() => _FreeDirectoryMobileState();
}

class _FreeDirectoryMobileState extends State<FreeDirectoryMobile> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;

    return QuestionPageContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'It is ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 29.6,
                      fontFamily: 'ralewaybold',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: 'FREE*\n',
                    style: TextStyle(
                      color: Color(0xFFEF9040),
                      fontSize: 29.6,
                      fontFamily: 'ralewaybold',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: 'to be listed in our ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 29.6,
                      fontFamily: 'ralewaybold',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: 'Directory!',
                    style: TextStyle(
                        color: Color(0xFFEF9040),
                        fontSize: 47.6,
                        fontFamily: 'ralewaybold',
                        fontWeight: FontWeight.w700,
                        height: 1.2),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: heightDevice * 0.22,
                width: widthDevice * 0.8,
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
            MobileCheckMarkText(text: 'Connect with more customers'),
            MobileCheckMarkText(text: 'Boosts your online brand visibility'),
            MobileCheckMarkText(text: 'Take control of your business listing'),
            MobileCheckMarkText(
                text: 'It\'s easy and only takes a few minutes'),
            const SizedBox(
              height: 25,
            ),

            // youtube button
            Container(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isPressed = !isPressed;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isPressed ? Colors.black : Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.zero,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 4, bottom: 4, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        children: [
                          Positioned(
                            left: 8,
                            top: 8,
                            child: Container(
                              child: Center(
                                child: Container(
                                  height: 12,
                                  width: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Center(
                              child: Icon(
                                Icons.smart_display,
                                color: const Color.fromARGB(255, 243, 21, 5),
                                size: 25,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Watch our video',
                        style: TextStyle(
                          color: isPressed ? Colors.white : Colors.black,
                          fontSize: 16,
                          fontFamily: 'ralewaymedium',
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
                      child: GestureDetector(
                        onTap: () {
                          widget.nextContainer("-");
                        },
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          color: Colors.black,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
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
            )
          ],
        ),
      ),
    );
  }
}
