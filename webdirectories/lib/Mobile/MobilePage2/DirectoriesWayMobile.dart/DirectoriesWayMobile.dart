import 'package:flutter/material.dart';
import 'package:webdirectories/Mobile/MobilePage2/DirectoriesWayMobile.dart/DirectoriesWayMobileComponents/DirectoriesScrollMobile.dart';
import 'package:webdirectories/Mobile/MobilePage2/DirectoriesWayMobile.dart/DirectoriesWayMobileComponents/EagleSliderMobile.dart';
import 'package:webdirectories/Mobile/MobilePage2/DirectoriesWayMobile.dart/DirectoriesWayMobileComponents/StackedImageMobile.dart';
import 'package:webdirectories/Page3/WebDirectoriesWay/WebDirectoriesWayComponent/StackedImageContainer.dart';
import 'package:webdirectories/myutility.dart';

class DirectoriesWayMobile extends StatefulWidget {
  const DirectoriesWayMobile({super.key});

  @override
  State<DirectoriesWayMobile> createState() => _DirectoriesWayMobileState();
}

class _DirectoriesWayMobileState extends State<DirectoriesWayMobile> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MyUtility(context).height * 0.02,
        ),
        Text(
          'Our “Web Directories Way”',
          style: TextStyle(
            fontSize: 44,
            fontFamily: 'ralewaysemi',
            height: 1.1,
          ),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15, top: 15),
          child: Text(
            'We are Websmiths & Web Librarians',
            style: TextStyle(fontSize: 19, fontFamily: 'ralewaysemi'),
            textAlign: TextAlign.center,
          ),
        ),
        DirectoriesScrollMobile(controller: _pageController),
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
        SizedBox(
          height: MyUtility(context).height * 0.03,
        ),
        StackedImageMobile(),
        SizedBox(
          height: MyUtility(context).height * 0.03,
        ),
        Text(
          'Our Eagle Proclamation',
          style: TextStyle(
            fontSize: 44,
            fontFamily: 'ralewaysemi',
            height: 1.1,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          width: MyUtility(context).width / 1.2,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15, top: 15),
            child: Text(
              'The first step to attain a set goal, is to write it down',
              style: TextStyle(fontSize: 22, fontFamily: 'ralewaysemi'),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        EagleSliderMobile(),
        SizedBox(
          height: MyUtility(context).height * 0.02,
        ),
      ],
    );
  }
}
