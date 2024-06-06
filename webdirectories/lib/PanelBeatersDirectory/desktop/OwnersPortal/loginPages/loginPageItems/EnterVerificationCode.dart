import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/blackIconButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/oTPWidget.dart';

class EnterVerificationCode extends StatefulWidget {
  Function changePageIndex;
  EnterVerificationCode({super.key, required this.changePageIndex});

  @override
  State<EnterVerificationCode> createState() => _EnterVerificationCodeState();
}

class _EnterVerificationCodeState extends State<EnterVerificationCode> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: heightDevice / 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: ShapeDecoration(
                    shape: OvalBorder(
                      side: BorderSide(width: 0.94, color: Colors.white),
                    ),
                  ),
                ),
                Positioned(
                  left: 4,
                  top: 5,
                  child: Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Go Back',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'raleway',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              width: widthDevice / 18,
            ),
            Text(
              'Already have an account?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'raleway',
                fontWeight: FontWeight.w400,
              ),
            ),
            TextButton(
              onPressed: () {
                //ADD LOGIC HERE
              },
              child: Text(
                'Log in',
                style: TextStyle(
                  color: Color(0xFFEF9040),
                  fontSize: 14,
                  fontFamily: 'raleway',
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                  decorationColor: Color(0xFFEF9040),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: heightDevice / 18,
        ),
        Text(
          'Enter Verification Code',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontFamily: 'ralewaybold',
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'To ensure the security of our platform and provide the \nbest experience for all users, we require account \nverification. A verification email has been sent to',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'raleway',
            fontWeight: FontWeight.w400,
            height: 1,
          ),
        ),
        TextButton(
          onPressed: () {
            //ADD LOGIC HERE
          },
          child: Text(
            'admin@actionpanel.co.za',
            style: TextStyle(
                color: Color(0xFFEF9040),
                fontSize: 18,
                fontFamily: 'raleway',
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
                decorationColor: Color(0xFFEF9040),
                height: 1),
          ),
        ),
        SizedBox(
          height: heightDevice / 20,
        ),
        OTPWidget(),
        SizedBox(
          height: 20,
        ),
        BlackIconButton(
            backgroundColor1: Colors.black,
            circleColor1: Colors.green,
            iconColor1: Colors.white,
            text1: 'Successful Authentification',
            textColor1: Colors.white,
            icon: Icons.check,
            onPress: () {
              widget.changePageIndex();
            }),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Didn\'t receive an email?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'raleway',
                fontWeight: FontWeight.w400,
              ),
            ),
            TextButton(
              onPressed: () {
                //ADD LOGIC HERE
              },
              child: Text(
                'Send OTP to phone',
                style: TextStyle(
                  color: Color(0xFFEF9040),
                  fontSize: 14,
                  fontFamily: 'raleway',
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                  decorationColor: Color(0xFFEF9040),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: heightDevice / 50,
        ),
      ],
    );
  }
}
