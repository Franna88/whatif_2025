import 'package:flutter/material.dart';

class ArticlesShare extends StatefulWidget {
  const ArticlesShare({super.key});

  @override
  State<ArticlesShare> createState() => _ArticlesShareState();
}

class _ArticlesShareState extends State<ArticlesShare> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Share:',
          style: TextStyle(
            color: Colors.black.withOpacity(0.5),
            fontSize: 13.6,
            fontFamily: 'raleway',
          ),
        ),
        Container(
          height: 30.97,
          child: Row(
            children: [
              GestureDetector(
                  onTap: () {},
                  child: Image.asset('images/logos_facebook.png')),
              GestureDetector(
                  onTap: () {},
                  child: Image.asset('images/skill-icons_linkedin.png')),
              GestureDetector(
                  onTap: () {}, child: Image.asset('images/Email.png')),
              GestureDetector(
                  onTap: () {},
                  child: Image.asset('images/logos_pinterest.png')),
              GestureDetector(
                  onTap: () {}, child: Image.asset('images/SocialX.png')),
            ],
          ),
        ),
      ],
    );
  }
}
