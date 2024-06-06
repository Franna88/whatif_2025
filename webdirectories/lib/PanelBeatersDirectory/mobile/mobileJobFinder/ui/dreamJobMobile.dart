import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class DreamJobMobile extends StatefulWidget {
  const DreamJobMobile({super.key});

  @override
  State<DreamJobMobile> createState() => _DreamJobMobileState();
}

class _DreamJobMobileState extends State<DreamJobMobile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: MyUtility(context).width * 1.1,
          height: MyUtility(context).height * 0.4,
          decoration: ShapeDecoration(
            image: DecorationImage(
              image: AssetImage("images/DreamJob.png"),
              fit: BoxFit.fill,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
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
        ),
        Text(
          'Let’s get you your dream job!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'ralewaysemi',
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          width: MyUtility(context).width * 1.1,
          child: Text(
            'Introducing JobFinder, our contribution to assist job seekers looking for employment in the Auto Body Repair industry!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'raleway',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  "384+",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFDC7825),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Current CV's",
                  style: TextStyle(
                    color: Color(0xFFF4F4F4),
                    fontSize: 20,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.69,
                  ),
                )
              ],
            ),
            Column(
              children: [
                Text(
                  "2109",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFDC7825),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Shops",
                  style: TextStyle(
                    color: Color(0xFFF4F4F4),
                    fontSize: 20,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.69,
                  ),
                )
              ],
            ),
            Column(
              children: [
                Text(
                  "100%",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFDC7825),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Free service",
                  style: TextStyle(
                    color: Color(0xFFF4F4F4),
                    fontSize: 20,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.69,
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
