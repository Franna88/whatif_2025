import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/longOrangeButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/numberProgressBar.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/orangeCheckMark.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/progressBarNumbers.dart';

class CompleteAgreement extends StatelessWidget {
  Function openAgreementPopup;
  Function changePageIndex;
  CompleteAgreement(
      {super.key,
      required this.openAgreementPopup,
      required this.changePageIndex});

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
          number4: ProgressBarNumbers(number: '04'),
          color4: const Color.fromARGB(255, 114, 113, 113),
          number5: ProgressBarNumbers(number: '05'),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Complete Agreement',
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
          'Please complete the following online application form. \nYour completed contract will be available to view and \ndownload in your Owners Portal.',
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
        Container(
          height: widthDevice < 1500 ? 200 : 225,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/completeagreement.png'),
            ),
          ),
        ),
        SizedBox(
          height: heightDevice / 20,
        ),
        LongOrangeButton(
            onPressed: () {
              changePageIndex();
            },
            buttonText: 'Click here to complete Agreement'),
        SizedBox(
          height: heightDevice / 25,
        ),
      ],
    );
  }
}
