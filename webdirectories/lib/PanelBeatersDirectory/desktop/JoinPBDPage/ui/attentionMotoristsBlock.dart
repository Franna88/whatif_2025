import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AttentionMotoristsBlock extends StatefulWidget {
  const AttentionMotoristsBlock({super.key});

  @override
  State<AttentionMotoristsBlock> createState() =>
      _AttentionMotoristsBlockState();
}

class _AttentionMotoristsBlockState extends State<AttentionMotoristsBlock> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        //color: Colors.amber,
        height: heightDevice * 0.45,
        width: widthDevice * 0.88,
        child: Stack(
          children: [
            Center(
              child: Container(
                width: widthDevice * 0.85,
                decoration: BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'images/imageStack2.png',
                        height: heightDevice * 0.30,
                      ),
                      SizedBox(
                        width: widthDevice * 0.29,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Attention ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: heightDevice < 710
                                      ? 25
                                      : widthDevice < 1500
                                          ? 30
                                          : 40,
                                  fontFamily: 'ralewaybold',
                                  height: 1,
                                ),
                              ),
                              TextSpan(
                                text: 'Motorists',
                                style: TextStyle(
                                  color: Color(0xFFE5882F),
                                  fontSize: heightDevice < 710
                                      ? 25
                                      : widthDevice < 1500
                                          ? 30
                                          : 40,
                                  fontFamily: 'ralewaybold',
                                  height: 1,
                                ),
                              ),
                              TextSpan(
                                text:
                                    '\n\nDitch the stress and find the perfect fit! Our user friendly platform connects you with trusted Auto Body Repairers instantly. Compare options, read real reviews, and make informed decisions. Save time & money - it\'s all here.',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: heightDevice < 710
                                      ? 16
                                      : widthDevice < 1500
                                          ? 18
                                          : 22,
                                  fontFamily: 'raleway',
                                  height: 1,
                                ),
                              ),
                              TextSpan(
                                text: '\n\nComing soon, the WATIF App. ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: heightDevice < 710
                                      ? 16
                                      : widthDevice < 1500
                                          ? 18
                                          : 22,
                                  fontFamily: 'raleway',
                                  height: 1,
                                ),
                              ),
                              TextSpan(
                                recognizer: TapGestureRecognizer(),
                                text: 'Your AI Co-Driver ',
                                style: TextStyle(
                                  color: Color(0xFFEF9040),
                                  fontSize: heightDevice < 710
                                      ? 16
                                      : widthDevice < 1500
                                          ? 18
                                          : 22,
                                  fontFamily: 'raleway',
                                  decoration: TextDecoration.underline,
                                  decorationColor: Color(0xFFEF9040),
                                  height: 1,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,

              child: Image.asset(
                'images/gear2.png',
                height: 130,
              ),
            )
          ],
        ),
      ),
    );
  }
}
