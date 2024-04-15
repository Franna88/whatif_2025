import 'package:flutter/material.dart';
import 'package:webdirectories/Mobile/MobilePage4/ArticleMobile/ArticlesComponents/ArticlesContainermobile.dart';
import 'package:webdirectories/myutility.dart';

class ArticlesSliderMobile extends StatefulWidget {
  const ArticlesSliderMobile({Key? key}) : super(key: key);

  @override
  State<ArticlesSliderMobile> createState() => _ArticlesSliderMobileState();
}

class _ArticlesSliderMobileState extends State<ArticlesSliderMobile> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MyUtility(context).width / 1.15,
          height: MyUtility(context).height / 2.05,
          child: PageView(
            controller: _pageController,
            children: [
              ArticlesContainerMobile(
                image: 'images/drive.png',
                catagory: 'Panel Beater Directory',
                headline:
                    "See your Lightstone EchoMBR Results for February 2024",
                writer: 'Wena Cronje',
                discription:
                    "Your CSI success contributes to your business success and assists both prospects and industry users.",
                onpress: () {},
              ),
              ArticlesContainerMobile(
                image: 'images/drive.png',
                catagory: 'Panel Beater Directory',
                headline:
                    "See your Lightstone EchoMBR Results for February 2024",
                writer: 'Wena Cronje',
                discription:
                    "Your CSI success contributes to your business success and assists both prospects and industry users.",
                onpress: () {},
              ),
              // Add more ArticlesContainerMobile widgets as needed
            ],
          ),
        ),
        SizedBox(
          height: MyUtility(context).height * 0.015,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                _pageController.previousPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 2),
                  color: Colors.white,
                ),
                child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                child: Icon(Icons.keyboard_arrow_right, color: Colors.white),
              ),
            )
          ],
        ),
      ],
    );
  }
}
