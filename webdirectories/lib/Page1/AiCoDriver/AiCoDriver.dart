import 'package:flutter/material.dart';
import 'package:webdirectories/Page1/AiCoDriver/AiCoDriverComponents/AiCoDriverButton.dart';
import 'package:webdirectories/Page1/AiCoDriver/AiCoDriverComponents/LearnMoreButton.dart';
import 'package:webdirectories/myutility.dart';

class AiCoDriver extends StatefulWidget {
  const AiCoDriver({super.key});

  @override
  State<AiCoDriver> createState() => _AiCoDriverState();
}

class _AiCoDriverState extends State<AiCoDriver> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MyUtility(context).width / 2.5,
              height: MyUtility(context).height * 0.8,
              child: Image.asset(
                'images/phone1.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: MyUtility(context).width / 2.8,
              height: MyUtility(context).height * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MyUtility(context).height * 0.06,
                  ),
                  Text(
                    "Your AI Co-driver",
                    style: TextStyle(
                        fontSize: 48,
                        fontFamily: 'ralewaybold',
                        color: Colors.black),
                  ),
                  Text(
                    "Download your WATIF App today!",
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'ralewayDownload your WATIF App today!',
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: MyUtility(context).height * 0.01,
                  ),
                  Text(
                    "Hit the road with confidence and ditch the stress! WATIF is your free, all-in-one automotive app that empowers you with everything you need.",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'raleway',
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: MyUtility(context).height * 0.04,
                  ),
                  Row(
                    children: [
                      AiCoDriverButton(
                          image: 'images/AppleStore.png', onpress: () {}),
                      AiCoDriverButton(
                          image: 'images/Google Play.png', onpress: () {}),
                      AiCoDriverButton(
                          image: 'images/WindowsStore.png', onpress: () {}),
                    ],
                  ),
                  SizedBox(
                    height: MyUtility(context).height * 0.02,
                  ),
                  LearnMoreButton(buttontext: 'Learn More', onpress: () {}),
                  SizedBox(
                    height: MyUtility(context).height * 0.01,
                  ),
                  Container(
                    width: MyUtility(context).width * 0.1,
                    height: 40,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/stars.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: MyUtility(context).height * 0.1,
        ),
      ],
    );
  }
}
