import 'package:flutter/material.dart';

class LongOrangeButton extends StatefulWidget {
  String buttonText;
  Function onPressed;

  LongOrangeButton(
      {super.key, required this.onPressed, required this.buttonText});

  @override
  State<LongOrangeButton> createState() => _OrangeButtonState();
}

class _OrangeButtonState extends State<LongOrangeButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPressed();
      },
      child: Container(
        width: 450,
        height: 40,
        padding: const EdgeInsets.all(5),
        decoration: ShapeDecoration(
          color: Color(0xFFE2822B),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(230),
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
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.buttonText,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'ralewaybold',
              ),
            ),
            const SizedBox(width: 10.60),
            Container(
              width: 25,
              height: 25,
              child: Icon(Icons.east),
            ),
          ],
        ),
      ),
    );
  }
}
