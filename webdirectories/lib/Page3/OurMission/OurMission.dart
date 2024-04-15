import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/Page3/OurMission/OurMissionComponent/OurMissionIconText.dart';
import 'package:webdirectories/myutility.dart';

class OurMission extends StatefulWidget {
  const OurMission({super.key});

  @override
  State<OurMission> createState() => _OurMissionState();
}

class _OurMissionState extends State<OurMission> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF0E1013),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50, bottom: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Our Mission & Vision",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'ralewaybold',
                      color: Color(0xFF65DAFF)),
                ),
                Text(
                  "#WeConnect",
                  style: TextStyle(
                      fontSize: 46,
                      fontFamily: 'ralewaybold',
                      color: Color(0xFFFBFBFB)),
                ),
                SizedBox(
                  width: MyUtility(context).width / 4.0,
                  child: Text(
                    "Our Mission is to lower the barrier of entry and empower businesses across Africa, to succeed and subsequently grow the African economy.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFFFBFBFB),
                      fontFamily: 'raleway',
                    ),
                  ),
                ),
                SizedBox(
                  height: MyUtility(context).height * 0.025,
                ),
                SizedBox(
                  width: MyUtility(context).width / 3.5,
                  child: Text(
                    "Our Vision is to become the most trusted and comprehensive online directory of niche websites in Africa, connecting users with the information and resources they need, when they need them.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFFFBFBFB),
                      fontFamily: 'raleway',
                    ),
                  ),
                ),
                SizedBox(
                  height: MyUtility(context).height * 0.025,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: MyUtility(context).width / 6.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "For Businesses",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'ralewaybold',
                                color: Color(0xFF65DAFF)),
                          ),
                          SizedBox(
                            height: MyUtility(context).height * 0.025,
                          ),
                          OurMissionIconText(
                              text: 'Boost your visibility & reach'),
                          OurMissionIconText(text: 'Target qualified leads'),
                          OurMissionIconText(text: 'Build brand reputation'),
                          OurMissionIconText(text: 'Grow with data & insights'),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MyUtility(context).width / 6.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "For the Public",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'ralewaybold',
                                color: Color(0xFF65DAFF)),
                          ),
                          SizedBox(
                            height: MyUtility(context).height * 0.025,
                          ),
                          OurMissionIconText(
                              text: 'Find specific services fast'),
                          OurMissionIconText(
                              text: 'Support verified businesses'),
                          OurMissionIconText(
                              text:
                                  'Make informed decisions based on accurate information'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MyUtility(context).width / 4.0,
                  height: MyUtility(context).height * 0.5,
                  child: Image.asset('images/laptop2.png'),
                ),
                SizedBox(
                  height: MyUtility(context).height * 0.01,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MyUtility(context).width * 0.08,
                      child: Column(
                        children: [
                          Text(
                            "65M",
                            style: TextStyle(
                                fontSize: 32,
                                fontFamily: 'raleway',
                                color: Color(0xFFFBFBFB)),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "Unique Views",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFFFBFBFB),
                              fontFamily: 'raleway',
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: MyUtility(context).height * 0.05,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: MyUtility(context).width * 0.01,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "8",
                                    style: TextStyle(
                                        fontSize: 32,
                                        fontFamily: 'raleway',
                                        color: Color(0xFFFBFBFB)),
                                  ),
                                  Text(
                                    "Countries",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFFFBFBFB),
                                      fontFamily: 'raleway',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Container(
                            width: 1,
                            height: MyUtility(context).height * 0.1,
                            decoration: BoxDecoration(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MyUtility(context).width * 0.06,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MyUtility(context).height * 0.025,
                          ),
                          Text(
                            "1765",
                            style: TextStyle(
                                fontSize: 32,
                                fontFamily: 'raleway',
                                color: Color(0xFFFBFBFB)),
                          ),
                          Text(
                            "Cities &\nSuburbs",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFFFBFBFB),
                              fontFamily: 'raleway',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: MyUtility(context).width / 5.5,
                  height: MyUtility(context).height * 0.4,
                  child: Image.asset('images/buisnessman.png'),
                ),
                SizedBox(
                  height: MyUtility(context).height * 0.1,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
