import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/longOrangeButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/mediumTextBox.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/numberProgressBar.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/progressBarNumbers.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/smallCheckBox.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/smallTextBox.dart';
import 'package:webdirectories/WebDirectories/Page2/Page2.dart';

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
          height: heightDevice < 710 ? 5 : 10,
        ),
        heightDevice < 710 ? Text(
          'Register your Business!',
          textAlign: TextAlign.center,
          style:TextStyle(
            color: Colors.white,
            fontSize:  25,
            fontFamily: 'ralewaybold',
          ) 
        ):
        Text(
          'Register your Business!',
          textAlign: TextAlign.center,
          style:TextStyle(
            color: Colors.white,
            fontSize:  widthDevice < 1500 ?  30 : 40,
            fontFamily: 'ralewaybold',
          ) 
        ),
        SizedBox(
          height: heightDevice < 710 ? 5 : 10,
        ),
        heightDevice < 710 ? 
        Text(
          'Join the Panel Beater Directory to connect with new \ncustomers and showcase your expertise to drivers in need.',
          textAlign: TextAlign.center,
          style:  TextStyle(
            color: Colors.white,
            fontSize: 12 ,
            fontFamily: 'raleway',
            
            height: 1.3,
          ) 
        ):
        Text(
          'Join the Panel Beater Directory to connect with new \ncustomers and showcase your expertise to drivers in need.',
          textAlign: TextAlign.center,
          style:  TextStyle(
            color: Colors.white,
            fontSize: widthDevice < 1500 ? 14 : 18 ,
            fontFamily: 'raleway',
            
            height: 1.3,
          ) 
        ),
        SizedBox(
          height: heightDevice < 710 ? 5 : 20,
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
          height: heightDevice < 710 ? 0 : 20,
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
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              SmallCheckBox(
                  description: 'By creating an account, you agree to our',
                  checkboxValue: false),
              
              TextButton(
                
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Material(
                            child: Page2(),
                          )));
                  //ADD LOGIC HERE
                },
                child: Padding(
                  padding:  EdgeInsets.only(top: widthDevice < 1500 ?   0 : 16, left: 0),
                  child: Text(
                    'Terms & Conditions',
                    style: widthDevice < 1500 ?  TextStyle(
                      color: Color(0xFFEF9040),
                      fontSize: 11,
                      fontFamily: 'raleway',
                      fontWeight: FontWeight.w500,
                      
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFFEF9040),
                      //height: -3
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
          height: heightDevice < 710 ? 10 : heightDevice / 30,
        ),
      ],
    );
  }
}
