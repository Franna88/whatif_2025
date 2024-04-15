import 'package:flutter/material.dart';

class LandingPageTextButton extends StatefulWidget {
  final String text;
  final VoidCallback onpress;

  const LandingPageTextButton(
      {super.key, required this.onpress, required this.text});

  @override
  State<LandingPageTextButton> createState() => _LandingPageTextButtonState();
}

class _LandingPageTextButtonState extends State<LandingPageTextButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onpress,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'raleway',
            color: Colors.white,
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
