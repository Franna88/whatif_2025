import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/CommonButtonR.dart';
import 'package:webdirectories/myutility.dart';

class ButtonInfoContainer extends StatefulWidget {
  final String headlineText;
  final String paragraph;
  final String buttonText;
  final VoidCallback onPressed;

  const ButtonInfoContainer(
      {super.key,
      required this.headlineText,
      required this.paragraph,
      required this.buttonText,
      required this.onPressed});

  @override
  State<ButtonInfoContainer> createState() => _ButtonInfoContainerState();
}

class _ButtonInfoContainerState extends State<ButtonInfoContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.45,
      height: MyUtility(context).height * 0.22,
      decoration: ShapeDecoration(
        color: Color(0xFF3C4043),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.headlineText,
              style: TextStyle(
                color: Colors.white,
                fontSize: MyUtility(context).width * 0.015,
                fontFamily: 'ralewaysemi',
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              widget.paragraph,
              style: TextStyle(
                color: Colors.white,
                fontSize: MyUtility(context).width * 0.01,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w400,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CommonButtonR(
                    buttonText: widget.buttonText, onPress: widget.onPressed)
              ],
            )
          ],
        ),
      ),
    );
  }
}
