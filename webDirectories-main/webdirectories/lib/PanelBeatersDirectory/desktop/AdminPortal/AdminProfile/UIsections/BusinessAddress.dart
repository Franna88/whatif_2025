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
    var widthDevice = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Column(mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ProfileImage(
                    imageText: 'Logo',
                  )
                ],
              ),
              SizedBox(width: 25,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ProfileShortTextField(
                          controller: _textController, headline: 'Suburb'),
                      LongTextField(
                          controller: _textController,
                          headline: 'Street Address')
                    ],
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: widthDevice < 1500 ? MyUtility(context).width * 0.64 : MyUtility(context).width * 0.71,
                  height: 1,
                  decoration: BoxDecoration(color: Color(0xFF0F253A)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
