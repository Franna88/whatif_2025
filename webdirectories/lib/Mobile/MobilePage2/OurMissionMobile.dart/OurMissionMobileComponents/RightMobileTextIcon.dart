import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/myutility.dart';

class RightMobileTextIcon extends StatefulWidget {
  final String text;
  const RightMobileTextIcon({Key? key, required this.text}) : super(key: key);

  @override
  State<RightMobileTextIcon> createState() => _RightMobileTextIconState();
}

class _RightMobileTextIconState extends State<RightMobileTextIcon> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: Text(
                widget.text,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFFBFBFB),
                ),
                textAlign: TextAlign.right,
              ),
            ),
            SizedBox(width: 8),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF292556),
              ),
              child: Center(
                child: SvgPicture.asset(
                  'images/circlecheck.svg',
                  width: 28,
                  height: 28,
                  color: Color(0xFF65DAFF),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
