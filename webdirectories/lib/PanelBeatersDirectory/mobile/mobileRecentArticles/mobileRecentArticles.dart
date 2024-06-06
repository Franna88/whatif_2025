import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileRecentArticles/ui/articleDescriptionContainer.dart';
import 'package:webdirectories/myutility.dart';

import '../MobileTopNavBar/MobileTopNavBarhome.dart';

class MobileRecentArticles extends StatefulWidget {
  const MobileRecentArticles({super.key});

  @override
  State<MobileRecentArticles> createState() => _MobileRecentArticlesState();
}

class _MobileRecentArticlesState extends State<MobileRecentArticles> {
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
                  image: AssetImage('images/mobileLanding.png'),
                  fit: BoxFit.cover),
            ),
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  MobileTopNavBarhome(),
                  Container(
                      width: MyUtility(context).width * 0.87,
                      height: MyUtility(context).height * 0.8,
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.56, -0.83),
                          end: Alignment(-0.56, 0.83),
                          colors: [
                            Colors.white.withOpacity(0.10000000149011612),
                            Colors.white.withOpacity(0.4000000059604645)
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0xBF000000),
                            blurRadius: 24,
                            offset: Offset(0, 4),
                            spreadRadius: -1,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ArticleDescriptionContainer(
                                image: 'Images/mainbackgroundPanel.png',
                                category: 'Panel Beater Directory',
                                headline:
                                    'See your Lightstone EchoMBR Results for February 2024',
                                writer: 'By Wena Cronje',
                                description:
                                    'Your CSI success contributes to your business success and assists both prospects and industry users.',
                                onpress: () {}),
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
                                        side: BorderSide(
                                            width: 0.94, color: Colors.black),
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
                        ],
                      ))
                ]))));
  }
}
