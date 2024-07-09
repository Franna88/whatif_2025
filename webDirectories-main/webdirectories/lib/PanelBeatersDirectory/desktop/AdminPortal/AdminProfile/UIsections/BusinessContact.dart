import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/TextField/ProfileShortTextField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/TextField/ProfileTextField.dart';
import 'package:webdirectories/myutility.dart';

class BusinessContact extends StatefulWidget {
  const BusinessContact({super.key});

  @override
  State<BusinessContact> createState() => _BusinessContactState();
}

class _BusinessContactState extends State<BusinessContact> {
  final TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  ProfileTextField(
                      controller: _textController,
                      headline: 'Customer Care Number'),
                  ProfileTextField(
                      controller: _textController, headline: 'WhatsApp Number '),
                ],
              ),
              Column(
                children: [
                  ProfileTextField(
                      controller: _textController,
                      headline: 'Business Alternative Number'),
                  ProfileTextField(
                      controller: _textController,
                      headline: 'Business Fax Number'),
                ],
              ),
              ProfileShortTextField(
                  controller: _textController, headline: 'After hours Number'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: MyUtility(context).width ,
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
