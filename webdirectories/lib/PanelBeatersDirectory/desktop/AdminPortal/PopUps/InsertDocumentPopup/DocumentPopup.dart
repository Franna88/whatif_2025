import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/AttachmentPopupButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpTextField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpsButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopupCheckBox.dart';
import 'package:webdirectories/myutility.dart';

class DocumentPopup extends StatefulWidget {
  const DocumentPopup({super.key});

  @override
  State<DocumentPopup> createState() => _DocumentPopupState();
}

class _DocumentPopupState extends State<DocumentPopup> {
  bool displayOnBusinessProfile = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MyUtility(context).width * 0.3,
        height: MyUtility(context).height * 0.85,
        decoration: ShapeDecoration(
          color: Color(0xFF0F253A),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 5,
              // Correct property name is strokeSide
              // strokeAlign: BorderSide.strokeAlignOutside,
              color: Color(0xFFEF9040),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Insert Document',
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
              PopUpTextField(text: 'Category'),
              PopUpTextField(text: 'Sub Category'),
              PopUpTextField(text: 'Title'),
              PopUpTextField(text: 'Expiry Date'),
              PopUpTextField(text: 'Expiry Date'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Notification Email',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.32,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          PopupCheckBox(
                            value: displayOnBusinessProfile,
                            onChanged: (newValue) {
                              setState(() {
                                displayOnBusinessProfile = newValue;
                              });
                            },
                            text: 'Yes',
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          PopupCheckBox(
                            value: !displayOnBusinessProfile,
                            onChanged: (newValue) {
                              setState(() {
                                displayOnBusinessProfile = !newValue;
                              });
                            },
                            text: 'No',
                          ),
                        ],
                      ),
                    ],
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: AttachmentPopupButton(
                          text: 'Attach File', onTap: () {}))
                ],
              ),
              PopUpsButton(text: 'Save', onTap: () {})
            ],
          ),
        ),
      ),
    );
  }
}
