import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class StackedImageMobile extends StatefulWidget {
  const StackedImageMobile({super.key});

  @override
  State<StackedImageMobile> createState() => _StackedImageMobileState();
}

class _StackedImageMobileState extends State<StackedImageMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width / 1.2,
      height: MyUtility(context).height * 0.15,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(-2, 2), // Adjust offset for left shading
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(2, 2), // Adjust offset for right shading
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2), // Adjust offset for bottom shading
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "The Eagle Team",
            style: TextStyle(
                fontSize: 16, fontFamily: 'raleway', color: Colors.black),
          ),
          SizedBox(height: 20), // Added for spacing
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                // Added a container to give background color
                width: MyUtility(context).width / 1.2,
                height: 60,
                color: Colors.white,
              ),
              Positioned(
                top: 0,
                left: 256,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/avitar7.png'),
                  radius: 30,
                ),
              ),
              Positioned(
                top: 0,
                left: 216,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/avitar6.png'),
                  radius: 30,
                ),
              ),
              Positioned(
                top: 0,
                left: 176,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/avitar5.png'),
                  radius: 30,
                ),
              ),
              Positioned(
                top: 0,
                left: 136,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/avitar4.png'),
                  radius: 30,
                ),
              ),
              Positioned(
                top: 0,
                left: 96,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/avitar3.png'),
                  radius: 30,
                ),
              ),
              Positioned(
                top: 0,
                left: 56,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/avitar2.png'),
                  radius: 30,
                ),
              ),
              Positioned(
                top: 0,
                left: 20,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/avitar1.png'),
                  radius: 30,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
