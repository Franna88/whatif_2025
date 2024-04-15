import 'package:flutter/material.dart';

class OvalTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const OvalTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125, // Adjust width as needed
      height: 40, // Adjust height as needed
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(25), // Half of the height for an oval shape
        color: Color(0xFF0E1013), // Black color
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'raleway',
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
