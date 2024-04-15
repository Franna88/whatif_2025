import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/myutility.dart';

class GetinTouchMobile extends StatefulWidget {
  const GetinTouchMobile({super.key});

  @override
  State<GetinTouchMobile> createState() => _GetinTouchMobileState();
}

class _GetinTouchMobileState extends State<GetinTouchMobile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Get in touch',
          style: TextStyle(
              fontSize: 46,
              fontFamily: 'ralewaysemi',
              color: Color(0xFF0E1013)),
        ),
        SizedBox(
          width: MyUtility(context).width / 1.2,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text:
                      "Have questions about our directories or your profile? We're here to help! Reach out to our team via email at ",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'raleway',
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: "info@webdirectories.co.za",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'ralewaysemi',
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text:
                      " or fill out the contact form. We look forward to connecting with you!",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'raleway',
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: MyUtility(context).width / 1.2,
          height: MyUtility(context).height * 0.15,
          child: Row(
            children: [
              SizedBox(
                  width: 60,
                  height: 60,
                  child: SvgPicture.asset('images/buisnesshours.svg')),
              SizedBox(
                width: MyUtility(context).width * 0.01,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Business Hours",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'ralewaysemi',
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Mon-Fri | 08:00AM – 16:00PM\nSat-Sun & Public Holidays | Closed",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'raleway',
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: MyUtility(context).width / 1.2,
          height: MyUtility(context).height * 0.12,
          child: Row(
            children: [
              SizedBox(
                  width: 60,
                  height: 60,
                  child: SvgPicture.asset('images/contactus.svg')),
              SizedBox(
                width: MyUtility(context).width * 0.015,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Contact Us",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'ralewaysemi',
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "(+27) 12 403 1020\n(+27) 12 346 4690\ninfo@webdirectories.co.za",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'raleway',
                      color: Colors.black,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          width: MyUtility(context).width / 1.2,
          height: MyUtility(context).height * 0.11,
          child: Row(
            children: [
              SizedBox(
                  width: 60,
                  height: 60,
                  child: SvgPicture.asset('images/buisnesshours.svg')),
              SizedBox(
                width: MyUtility(context).width * 0.015,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Address",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'ralewaysemi',
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Open Google Maps",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'raleway',
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
