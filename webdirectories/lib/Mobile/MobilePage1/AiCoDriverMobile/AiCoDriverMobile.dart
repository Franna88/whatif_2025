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
          'Your AI Co-driver',
          style: TextStyle(fontSize: 44, fontFamily: 'ralewaysemi'),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            'Download your WATIF App today!',
            style: TextStyle(fontSize: 20, fontFamily: 'ralewaymedium'),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: MyUtility(context).width / 1.125,
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
                  style: TextStyle(fontFamily: 'ralewaysemi'),
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
          height: MyUtility(context).height * 0.03,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: MyUtility(context).height * 0.045,
              width: MyUtility(context).width * 0.28,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/AppleStore.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              height: MyUtility(context).height * 0.045,
              width: MyUtility(context).width * 0.28,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/Google Play.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              height: MyUtility(context).height * 0.045,
              width: MyUtility(context).width * 0.28,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/WindowsStore.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: MyUtility(context).height * 0.02,
        ),
        Container(
          height: MyUtility(context).height * 0.04,
          width: MyUtility(context).width * 0.45,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/starsmobile.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          height: MyUtility(context).height * 0.02,
        ),
        Container(
          width: MyUtility(context).height * 0.22,
          height: MyUtility(context).height * 0.05,
          decoration: BoxDecoration(
            color: Color(0xFF0E1013),
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
                Text(
                  "Learn More",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'raleway',
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: MyUtility(context).width * 0.01,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 25,
        )
      ],
    );
  }
}
