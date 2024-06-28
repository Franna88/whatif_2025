import 'package:flutter/material.dart';

class MobileTextFields extends StatelessWidget {
  String keyText;
  String hintText;
  double widthContainer;
  MobileTextFields(
      {super.key,
      required this.hintText,
      required this.keyText,
      required this.widthContainer});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: keyText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.64,
                  fontFamily: 'raleway',

                  //height: 0.06,
                ),
              ),
              TextSpan(
                text: ' *',
                style: TextStyle(
                  color: Color(0xFFEF9040),
                  fontSize: 20,
                  fontFamily: 'raleway',

                  //height: 0.06,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          width: widthContainer,
          height: 45,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.99, color: Color(0xFFEAEBEC)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: TextField(
            cursorColor: Colors.black,
            style: TextStyle(
                color: Colors.black, fontSize: 15.64, fontFamily: 'raleway'),
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.only(top: 13, bottom: 15, left: 20, right: 20),
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(
                color: const Color.fromARGB(255, 124, 124, 124),
                fontSize: 15.64,
                fontFamily: 'raleway',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
