import 'package:flutter/material.dart';

class CategoryText extends StatelessWidget {
  final String text1;
  final String text2;
  const CategoryText({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
  width: 197,
  height: 77,
  child: Text.rich(
    TextSpan(
      children: [
        TextSpan(
          text: '$text1\n',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'raleway',
            
            height: 0,
          ),
        ),
        TextSpan(
          text: text2,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'ralewaymedium',
            fontWeight: FontWeight.bold,
            height: 0,
          ),
        ),
      ],
    ),
    textAlign: TextAlign.center,
  ),
);
  }
}