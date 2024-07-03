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
    var widthDevice = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        children: [
          SizedBox(
            height: MyUtility(context).height * 0.075,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ProfileImage(
                imageText: 'Display Image',
              ),
              SizedBox(width: 25,),
              Column(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ProfileTextField(
                      controller: _textController, headline: 'Trading Name'),
                  ProfileTextField(
                      controller: _textController,
                      headline: 'Registered Business name'),
                ],
              ),
              SizedBox(width: 20,),
              ProfileTextField(
                  controller: _textController, headline: 'B-BBEE Level'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 40, top: 20),
                child: Container(
                  width: widthDevice < 1500 ? MyUtility(context).width * 0.64 : MyUtility(context).width * 0.71,
                  height: 1,
                  decoration: BoxDecoration(color: Color(0xFF0F253A)),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
