import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/dividers.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/longOrangeButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/mediumTextBox.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/passwordTextField.dart';

class OwnersPortalLogin extends StatelessWidget {
  Function changePageIndex;
  OwnersPortalLogin({super.key, required this.changePageIndex});

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: heightDevice / 25,
        ),
        Text(
          'Owners Portal Login',
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
        MediumTextBox(
          keyText: 'Email',
          hintText: 'e.g.,admin@actionpanel.co.za',
        ),
        SizedBox(
          height: 10,
        ),
        PasswordField(
          hintText: 'Enter Password',
          keyText: 'Password',
          widthContainer: 450,
        ),
        SizedBox(
          height: 10,
        ),
        TextButton(
          onPressed: () {
            //ADD LOGIC HERE
          },
          child: SizedBox(
            width: 450,
            child: Text(
              'Forgot Password ?',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color(0xFFEF9040),
                fontSize: 16,
                fontFamily: 'ralewaymedium',
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        LongOrangeButton(
            onPressed: () {
              //ADD LOGIC HERE
            },
            buttonText: 'Login'),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Dividers(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                'or',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'raleway',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Dividers()
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/googleicon.png'))),
            ),
            Text(
              'Sign in with Google',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'raleway',
                fontWeight: FontWeight.w400,
                //height: 0.05,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                changePageIndex();
              },
              child: Text(
                'Not Registered Yet? ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'raleway',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                changePageIndex();
              },
              child: Text(
                'Click here',
                style: TextStyle(
                  color: Color(0xFFEF9040),
                  fontSize: 16,
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
          height: heightDevice / 25,
        ),
      ],
    );
  }
}
