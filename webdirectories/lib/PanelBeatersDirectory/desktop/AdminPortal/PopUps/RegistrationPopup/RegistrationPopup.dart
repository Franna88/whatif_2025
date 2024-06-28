import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpTextField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpsButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopupCheckBox.dart';
import 'package:webdirectories/myutility.dart';

class RegistrationPopup extends StatefulWidget {
  const RegistrationPopup({super.key});

  @override
  State<RegistrationPopup> createState() => _RegistrationPopupState();
}

class _RegistrationPopupState extends State<RegistrationPopup> {
  bool displayOnBusinessProfile = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MyUtility(context).width * 0.3,
        height: MyUtility(context).height * 0.5,
        decoration: ShapeDecoration(
          color: Color(0xFF0F253A),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 5,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: Color(0xFFEF9040),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Insert Registration',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21.76,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  CloseButton(),
                ],
              ),
              PopUpTextField(text: 'Registration Type'),
              PopUpTextField(text: 'Registration Number'),
              PopupCheckBox(
                value: displayOnBusinessProfile,
                onChanged: (newValue) {
                  setState(() {
                    displayOnBusinessProfile = newValue;
                  });
                },
                text: 'Display on Business Profile',
              ),
              PopUpsButton(text: 'Save', onTap: () {})
            ],
          ),
        ),
      ),
    );
  }
}
