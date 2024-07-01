import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpTextField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpsButton.dart';
import 'package:webdirectories/myutility.dart';

class NewUserPopup extends StatefulWidget {
  const NewUserPopup({super.key});

  @override
  State<NewUserPopup> createState() => _NewUserPopupState();
}

class _NewUserPopupState extends State<NewUserPopup> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MyUtility(context).width * 0.295,
        height: MyUtility(context).height * 0.6,
        decoration: ShapeDecoration(
          color: Color(0xFF0F253A),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 3,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: Color(0xFFEF9040),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Request new User',
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
              PopUpTextField(text: 'Full Name'),
              PopUpTextField(text: 'Email'),
              PopUpTextField(text: 'Mobile Phone'),
              PopUpsButton(
                text: 'Send',
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
