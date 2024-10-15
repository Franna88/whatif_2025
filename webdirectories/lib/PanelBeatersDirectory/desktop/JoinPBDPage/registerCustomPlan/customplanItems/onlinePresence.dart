import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/ui/checkBoxStyle.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/ui/closePageButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/ui/goBackButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/ui/nextButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/ui/progressBar.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/ui/whiteContainer.dart';

class OnlinePresence extends StatefulWidget {
  Function closeDialog;
  Function(String) updateIndex;
  OnlinePresence(
      {super.key, required this.closeDialog, required this.updateIndex});

  @override
  State<OnlinePresence> createState() => _ClientCommunicationState();
}

class _ClientCommunicationState extends State<OnlinePresence> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return SizedBox(
      // height: heightDevice * 0.75,
      child: WhiteContainer(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClosePageButton(
                closeDialog: widget.closeDialog,
              ),
              ProgressBar(
                orangeBar: Container(
                  width: 225,
                  height: 12,
                  decoration: ShapeDecoration(
                    color: Color(0xFFEF9040),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(72.36),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Text(
                  'Online Presence',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontFamily: 'ralewaybold',
                      height: 1),
                ),
              ),
              Center(
                child: Text(
                  'Please select all that apply',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.699999988079071),
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'raleway',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Would it be beneficial to your business if customers could navigate to your premises via Google Maps?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'raleway',
                      ),
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        SizedBox(
                          width: 300,
                          child: Column(
                            children: [
                              CheckBoxStyle(
                                  checkboxValue: false, description: 'Yes'),
                              CheckBoxStyle(
                                  checkboxValue: false, description: 'No')
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Do you have a website or social media presence you\'d like to link to?',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'raleway',
                          ),
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 50,
                            ),
                            SizedBox(
                              width: 200,
                              child: Column(
                                children: [
                                  CheckBoxStyle(
                                      checkboxValue: false, description: 'Yes'),
                                  CheckBoxStyle(
                                      checkboxValue: false, description: 'No')
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Are you interested in showcasing positive client reviews, ratings and feedback on your profile?',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'raleway',
                          ),
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 50,
                            ),
                            SizedBox(
                              width: 200,
                              child: Column(
                                children: [
                                  CheckBoxStyle(
                                      checkboxValue: false, description: 'Yes'),
                                  CheckBoxStyle(
                                      checkboxValue: false, description: 'No')
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 10),
                child: Row(
                  children: [
                    GoBackButton(),
                    Spacer(),
                    NextButton(
                        onPressed: () {
                          widget.updateIndex("+");
                        },
                        buttonText: 'Next')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
