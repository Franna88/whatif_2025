import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/ProfileImage.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/TextField/ProfileTextField.dart';
import 'package:webdirectories/myutility.dart';

class BusinessDetails extends StatefulWidget {
  const BusinessDetails({super.key});

  @override
  State<BusinessDetails> createState() => _BusinessDetailsState();
}

class _BusinessDetailsState extends State<BusinessDetails> {
  final TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MyUtility(context).height * 0.075,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: MyUtility(context).width * 0.125,
              child: Column(
                children: [
                  ProfileImage(
                    imageText: 'Display Image',
                  )
                ],
              ),
            ),
            Column(
              children: [
                ProfileTextField(
                    controller: _textController, headline: 'Trading Name'),
                ProfileTextField(
                    controller: _textController,
                    headline: 'Registered Business name'),
              ],
            ),
            Column(
              children: [
                ProfileTextField(
                    controller: _textController, headline: 'B-BBEE Level'),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Container(
                width: MyUtility(context).width * 0.61,
                height: 1,
                decoration: BoxDecoration(color: Color(0xFF0F253A)),
              ),
            )
          ],
        ),
      ],
    );
  }
}
