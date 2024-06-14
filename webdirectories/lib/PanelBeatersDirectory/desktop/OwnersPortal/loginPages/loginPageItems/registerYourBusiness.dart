import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/longOrangeButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/mediumTextBox.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/numberProgressBar.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/progressBarNumbers.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/smallCheckBox.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/smallTextBox.dart';

class RegisterYourBusiness extends StatelessWidget {
  Function changePageIndex;
  RegisterYourBusiness({super.key, required this.changePageIndex});

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: heightDevice / 30,
        ),
        NumberProgressBar(
          number1: ProgressBarNumbers(number: '01'),
          color1: const Color.fromARGB(255, 114, 113, 113),
          number2: ProgressBarNumbers(number: '02'),
          color2: const Color.fromARGB(255, 114, 113, 113),
          number3: ProgressBarNumbers(number: '03'),
          color3: const Color.fromARGB(255, 114, 113, 113),
          number4: ProgressBarNumbers(number: '04'),
          color4: const Color.fromARGB(255, 114, 113, 113),
          number5: ProgressBarNumbers(number: '05'),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Register your Business!',
          textAlign: TextAlign.center,
          style: widthDevice < 1500 ? TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontFamily: 'ralewaybold',
          ) : TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontFamily: 'ralewaybold',
          )
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Join the Panel Beater Directory to connect with new \ncustomers and showcase your expertise to drivers in need.',
          textAlign: TextAlign.center,
          style: widthDevice < 1500 ? TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: 'raleway',
            
            height: 1,
          ) : TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'raleway',
            
            height: 1,
          )
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an account? ',
              style: widthDevice < 1500 ? TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontFamily: 'raleway',
                
              ) : TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: 'raleway',
                
              )
            ),
            TextButton(
              onPressed: () {
                //ADD LOGIC HERE
              },
              child: Text(
                'Log in',
                style: widthDevice < 1500 ? TextStyle(
                  color: Color(0xFFEF9040),
                  fontSize: 13,
                  fontFamily: 'raleway',
                  
                  decoration: TextDecoration.underline,
                  decorationColor: Color(0xFFEF9040),
                ) : TextStyle(
                  color: Color(0xFFEF9040),
                  fontSize: 15,
                  fontFamily: 'raleway',
                  
                  decoration: TextDecoration.underline,
                  decorationColor: Color(0xFFEF9040),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SmallTextBox(hintText: 'Name', keyText: 'First Name'),

            SizedBox( 
              width: widthDevice < 1500 ? 23 : 30,
            ),
            SmallTextBox(hintText: 'Surname', keyText: 'Last Name'),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        MediumTextBox(hintText: 'Name', keyText: 'Business Trading Name'),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SmallTextBox(hintText: 'Cell', keyText: 'Phone'),
            SizedBox( 
              width: widthDevice < 1500 ? 23 : 30,
            ),
            SmallTextBox(hintText: 'Email', keyText: 'Email'),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Align(
          alignment: widthDevice < 1500 ?  Alignment.centerLeft : Alignment.center,
          child: Wrap(
            
            children: [
              SmallCheckBox(
                  description: 'By creating an account, you agree to our',
                  checkboxValue: false),
              TextButton(
                
                onPressed: () {
                  //ADD LOGIC HERE
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 14, left: 0),
                  child: Text(
                    'Terms & Conditions',
                    style: widthDevice < 1500 ?  TextStyle(
                      color: Color(0xFFEF9040),
                      fontSize: 11,
                      fontFamily: 'raleway',
                      fontWeight: FontWeight.w500,
                      
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFFEF9040),
                      height: 0.0
                    ): TextStyle(
                      color: Color(0xFFEF9040),
                      fontSize: 14,
                      fontFamily: 'raleway',
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFFEF9040),
                      height: 0.0
                    )
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: widthDevice < 1500 ? 15 : 25,
        ),
        LongOrangeButton(
            onPressed: () {
              changePageIndex();
            },
            buttonText: 'Start Sign Up Process'),
        SizedBox(
          height: heightDevice * 0.05,
        ),
      ],
    );
  }
}
