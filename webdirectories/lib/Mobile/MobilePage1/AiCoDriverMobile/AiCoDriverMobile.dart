import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class AiCoDriverMobile extends StatefulWidget {
  const AiCoDriverMobile({super.key});

  @override
  State<AiCoDriverMobile> createState() => _AiCoDriverMobileState();
}

class _AiCoDriverMobileState extends State<AiCoDriverMobile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Your AI Co-pilot',
          style: TextStyle(fontSize: 46, fontFamily: 'ralewaysemi'),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            'Download your WATIF App today!',
            style: TextStyle(fontSize: 24, fontFamily: 'ralewaymedium'),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: MyUtility(context).width / 1.2,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                  fontSize: 18, fontFamily: 'raleway', color: Colors.black),
              children: [
                TextSpan(
                  text: 'Hit the road with confidence and ditch the stress! ',
                ),
                TextSpan(
                  text: 'WATIF',
                  style: TextStyle(fontFamily: 'ralewaybold'),
                ),
                TextSpan(
                  text:
                      ' is your free, all-in-one automotive app that empowers you with everything you need.',
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: MyUtility(context).height * 0.015,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: MyUtility(context).height * 0.04,
              width: MyUtility(context).width * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/appmobile.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              height: MyUtility(context).height * 0.04,
              width: MyUtility(context).width * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/googlemobile.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              height: MyUtility(context).height * 0.04,
              width: MyUtility(context).width * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/windowsmobile.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: MyUtility(context).height * 0.01,
        ),
        Image.asset('images/starsmobile.png'),
        SizedBox(
          height: MyUtility(context).height * 0.01,
        ),
        Container(
          width: MyUtility(context).height * 0.2,
          height: MyUtility(context).height * 0.05,
          decoration: BoxDecoration(
            color: Color(0xFF0E1013),
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: GestureDetector(
            onTap: () {
              // Add your onPressed functionality here
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "Learn More",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'raleway',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
