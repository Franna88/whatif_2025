import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/ProfileImage.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/TextField/LongTextField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/TextField/ProfileShortTextField.dart';
import 'package:webdirectories/myutility.dart';

class BusinessAddress extends StatefulWidget {
  const BusinessAddress({super.key});

  @override
  State<BusinessAddress> createState() => _BusinessAddressState();
}

class _BusinessAddressState extends State<BusinessAddress> {
  final TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: MyUtility(context).width * 0.13,
              child: Column(
                children: [
                  ProfileImage(
                    imageText: 'Logo',
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: MyUtility(context).width * 0.58,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProfileShortTextField(
                          controller: _textController, headline: 'Country'),
                      ProfileShortTextField(
                          controller: _textController, headline: 'Province'),
                      ProfileShortTextField(
                          controller: _textController, headline: 'City'),
                    ],
                  ),
                ),
                SizedBox(
                  width: MyUtility(context).width * 0.58,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProfileShortTextField(
                          controller: _textController, headline: 'Suburb'),
                      LongTextField(
                          controller: _textController,
                          headline: 'Street Address')
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: MyUtility(context).width * 0.61,
                height: 1,
                decoration: BoxDecoration(color: Color(0xFF0F253A)),
              )
            ],
          ),
        )
      ],
    );
  }
}
