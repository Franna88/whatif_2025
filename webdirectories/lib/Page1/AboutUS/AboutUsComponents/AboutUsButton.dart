import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webdirectories/myutility.dart';

class AboutUsButton extends StatefulWidget {
  final String buttontext;
  final VoidCallback onpress;

  const AboutUsButton(
      {super.key, required this.buttontext, required this.onpress});

  @override
  State<AboutUsButton> createState() => _AboutUsButtonState();
}

class _AboutUsButtonState extends State<AboutUsButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.1,
      height: MyUtility(context).height * 0.045,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(MyUtility(context).height * 0.025),
      ),
      child: ElevatedButton(
        onPressed: widget.onpress,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(MyUtility(context).height * 0.025),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'images/arrow.svg',
              width: 25.0,
              height: 25.0,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              widget.buttontext,
              style: TextStyle(
                  color: Colors.black, fontSize: 14.0, fontFamily: 'raleway'),
            ),
          ],
        ),
      ),
    );
  }
}
