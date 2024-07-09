import 'package:flutter/material.dart';

class IconButtons extends StatefulWidget {
  const IconButtons({super.key});

  @override
  State<IconButtons> createState() => _IconButtonsState();
}

class _IconButtonsState extends State<IconButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 1,
              ),
            ),
            child: Center(
              child: Icon(
                Icons.keyboard_arrow_left,
                color: Colors.white,
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Container(
            padding: EdgeInsets.all(3),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Color(0xFFFF8828)),
            child: Center(
              child: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
