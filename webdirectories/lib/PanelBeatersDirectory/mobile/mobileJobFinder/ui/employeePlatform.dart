import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/ui/generalButton.dart';
import 'package:webdirectories/myutility.dart';

class EmployeePlatform extends StatefulWidget {
  const EmployeePlatform({super.key});

  @override
  State<EmployeePlatform> createState() => _EmployeePlatformState();
}

class _EmployeePlatformState extends State<EmployeePlatform> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width / 1.2,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.56, -0.83),
          end: Alignment(-0.56, 0.83),
          colors: [
            Colors.white.withOpacity(0.10000000149011612),
            Colors.black.withOpacity(0.4000000059604645)
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        shadows: [
          BoxShadow(
            color: Color(0xBF000000),
            blurRadius: 24,
            offset: Offset(0, 4),
            spreadRadius: -1,
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Text(
            'Employee Platform',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'ralewaysemi',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Submit your details and we promise to publish it to our exclusive employers database. You will be contacted by interested employers directly as we have no influence in the application and interview process.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'raleway',
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Generalbutton(
            backgroundColor: Colors.white,
            circleColor: Colors.black,
            iconColor: Colors.white,
            text1: 'Sumbit CV',
            textColor: Colors.black,
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
