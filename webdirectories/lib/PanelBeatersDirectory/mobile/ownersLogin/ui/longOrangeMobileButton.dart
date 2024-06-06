import 'package:flutter/material.dart';

class LongOrangeMobileButton extends StatefulWidget {
  String buttonText;
  Function onPressed;
  double widthButton;

  LongOrangeMobileButton(
      {super.key,
      required this.onPressed,
      required this.buttonText,
      required this.widthButton});

  @override
  State<LongOrangeMobileButton> createState() => _LongOrangeMobileButtonState();
}

class _LongOrangeMobileButtonState extends State<LongOrangeMobileButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.widthButton,
      height: 40,
      padding: const EdgeInsets.only(top: 4),
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
      child: Padding(
        padding: const EdgeInsets.only(bottom: 4),
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
                fontSize: 16,
                fontFamily: 'ralewaybold',
              ),
            ),
            const SizedBox(width: 10.60),
            Icon(Icons.east),
          ],
        ),
      ),
    );
  }
}
