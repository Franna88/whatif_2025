import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/articles/RecentArticlescomponents/ArticlesContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/articles/RecentArticlescomponents/ArticlesContainerWhite.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/articles/RecentArticlescomponents/SideScrollBar.dart';
import 'package:webdirectories/myutility.dart';

class RecentArticles extends StatefulWidget {
  const RecentArticles({super.key});

  @override
  State<RecentArticles> createState() => _RecentArticlesState();
}

class _RecentArticlesState extends State<RecentArticles> {
  final search = TextEditingController();

  dummyFunction() {
    //This is a tset
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: MyUtility(context).height,
        width: MyUtility(context).width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/mainbackgroundPanel.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50, top: 0),
                child: SizedBox(
                  width: MyUtility(context).width / 1.15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: 223.72,
                          height: 113.56,
                          child: Image.asset('images/panLogo.png')),
                      Text(
                        'Recent Articles:',
                        style: TextStyle(
                          fontSize: 34,
                          fontFamily: 'ralewaybold',
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: MyUtility(context).width / 1.1,
                height: MyUtility(context).height * 0.83,
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: MyUtility(context).width / 1.1,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFF0E1013),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Container(
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 1,
                                  ),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.keyboard_arrow_left,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Container(
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFFFF8828)),
                                child: Center(
                                  child: Icon(
                                    Icons.keyboard_arrow_right,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: MyUtility(context).width * 0.25,
                              height: 45,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black,
                                      ),
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.search,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: search,
                                      style: TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                        hintText: 'Search Keywords',
                                        hintStyle: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'ralewaysemi',
                                          color: Color(0xFF717375),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                        filled: true,
                                        fillColor: Colors.transparent,
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 10),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      search.clear();
                                    },
                                    icon: Icon(
                                      Icons.close,
                                      color: Color(0xFF717375),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ArticlesContainer(
                              image: 'Images/mainbackgroundPanel.png',
                              category: 'Panel Beater Directory',
                              headline:
                                  'See your Lightstone EchoMBR Results for February 2024',
                              writer: 'By Wena Cronje',
                              description:
                                  'Your CSI success contributes to your business success and assists both prospects and industry users.',
                              onpress: () {}),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ArticlesContainerWhite(
                                  image: 'Images/articles1.png',
                                  category: 'Panel Beater Directory',
                                  headline:
                                      "How to Replace Your Car's Air Filter",
                                  writer: 'By Wena Cronje',
                                  description:
                                      "It's important to replace your car's air filter regularly, according to your manufacturer's recommended maintenance...",
                                  onPress: () {}),
                              ArticlesContainerWhite(
                                  image: 'Images/articles2.png',
                                  category: 'Panel Beater Directory',
                                  headline:
                                      'A Technical Look at Paintless Dent Removal',
                                  writer: 'By Wena Cronje',
                                  description:
                                      "Today, we'll share 7 tips to drive your online presence and revenue to new heights.",
                                  onPress: () {}),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ArticlesContainerWhite(
                                  image: 'Images/articles3.png',
                                  category: 'Panel Beater Directory',
                                  headline:
                                      "The Lightstone EchoMBR Rankings Awards",
                                  writer: 'By Wena Cronje',
                                  description:
                                      "Congratulations to the winners and top performers in each of the categories!",
                                  onPress: () {}),
                              ArticlesContainerWhite(
                                  image: 'Images/articles4.png',
                                  category: 'Panel Beater Directory',
                                  headline:
                                      'The Future of Panel Beating in South Africa',
                                  writer: 'By Wena Cronje',
                                  description:
                                      "The panelbeating industry is constantly evolving, as new technologies and materials are developed.",
                                  onPress: () {}),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ArticlesContainerWhite(
                                  image: 'Images/articles5.png',
                                  category: 'Panel Beater Directory',
                                  headline:
                                      "What do different car colours mean?",
                                  writer: 'By Wena Cronje',
                                  description:
                                      "Dive into the fascinating world of car colour psychology and discover what your ride reveals about your personality...",
                                  onPress: () {}),
                              ArticlesContainerWhite(
                                  image: 'Images/articles6.png',
                                  category: 'Panel Beater Directory',
                                  headline:
                                      "How to Replace Your Car's Windscreen Wiper Blades",
                                  writer: 'By Wena Cronje',
                                  description:
                                      "Replacing your car wiper blades is a simple and inexpensive maintenance task that can help to improve...",
                                  onPress: () {}),
                            ],
                          ),
                          SideScrollBar()
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
