import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/Page3/OurStory/OurSotryComponents/OurStoryTextButton.dart';
import 'package:webdirectories/Page3/OurStory/OurSotryComponents/OvalTextButton.dart';
import 'package:webdirectories/myutility.dart';

class OurStory extends StatefulWidget {
  const OurStory({super.key});

  @override
  State<OurStory> createState() => _OurStoryState();
}

class _OurStoryState extends State<OurStory> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 50,
          ),
          child: Container(
            width: MyUtility(context).width / 1.2,
            height: MyUtility(context).height * 0.725,
            decoration: BoxDecoration(
                color: Color(0xFF0E1013),
                borderRadius: BorderRadius.circular(10.0)),
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
                        "A tale of passion, innovation and perseverance...",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'raleway',
                            color: Color(0xFF65DAFF)),
                      ),
                      Text(
                        "Our Story",
                        style: TextStyle(
                            fontSize: 46,
                            fontFamily: 'raleway',
                            color: Color(0xFFFBFBFB)),
                      ),
                      SizedBox(
                        width: MyUtility(context).width / 3.5,
                        child: Text(
                          "In the early days of the internet, finding information online was a challenge. Search engines were still in their infancy, and websites were often hidden away on obscure servers. In 2013 a South African entrepreneur, passionate about the automotive industry and evolving technology, Thys Cronje, and his two sons, Christoff and Ryno, saw the opportunity to make the internet more accessible and user-friendly. With persistence, patience and one laptop, they founded Web Directories, an independent company that would create niche comprehensive directories for various industries across Southern Africa.",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFFBFBFB),
                            fontFamily: 'raleway',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MyUtility(context).height * 0.015,
                      ),
                      SizedBox(
                        width: MyUtility(context).width / 3.5,
                        child: Text(
                          "Web Directories first product, the Panel Beater Directory, was an immediate success and became an invaluable resource for businesses and individuals alike, helping them to find the information they needed quickly and easily. It also empowered those who want to conduct business with others who shared their values and provided a recognized platform for qualified independent repair shops to serve South African motorists.",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFFBFBFB),
                            fontFamily: 'raleway',
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: SvgPicture.asset(
                              'images/arrowleft.svg',
                              width: 24,
                              height: 24,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: SvgPicture.asset(
                              'images/arrowright.svg',
                              width: 24,
                              height: 24,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MyUtility(context).width / 3.55,
                  height: MyUtility(context).height * 0.8,
                  child: Image.asset('images/laptop.png'),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
