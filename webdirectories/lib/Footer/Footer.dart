import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/Footer/FooterComponents/FooterTextButton.dart';
import 'package:webdirectories/myutility.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  // Text controllers
  final email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MyUtility(context).height * 0.45,
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                child: SizedBox(
                  width: MyUtility(context).width / 3.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'images/logo.png',
                        height: MyUtility(context).height * 0.12,
                        width: MyUtility(context).width * 0.15,
                      ),
                      SizedBox(
                        height: MyUtility(context).height * 0.01,
                      ),
                      Text(
                        'Our passionate team guides users towards informed choices through user-friendly interfaces, clear data sources, and innovative tools.',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'raleway',
                            color: Colors.white),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: MyUtility(context).width * 0.1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MyUtility(context).height * 0.025,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Pages',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'ralewaybold',
                            color: Colors.white),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    FooterTextButton(text: 'Home', onpress: () {}),
                    FooterTextButton(text: 'Our Story', onpress: () {}),
                    FooterTextButton(text: 'Watif', onpress: () {}),
                    FooterTextButton(text: 'Articles', onpress: () {}),
                    FooterTextButton(text: 'Contact Us', onpress: () {}),
                    FooterTextButton(text: 'Disclaimer', onpress: () {}),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Subscribe to Newsletter',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'raleway',
                        color: Colors.white),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: MyUtility(context).height * 0.01,
                  ),
                  SizedBox(
                    width: MyUtility(context).width * 0.2,
                    height: 45,
                    child: TextFormField(
                      controller: email,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        labelText: 'Enter your email here',
                        labelStyle: TextStyle(
                          fontSize: 18,
                          fontFamily: 'raleway',
                          color: Colors.black,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.send),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MyUtility(context).height * 0.025,
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Image.asset(
                          'images/logos_facebook.png',
                          height: 50,
                          width: 50,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Image.asset(
                          'images/Group.png',
                          height: 50,
                          width: 50,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Image.asset(
                          'images/skill-icons_instagram.png',
                          height: 50,
                          width: 50,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: MyUtility(context).height * 0.05,
          ),
          Container(
            width: MyUtility(context).width - 20,
            height: 1,
            color: Colors.white,
          ),
          SizedBox(
            height: MyUtility(context).height * 0.025,
          ),
          SizedBox(
            width: MyUtility(context).width / 1.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'images/CC.svg',
                        width: 14,
                        height: 14,
                      ),
                      Text(
                        ' 2024 Copy ',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'raleway',
                          color: Color(0xFFF4F4F4),
                        ),
                      ),
                      Text(
                        'Web Directoriess',
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'ralewaybold',
                          color: Color(0xFFF4F4F4),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Us',
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'ralewaybold',
                          color: Colors.white),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      '+27 12 403 0120',
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'raleway',
                          color: Color(0xFFF4F4F4)),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Address',
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'ralewaybold',
                          color: Colors.white),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      '63 Bokmakierie Street, Eden, George, 6529',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'raleway',
                        color: Color(0xFFF4F4F4),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
