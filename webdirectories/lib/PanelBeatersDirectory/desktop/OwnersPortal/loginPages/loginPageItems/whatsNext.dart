import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/longOrangeButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/numberProgressBar.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/orangeCheckMark.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/progressBarNumbers.dart';

class WhatsNext extends StatelessWidget {
  const WhatsNext({super.key});

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
          number1: OrangeCheckMark(),
          color1: Color.fromARGB(199, 226, 131, 43),
          number2: OrangeCheckMark(),
          color2: const Color.fromARGB(199, 226, 131, 43),
          number3: OrangeCheckMark(),
          color3: const Color.fromARGB(199, 226, 131, 43),
          number4: OrangeCheckMark(),
          color4: const Color.fromARGB(199, 226, 131, 43),
          number5: ProgressBarNumbers(number: '05'),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'What\'s next?',
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
        Container(
          height: widthDevice < 1500 ? 190 : 225,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/watsnext.png'),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          'Thank you for choosing to be part of the Panel \nBeater Directory family! Your success is our \nsuccess and we can’t wait to grow with you.',
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
          height: 15,
        ),
        Text(
          'Your application is now being processed and you \nwill receive an email confirmation with your \nOwners Portal login code shortly.',
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
          height: heightDevice / 20,
        ),
        LongOrangeButton(
            onPressed: () {
              //ADD LOGIC HERE
            },
            buttonText: 'Login to Owners Portal'),
        SizedBox(
          height: heightDevice / 30,
        ),
      ],
    );
  }
}
