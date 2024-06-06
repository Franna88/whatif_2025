import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/ui/checkBoxStyle.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/ui/closePageButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/ui/nextButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/ui/progressBar.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/ui/whiteContainer.dart';

class ClientCommunication extends StatefulWidget {
  Function closeDialog;
  Function(String) updateIndex;
  ClientCommunication(
      {super.key, required this.closeDialog, required this.updateIndex});

  @override
  State<ClientCommunication> createState() => _ClientCommunicationState();
}

class _ClientCommunicationState extends State<ClientCommunication> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return SizedBox(
      height: heightDevice * 0.75,
      child: WhiteContainer(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 40, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClosePageButton(
                closeDialog: widget.closeDialog,
              ),
              ProgressBar(
                orangeBar: Container(
                  width: 152,
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
                height: 10,
              ),
              Center(
                child: Text(
                  'Client communication &\ninformation',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontFamily: 'ralewaybold',
                      height: 1),
                ),
              ),
              const SizedBox(
                height: 8,
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
              Text(
                'How do you currently connect with potential customers?',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'raleway',
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 300,
                    child: Column(
                      children: [
                        CheckBoxStyle(
                            checkboxValue: false, description: 'Phone Call'),
                        CheckBoxStyle(
                            description: 'Email', checkboxValue: false),
                        CheckBoxStyle(description: 'SMS', checkboxValue: false),
                        CheckBoxStyle(
                            description: 'Online contact form',
                            checkboxValue: false),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Do you offer after hours support or towing services?',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'raleway',
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 200,
                    child: Column(
                      children: [
                        CheckBoxStyle(checkboxValue: false, description: 'Yes'),
                        CheckBoxStyle(checkboxValue: false, description: 'No')
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Would features like Whatsapp integration be valuable to you?',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'raleway',
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 200,
                    child: Column(
                      children: [
                        CheckBoxStyle(checkboxValue: false, description: 'Yes'),
                        CheckBoxStyle(checkboxValue: false, description: 'No')
                      ],
                    ),
                  )
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 5, left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
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
