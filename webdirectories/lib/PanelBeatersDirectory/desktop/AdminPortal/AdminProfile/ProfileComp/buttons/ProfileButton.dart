import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  const ProfileButton({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFF0F253A) : Color(0x660F253A),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 27.2,
            fontFamily: 'Koulen',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
