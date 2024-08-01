import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/AdminContact/AdminContact.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/Documents/Documents.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/Gallery/Gallery.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/RegistrationNumbers/RegistrationNumbers.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/AdminApprovals/Approvals.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/ProfileButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/UIsections/AddMember.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/UIsections/BuisinessDropDown.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/UIsections/BusinessAddress.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/UIsections/BusinessContact.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/UIsections/BusinessDetails.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/UIsections/BusinessMedia.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/UIsections/MoreBusinessInfo.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/UIsections/ServiceHours.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/BusinessProfile/BusinessProfile.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/BusinessProfile/BusinessProfileItem.dart';
import 'package:webdirectories/myutility.dart';

import 'Pages/AdminBusinessSetup/adminBusinessSetup.dart';

class AdminProfile extends StatefulWidget {
  const AdminProfile({Key? key}) : super(key: key);

  @override
  State<AdminProfile> createState() => _AdminProfileState();
}

class _AdminProfileState extends State<AdminProfile> {
  final TextEditingController _textController = TextEditingController();
  String selectedButton = 'BUSINESS INFO';
  var pageIndex = 0;

  updateIndex(index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var pages = [
      AdminusinessSetup(),
      RegistrationNumbers(),
      Documents(),
      AdminContact(),
      Approvals(),
      Gallery()
    ];
    return SingleChildScrollView(
      child: Container(
        width: MyUtility(context).width,
        decoration: BoxDecoration(color: Color(0xFFF4F4F4)),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Column(
            children: [
              Row(
                children: [
                  ProfileButton(
                    text: 'BUSINESS INFO',
                    isSelected: selectedButton == 'BUSINESS INFO',
                    onPressed: () {
                      setState(() {
                        selectedButton = 'BUSINESS INFO';
                        updateIndex(0);
                      });
                    },
                  ),
                  ProfileButton(
                    text: 'REGISTRATION NUMBERS',
                    isSelected: selectedButton == 'REGISTRATION NUMBERS',
                    onPressed: () {
                      setState(() {
                        selectedButton = 'REGISTRATION NUMBERS';
                        updateIndex(1);
                      });
                    },
                  ),
                  ProfileButton(
                    text: 'DOCUMENTS',
                    isSelected: selectedButton == 'DOCUMENTS',
                    onPressed: () {
                      setState(() {
                        selectedButton = 'DOCUMENTS';
                        updateIndex(2);
                      });
                    },
                  ),
                  ProfileButton(
                    text: 'CONTACTS',
                    isSelected: selectedButton == 'CONTACTS',
                    onPressed: () {
                      setState(() {
                        selectedButton = 'CONTACTS';
                        updateIndex(3);
                      });
                    },
                  ),
                  ProfileButton(
                    text: 'APPROVALS',
                    isSelected: selectedButton == 'APPROVALS',
                    onPressed: () {
                      setState(() {
                        selectedButton = 'APPROVALS';
                        updateIndex(4);
                      });
                    },
                  ),
                  ProfileButton(
                    text: 'GALLERY',
                    isSelected: selectedButton == 'GALLERY',
                    onPressed: () {
                      setState(() {
                        selectedButton = 'GALLERY';
                        updateIndex(5);
                      });
                    },
                  ),
                ],
              ),
              Center(
                child: pages[pageIndex],
              )
            ],
          ),
        ),
      ),
    );
  }
}
