import 'package:flutter/material.dart';

class ArticlesShareMobile extends StatefulWidget {
  const ArticlesShareMobile({super.key});

  @override
  State<ArticlesShareMobile> createState() => _ArticlesShareMobileState();
}

class _ArticlesShareMobileState extends State<ArticlesShareMobile> {
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
