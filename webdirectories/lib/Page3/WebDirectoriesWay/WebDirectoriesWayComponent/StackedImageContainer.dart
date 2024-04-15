import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class StackImageContainer extends StatefulWidget {
  const StackImageContainer({super.key});

  @override
  State<StackImageContainer> createState() => _StackImageContainerState();
}

class _StackImageContainerState extends State<StackImageContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.2,
      height: MyUtility(context).height * 0.2,
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
                width: MyUtility(context).width * 0.2,
                height: 60,
                color: Colors.white,
              ),
              Positioned(
                top: 0,
                left: 241,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/avitar7.png'),
                  radius: 30,
                ),
              ),
              Positioned(
                top: 0,
                left: 201,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/avitar6.png'),
                  radius: 30,
                ),
              ),
              Positioned(
                top: 0,
                left: 161,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/avitar5.png'),
                  radius: 30,
                ),
              ),
              Positioned(
                top: 0,
                left: 121,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/avitar4.png'),
                  radius: 30,
                ),
              ),
              Positioned(
                top: 0,
                left: 81,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/avitar3.png'),
                  radius: 30,
                ),
              ),
              Positioned(
                top: 0,
                left: 41,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/avitar2.png'),
                  radius: 30,
                ),
              ),
              Positioned(
                top: 0,
                left: 5,
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

/*Stack(
            alignment: Alignment.center,
            children: [
              Container(
                // Added a container to give background color
                width: 200,
                height: 40,
                color: Colors.white,
              ),
              Positioned(
                top: 0,
                left: 150,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/avitar7.png'),
                  radius: 20,
                ),
              ),
              Positioned(
                top: 0,
                left: 125,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/avitar6.png'),
                  radius: 20,
                ),
              ),
              Positioned(
                top: 0,
                left: 100,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/avitar5.png'),
                  radius: 20,
                ),
              ),
              Positioned(
                top: 0,
                left: 75,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/avitar5.png'),
                  radius: 20,
                ),
              ),
              Positioned(
                top: 0,
                left: 50,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/avitar3.png'),
                  radius: 20,
                ),
              ),
              Positioned(
                top: 0,
                left: 25,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/avitar2.png'),
                  radius: 20,
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/avitar1.png'),
                  radius: 20,
                ),
              )
            ],
          )*/
