import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/Page1/AboutUS/AboutUsComponents/AboutUsButton.dart';
import 'package:webdirectories/myutility.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF0E1013),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: MyUtility(context).width / 3.5,
            height: MyUtility(context).height * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "About us",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'raleway',
                      color: Color(0xFF65DAFF)),
                ),
                SizedBox(
                  width: MyUtility(context).width / 3.5,
                  child: Text(
                    "Empowering informed decisions across Africa",
                    style: TextStyle(
                        fontSize: 46,
                        fontFamily: 'raleway',
                        color: Color(0xFFFBFBFB)),
                  ),
                ),
                SizedBox(
                  width: MyUtility(context).width / 3.5,
                  child: Text(
                    "Driven by passion and innovation, Web Directories emerged in 2013 to bridge the online information gap in South Africa, starting with comprehensive automotive directories and growing into a leading online business resource for businesses and the public.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFFFBFBFB),
                      fontFamily: 'raleway',
                    ),
                  ),
                ),
                SizedBox(
                  width: MyUtility(context).width / 3.5,
                  child: Row(
                    children: [
                      SizedBox(
                        width: MyUtility(context).width / 7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "11 200+",
                              style: TextStyle(
                                  fontSize: 26,
                                  fontFamily: 'raleway',
                                  color: Color(0xFF65DAFF)),
                            ),
                            Text(
                              "Profiles",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFFFBFBFB),
                                fontFamily: 'raleway',
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MyUtility(context).width / 7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "10+",
                              style: TextStyle(
                                  fontSize: 26,
                                  fontFamily: 'raleway',
                                  color: Color(0xFF65DAFF)),
                            ),
                            Text(
                              "Years in Service",
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
                ),
                SizedBox(
                  height: MyUtility(context).height * 0.01,
                ),
                AboutUsButton(buttontext: 'Contact Us', onpress: () {})
              ],
            ),
          ),
          Container(
            width: MyUtility(context).width / 3.5,
            height: MyUtility(context).height * 0.7,
            child: Image.asset('images/stackimage.png'),
          )
        ],
      ),
    );
  }
}
