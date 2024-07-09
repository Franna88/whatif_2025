import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

import 'SvgPictureButtonMobile.dart';

class SocialIconsMobile extends StatefulWidget {
  const SocialIconsMobile({super.key});

  @override
  State<SocialIconsMobile> createState() => _SocialIconsMobileState();
}

class _SocialIconsMobileState extends State<SocialIconsMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.9,
      height: MyUtility(context).height * 0.06,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPictureButtonMobile(imagePath: 'images/xt.svg', onPress: () {}),
          SvgPictureButtonMobile(
              imagePath: 'images/facebook.svg', onPress: () {}),
          SvgPictureButtonMobile(imagePath: 'images/insta.svg', onPress: () {}),
          SvgPictureButtonMobile(
              imagePath: 'images/youtube.svg', onPress: () {}),
          SvgPictureButtonMobile(imagePath: 'images/in.svg', onPress: () {}),
          SvgPictureButtonMobile(
              imagePath: 'images/tictok.svg', onPress: () {}),
          SvgPictureButtonMobile(imagePath: 'images/xt.svg', onPress: () {}),
        ],
      ),
    );
  }
}
