import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/ui/youtubeWatchButton.dart';

class YoutubeVideoBlock extends StatefulWidget {
  const YoutubeVideoBlock({super.key});

  @override
  State<YoutubeVideoBlock> createState() => _YoutubeVideoBlockState();
}

class _YoutubeVideoBlockState extends State<YoutubeVideoBlock> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Container(
      height: 1060,
      //width: widthDevice * 88,
      
      child: Stack(
        children: [
          Center(
            child: new ClipRect(
              child: new BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: new Container(
                  width: widthDevice * 0.85,
                  height: 920,
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.grey.shade200.withOpacity(0.3),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        SizedBox(
                          height: 70,
                          child: Text(
                            'The only panel you need to control:\n',
                            style: TextStyle(
                              color: Color(0xFFE5882F),
                              fontSize: widthDevice < 1110
                                  ? 50
                                  : widthDevice < 1500
                                      ? 55
                                      : 65,
                              fontFamily: 'ralewaybold',
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
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: 900,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Your FREE* Listing',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: widthDevice < 1500 ? 75 : 100,
                                  height: 1,
                                  fontFamily: 'ralewaybold',
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: widthDevice < 1500 ? 130 : 90,
                                  ),
                                  Image.asset(
                                    'images/scribble.png',
                                    height: 80,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 745,
                          child: Text(
                            textAlign: TextAlign.center,
                            'Get found faster for collision repairs! Choose your plan, manage your listing, and attract more customers – all in minutes. Sign up today!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: widthDevice < 1500 ? 19 : 23,
                              height: 1.2,
                              fontFamily: 'raleway',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        YoutubeWatchButton(),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 400,
                          color: Colors.black,
                          width: 750,
                          child: Center(
                            child: Text(
                              'Waiting for link',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: widthDevice > 1600 ? widthDevice / 16 : widthDevice / 18,
            bottom: 0,
              child: Image.asset(
            'images/gear3.png',
            height: 130,
          ))
        ],
      ),
    );
  }
}
