import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class EagleContainerMobile extends StatelessWidget {
  final String image;
  final String headlinetext;
  final String text;

  const EagleContainerMobile(
      {super.key,
      required this.image,
      required this.headlinetext,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width / 1.2,
      height: MyUtility(context).height * 0.33,
      decoration: BoxDecoration(
        color: Color(0xFFF4F4F4),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Image.asset(
            image,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  headlinetext,
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'ralewaybold',
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 18, fontFamily: 'raleway', color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
