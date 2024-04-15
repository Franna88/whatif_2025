import 'package:flutter/material.dart';
import 'package:webdirectories/Page1/LandingPage/LandingPageComponents/LandingPageTextButton.dart';
import 'package:webdirectories/myutility.dart';

class LandingPageDisPlay extends StatefulWidget {
  const LandingPageDisPlay({super.key});

  @override
  State<LandingPageDisPlay> createState() => _LandingPageDisPlayState();
}

class _LandingPageDisPlayState extends State<LandingPageDisPlay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/Glasses.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Image.asset(
                  'images/logo.png',
                  width: 200,
                  height: 120,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: SizedBox(
                  width: MyUtility(context).width * 0.3,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LandingPageTextButton(onpress: () {}, text: 'Home'),
                      LandingPageTextButton(onpress: () {}, text: 'Our Story'),
                      LandingPageTextButton(onpress: () {}, text: 'Watif'),
                      LandingPageTextButton(onpress: () {}, text: 'Articles'),
                      Spacer(),
                      LandingPageTextButton(
                          onpress: () {}, text: 'Get in Touch'),
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: MyUtility(context).height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'images/gauge.png',
                width: 450,
                height: 450,
              ),
              Image.asset(
                'images/textbox.png',
                width: 450,
                height: 450,
              ),
            ],
          )
        ],
      ),
    );
  }
}
