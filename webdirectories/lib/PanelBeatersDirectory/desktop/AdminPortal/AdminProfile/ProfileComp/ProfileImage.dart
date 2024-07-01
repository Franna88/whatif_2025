import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class ProfileImage extends StatefulWidget {
  final String imageText;

  const ProfileImage({super.key, required this.imageText});

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(
            widget.imageText,
            style: TextStyle(
              color: Color(0xFF0F253A),
              fontSize: 20.4,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
        ),
        Container(
          width: MyUtility(context).width * 0.12,
          height: MyUtility(context).height * 0.22,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
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
        )
      ],
    );
  }
}
