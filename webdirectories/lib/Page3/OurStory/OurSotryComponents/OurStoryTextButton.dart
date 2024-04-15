import 'package:flutter/material.dart';

class OurStoryTextButton extends StatefulWidget {
  final String text;
  final VoidCallback onpress;

  const OurStoryTextButton(
      {super.key, required this.onpress, required this.text});

  @override
  State<OurStoryTextButton> createState() => _OurStoryTextButtonState();
}

class _OurStoryTextButtonState extends State<OurStoryTextButton> {
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
            color: Colors.black,
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
