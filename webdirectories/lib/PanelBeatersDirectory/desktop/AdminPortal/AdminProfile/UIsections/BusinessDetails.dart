import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/ProfileImage.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/TextField/ProfileTextField.dart';
import 'package:webdirectories/myutility.dart';

class BusinessDetails extends StatefulWidget {
  final String imageName;
  final TextEditingController tradingNameController;
  final TextEditingController registeredNameController;
  final TextEditingController bEEElevelController;

  const BusinessDetails(
      {super.key,
      required this.imageName,
      required this.tradingNameController,
      required this.registeredNameController,
      required this.bEEElevelController});

  @override
  State<BusinessDetails> createState() => _BusinessDetailsState();
}

class _BusinessDetailsState extends State<BusinessDetails> {
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
                imageName: widget.imageName,
              ),
              SizedBox(
                width: 25,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ProfileTextField(
                      controller: widget.tradingNameController,
                      headline: 'Trading Name'),
                  ProfileTextField(
                      controller: widget.registeredNameController,
                      headline: 'Registered Business name'),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              ProfileTextField(
                  controller: widget.bEEElevelController,
                  headline: 'B-BBEE Level'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 40, top: 20),
                child: Container(
                  width: widthDevice < 1500
                      ? MyUtility(context).width * 0.64
                      : MyUtility(context).width * 0.71,
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
