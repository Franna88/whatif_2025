import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/greyTable.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/longOrangeButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/numberProgressBar.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/orangeCheckMark.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/progressBarNumbers.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/radioButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/smallScreenRadioButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/whiteBallpointText.dart';

enum MembershipValues { onceOffM, onceOffA }

class MembershipOptions extends StatefulWidget {
  Function changePageIndex;
  MembershipOptions({super.key, required this.changePageIndex});

  @override
  State<MembershipOptions> createState() => _MembershipOptionsState();
}

class _MembershipOptionsState extends State<MembershipOptions> {
  MembershipValues? _radioValue = MembershipValues.onceOffM;

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
          color1: const Color.fromARGB(199, 226, 131, 43),
          number2: OrangeCheckMark(),
          color2: const Color.fromARGB(199, 226, 131, 43),
          number3: ProgressBarNumbers(number: '03'),
          color3: const Color.fromARGB(255, 114, 113, 113),
          number4: ProgressBarNumbers(number: '04'),
          color4: const Color.fromARGB(255, 114, 113, 113),
          number5: ProgressBarNumbers(number: '05'),
        ),
        SizedBox(
          height: widthDevice < 1500 ? 10 : 25,
        ),
        Text('Membership Options',
            textAlign: TextAlign.center,
            style: widthDevice < 1500
                ? TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: 'ralewaybold',
                  )
                : TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontFamily: 'ralewaybold',
                  )),
        SizedBox(
          height: 10,
        ),
        Text(
            'Choose your membership option.\nYou can change this at any time in the future.',
            textAlign: TextAlign.center,
            style: widthDevice < 1500
                ? TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'raleway',
                    height: 1,
                  )
                : TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'raleway',
                    height: 1,
                  )),
        SizedBox(
          height: widthDevice < 1500 ? 20 : 30,
        ),

        //ROW 1

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GreyTable(
              width: widthDevice < 1500 ? 175 : 200,
              child: Text(
                'Options',
                textAlign: TextAlign.start,
                style: widthDevice < 1500
                    ? TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'raleway',
                        height: 1,
                      )
                    : TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'raleway',
                        height: 1,
                      ),
              ),
            ),
            GreyTable(
              width: widthDevice < 1500 ? 105 : 125,
              child: Text(
                'Monthly',
                textAlign: TextAlign.start,
                style: widthDevice < 1500
                    ? TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'raleway',
                        height: 1,
                      )
                    : TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'raleway',
                        height: 1,
                      ),
              ),
            ),
            GreyTable(
              width: widthDevice < 1500 ? 105 : 125,
              child: Text(
                'Annual',
                textAlign: TextAlign.start,
                style: widthDevice < 1500
                    ? TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'raleway',
                        height: 1,
                      )
                    : TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'raleway',
                        height: 1,
                      ),
              ),
            ),
          ],
        ),

        //ROW 2

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GreyTable(
              width: widthDevice < 1500 ? 175 : 200,
              child: Text(
                'Once Off Activation Fee',
                textAlign: TextAlign.start,
                style: widthDevice < 1500
                    ? TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'raleway',
                        height: 1,
                      )
                    : TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'raleway',
                        height: 1,
                      ),
              ),
            ),
            GreyTable(
              width: widthDevice < 1500 ? 105 : 125,
              child: widthDevice < 1500
                  ? SmallScreenRadioButton(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            _radioValue = value;
                          },
                        );
                      },
                      text: 'R299',
                      value: MembershipValues.onceOffM)
                  : RadioButton(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            _radioValue = value;
                          },
                        );
                      },
                      text: 'R299',
                      value: MembershipValues.onceOffM),
            ),
            GreyTable(
              width: widthDevice < 1500 ? 105 : 125,
              child: widthDevice < 1500
                  ? SmallScreenRadioButton(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            _radioValue = value;
                          },
                        );
                      },
                      text: 'R299',
                      value: MembershipValues.onceOffA)
                  : RadioButton(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            _radioValue = value;
                          },
                        );
                      },
                      text: 'R299',
                      value: MembershipValues.onceOffA),
            ),
          ],
        ),

        //ROW 3
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GreyTable(
              width: widthDevice < 1500 ? 175 : 200,
              child: Text(
                'Starter',
                textAlign: TextAlign.start,
                style: widthDevice < 1500
                    ? TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'raleway',
                        height: 1,
                      )
                    : TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'raleway',
                        height: 1,
                      ),
              ),
            ),
            GreyTable(
              width: widthDevice < 1500 ? 105 : 125,
              child: widthDevice < 1500
                  ? SmallScreenRadioButton(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            _radioValue = value;
                          },
                        );
                      },
                      text: 'Free',
                      value: MembershipValues.onceOffM)
                  : RadioButton(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            _radioValue = value;
                          },
                        );
                      },
                      text: 'Free',
                      value: MembershipValues.onceOffM),
            ),
            GreyTable(
              width: widthDevice < 1500 ? 105 : 125,
              child: widthDevice < 1500
                  ? SmallScreenRadioButton(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            _radioValue = value;
                          },
                        );
                      },
                      text: 'Free',
                      value: MembershipValues.onceOffA)
                  : RadioButton(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            _radioValue = value;
                          },
                        );
                      },
                      text: 'Free',
                      value: MembershipValues.onceOffA),
            ),
          ],
        ),

        //ROW 4

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GreyTable(
              width: widthDevice < 1500 ? 175 : 200,
              child: Text(
                'Core',
                textAlign: TextAlign.start,
                style: widthDevice < 1500
                    ? TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'raleway',
                        height: 1,
                      )
                    : TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'raleway',
                        height: 1,
                      ),
              ),
            ),
            GreyTable(
              width: widthDevice < 1500 ? 105 : 125,
              child: widthDevice < 1500
                  ? SmallScreenRadioButton(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            _radioValue = value;
                          },
                        );
                      },
                      text: 'R 99',
                      value: MembershipValues.onceOffM)
                  : RadioButton(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            _radioValue = value;
                          },
                        );
                      },
                      text: 'R 99',
                      value: MembershipValues.onceOffM),
            ),
            GreyTable(
              width: widthDevice < 1500 ? 105 : 125,
              child: widthDevice < 1500
                  ? SmallScreenRadioButton(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            _radioValue = value;
                          },
                        );
                      },
                      text: 'R 1 188',
                      value: MembershipValues.onceOffA)
                  : RadioButton(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            _radioValue = value;
                          },
                        );
                      },
                      text: 'R 1 188',
                      value: MembershipValues.onceOffA),
            ),
          ],
        ),
        // ROW 5

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GreyTable(
              width: widthDevice < 1500 ? 175 : 200,
              child: Text(
                'Premium',
                textAlign: TextAlign.start,
                style: widthDevice < 1500
                    ? TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'raleway',
                        height: 1,
                      )
                    : TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'raleway',
                        height: 1,
                      ),
              ),
            ),
            GreyTable(
              width: widthDevice < 1500 ? 105 : 125,
              child: widthDevice < 1500
                  ? SmallScreenRadioButton(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            _radioValue = value;
                          },
                        );
                      },
                      text: 'R 434',
                      value: MembershipValues.onceOffM)
                  : RadioButton(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            _radioValue = value;
                          },
                        );
                      },
                      text: 'R 434',
                      value: MembershipValues.onceOffM),
            ),
            GreyTable(
              width: widthDevice < 1500 ? 105 : 125,
              child: widthDevice < 1500
                  ? SmallScreenRadioButton(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            _radioValue = value;
                          },
                        );
                      },
                      text: 'R 4 948',
                      value: MembershipValues.onceOffA)
                  : RadioButton(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            _radioValue = value;
                          },
                        );
                      },
                      text: 'R 4 948',
                      value: MembershipValues.onceOffA),
            ),
          ],
        ),
        //Row 6

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GreyTable(
              width: widthDevice < 1500 ? 175 : 200,
              child: Text(
                'Premium +',
                textAlign: TextAlign.start,
                style: widthDevice < 1500
                    ? TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'raleway',
                        height: 1,
                      )
                    : TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'raleway',
                        height: 1,
                      ),
              ),
            ),
            GreyTable(
              width: widthDevice < 1500 ? 105 : 125,
              child: widthDevice < 1500
                  ? SmallScreenRadioButton(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            _radioValue = value;
                          },
                        );
                      },
                      text: 'R 520',
                      value: MembershipValues.onceOffM)
                  : RadioButton(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            _radioValue = value;
                          },
                        );
                      },
                      text: 'R 520',
                      value: MembershipValues.onceOffM),
            ),
            GreyTable(
              width: widthDevice < 1500 ? 105 : 125,
              child: widthDevice < 1500
                  ? SmallScreenRadioButton(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            _radioValue = value;
                          },
                        );
                      },
                      text: 'R 5 921',
                      value: MembershipValues.onceOffA)
                  : RadioButton(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            _radioValue = value;
                          },
                        );
                      },
                      text: 'R 5 921',
                      value: MembershipValues.onceOffA),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          width: widthDevice < 1500 ? widthDevice * 0.30 : widthDevice * 0.24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WhiteBallpointText(ballText: 'Prices exclude VAT'),
              WhiteBallpointText(ballText: 'Single fee - No hidden extras'),
              WhiteBallpointText(
                  ballText: 'Calendar month cancellation notice'),
              WhiteBallpointText(
                  ballText:
                      'Monthly on advance via Debit Order to limit costs'),
            ],
          ),
        ),
        SizedBox(
          height: widthDevice < 1500 ? 15 : 30,
        ),
        LongOrangeButton(
            onPressed: () {
              widget.changePageIndex();
            },
            buttonText: 'Continue'),
        SizedBox(
          height: widthDevice < 1500 ?   25: 35,
        ),
      ],
    );
  }
}
