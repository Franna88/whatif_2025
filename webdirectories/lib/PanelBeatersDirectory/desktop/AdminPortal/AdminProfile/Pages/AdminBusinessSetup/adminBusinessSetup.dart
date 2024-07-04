import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/UIsections/AddMember.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/UIsections/BuisinessDropDown.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/UIsections/BusinessAddress.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/UIsections/BusinessContact.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/UIsections/BusinessDetails.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/UIsections/BusinessMedia.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/UIsections/MoreBusinessInfo.dart';
import 'package:webdirectories/myutility.dart';

import '../../UIsections/ServiceHours.dart';

class AdminusinessSetup extends StatefulWidget {
  const AdminusinessSetup({super.key});

  @override
  State<AdminusinessSetup> createState() => _AdminusinessSetupState();
}

class _AdminusinessSetupState extends State<AdminusinessSetup> {
  final TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BusinessDetails(),
        BusinessAddress(),
        BusinessContact(),
        BusinessDropDown(),
        MoreBusinessInfo(controller: _textController),
        Container(
          height: MyUtility(context).height * 0.6,
          child: AddMember(),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'More Info',
                  style: TextStyle(
                    color: Color(0xFF0F253A),
                    fontSize: 20.4,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 1,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: MyUtility(context).width * 0.755,
              height: MyUtility(context).height * 0.17,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  controller: _textController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Inter',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ServiceHours(),
                  Businessmedia(),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 100,
        ),
      ],
    );
  }
}
