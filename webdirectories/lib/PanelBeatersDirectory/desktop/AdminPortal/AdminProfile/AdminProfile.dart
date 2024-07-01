import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/AdminContact/AdminContact.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/Documents/Documents.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/Gallery/Gallery.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/RegistrationNumbers/RegistrationNumbers.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/ProfileButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/UIsections/AddMember.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/UIsections/BuisinessDropDown.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/UIsections/BusinessAddress.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/UIsections/BusinessContact.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/UIsections/BusinessDetails.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/UIsections/BusinessMedia.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/UIsections/MoreBusinessInfo.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/UIsections/ServiceHours.dart';
import 'package:webdirectories/myutility.dart';

class AdminProfile extends StatefulWidget {
  const AdminProfile({Key? key}) : super(key: key);

  @override
  State<AdminProfile> createState() => _AdminProfileState();
}

class _AdminProfileState extends State<AdminProfile> {
  final TextEditingController _textController = TextEditingController();
  String selectedButton = 'BUSINESS INFO';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                        });
                        _navigateToPage('BUSINESS INFO');
                      },
                    ),
                    ProfileButton(
                      text: 'REGISTRATION NUMBERS',
                      isSelected: selectedButton == 'REGISTRATION NUMBERS',
                      onPressed: () {
                        setState(() {
                          selectedButton = 'REGISTRATION NUMBERS';
                        });
                        _navigateToPage('REGISTRATION NUMBERS');
                      },
                    ),
                    ProfileButton(
                      text: 'DOCUMENTS',
                      isSelected: selectedButton == 'DOCUMENTS',
                      onPressed: () {
                        setState(() {
                          selectedButton = 'DOCUMENTS';
                        });
                        _navigateToPage('DOCUMENTS');
                      },
                    ),
                    ProfileButton(
                      text: 'CONTACTS',
                      isSelected: selectedButton == 'CONTACTS',
                      onPressed: () {
                        setState(() {
                          selectedButton = 'CONTACTS';
                        });
                        _navigateToPage('CONTACTS');
                      },
                    ),
                    ProfileButton(
                      text: 'APPROVALS',
                      isSelected: selectedButton == 'APPROVALS',
                      onPressed: () {
                        setState(() {
                          selectedButton = 'APPROVALS';
                        });
                      },
                    ),
                    ProfileButton(
                      text: 'GALLERY',
                      isSelected: selectedButton == 'GALLERY',
                      onPressed: () {
                        setState(() {
                          selectedButton = 'GALLERY';
                        });
                        _navigateToPage('GALLERY');
                      },
                    ),
                  ],
                ),
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
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
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
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToPage(String page) {
    switch (page) {
      case 'BUSINESS INFO':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AdminProfile()),
        );
        break;
      case 'REGISTRATION NUMBERS':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RegistrationNumbers()),
        );
        break;
      case 'DOCUMENTS':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Documents()),
        );
        break;
      case 'CONTACTS':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AdminContact()),
        );
      case 'GALLERY':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Gallery()),
        );
        break;
    }
  }
}
