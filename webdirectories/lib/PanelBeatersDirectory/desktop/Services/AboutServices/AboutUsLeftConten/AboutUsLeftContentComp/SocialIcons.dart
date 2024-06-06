import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/AboutServices/AboutUsLeftConten/AboutUsLeftContentComp/SvgPictureButton.dart';
import 'package:webdirectories/myutility.dart';

class SocialIcons extends StatefulWidget {
  const SocialIcons({super.key});

  @override
  State<SocialIcons> createState() => _SocialIconsState();
}

class _SocialIconsState extends State<SocialIcons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.34,
      height: MyUtility(context).height * 0.12,
      decoration: ShapeDecoration(
        color: Color(0xFF181B1D),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPictureButton(imagePath: 'images/xt.svg', onPress: () {}),
          SvgPictureButton(imagePath: 'images/facebook.svg', onPress: () {}),
          SvgPictureButton(imagePath: 'images/insta.svg', onPress: () {}),
          SvgPictureButton(imagePath: 'images/youtube.svg', onPress: () {}),
          SvgPictureButton(imagePath: 'images/in.svg', onPress: () {}),
          SvgPictureButton(imagePath: 'images/tictok.svg', onPress: () {}),
          SvgPictureButton(imagePath: 'images/xt.svg', onPress: () {}),
        ],
      ),
    );
  }
}
