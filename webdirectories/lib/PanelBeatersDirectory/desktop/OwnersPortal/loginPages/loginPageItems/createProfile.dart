import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/longOrangeButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/numberProgressBar.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/orangeCheckMark.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/passwordTextField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/progressBarNumbers.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/smallCheckBox.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/smallTextBox.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/whiteBallpointText.dart';

class CreateProfile extends StatelessWidget {
  Function changePageIndex;
  CreateProfile({super.key, required this.changePageIndex});

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
          'Create Profile',
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
          'Choose a strong password and username for your \naccount. This will allow you to access \nyour Owner\'s Portal later.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'raleway',
            fontWeight: FontWeight.w400,
            height: 1,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SmallTextBox(hintText: 'Name', keyText: 'Username'),
            SizedBox(
              width: 230,
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PasswordField(
                hintText: 'Password', keyText: 'Password', widthContainer: 215),
            SizedBox(
              width: 20,
            ),
            PasswordField(
                hintText: 'Password',
                keyText: 'Confirm Password',
                widthContainer: 215),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        SizedBox(
          width: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your password needs to have:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'raleway',
                  fontWeight: FontWeight.w400,
                  height: 1,
                ),
              ),
              WhiteBallpointText(ballText: 'At least 1 uppercase character'),
              WhiteBallpointText(ballText: 'At least 1 lowercase character'),
              WhiteBallpointText(ballText: 'At least 1 special character'),
              WhiteBallpointText(ballText: 'At least 8 characters'),
              WhiteBallpointText(ballText: 'At least 1 number'),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SmallCheckBox(description: 'Remember me', checkboxValue: false),
            SizedBox(
              width: 120,
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        LongOrangeButton(
            onPressed: () {
              changePageIndex();
            },
            buttonText: 'Continue'),
        SizedBox(
          height: heightDevice / 30,
        ),
      ],
    );
  }
}
