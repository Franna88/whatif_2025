import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/AdminContact/AdminContact.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/AdminContact/AdminContactComp/AdminContactAlt.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/AdminHoursAlt.dart/AdminHoursAlt.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/Documents/Documents.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/Documents/Documentscomp/DocumentAlt.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/Gallery/Gallery.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/RegistrationNumbers/RegistrationNumbers.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/AdminApprovals/Approvals.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/RegistrationNumbers/RegistrationNumbersComp/RegistrationAlt.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/ProfileButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/UIsections/AddMember.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/UIsections/BuisinessDropDown.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/UIsections/BusinessAddress.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/UIsections/BusinessContact.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/UIsections/BusinessDetails.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/UIsections/BusinessMedia.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/UIsections/MoreBusinessInfo.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/UIsections/ServiceHours.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DashboardContainers/DashProfileView.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/BusinessProfile/BusinessProfile.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/BusinessProfile/BusinessProfileItem.dart';
import 'package:webdirectories/myutility.dart';

import 'AdminMediaLinks.dart/AdminMediaLink.dart';
import 'MoreInfoAlt/MoreInfoAlt.dart';
import 'Pages/AdminBusinessSetup/adminBusinessSetup.dart';
import 'Pages/Gallery/GalleryComp/GalaryAlt.dart';

class AdminProfile extends StatefulWidget {
  const AdminProfile({Key? key}) : super(key: key);

  @override
  State<AdminProfile> createState() => _AdminProfileState();
}

class _AdminProfileState extends State<AdminProfile> {
  final TextEditingController _textController = TextEditingController();
  String selectedButton = 'Business Info';
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
      //RegistrationNumbers(),
      RegistrationAlit(),
      //Documents(),
      DocumentAlt(),
      //AdminContact(),
      AdminContactAlt(),
      Approvals(),
      MoreInfoALt(),
      GalleryAlt(),
      AdminHoursAlt(),
      AdminMediaLink()
    ];
    return SingleChildScrollView(
      child: Container(
        width: MyUtility(context).width,
        height: MyUtility(context).height,
        decoration: BoxDecoration(
          color: Color(0xFF171616),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Container(
                    width: MyUtility(context).width,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color(0xFF2C2C2C),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          ProfileButton(
                            text: 'Business Info',
                            isSelected: selectedButton == 'Business Info',
                            onPressed: () {
                              setState(() {
                                selectedButton = 'Business Info';
                                updateIndex(0);
                              });
                            },
                          ),
                          ProfileButton(
                            text: 'Registration Number',
                            isSelected: selectedButton == 'Registration Number',
                            onPressed: () {
                              setState(() {
                                selectedButton = 'Registration Number';
                                updateIndex(1);
                              });
                            },
                          ),
                          ProfileButton(
                            text: 'Documents',
                            isSelected: selectedButton == 'Documents',
                            onPressed: () {
                              setState(() {
                                selectedButton = 'Documents';
                                updateIndex(2);
                              });
                            },
                          ),
                          ProfileButton(
                            text: 'Contacts',
                            isSelected: selectedButton == 'Contacts',
                            onPressed: () {
                              setState(() {
                                selectedButton = 'Contacts';
                                updateIndex(3);
                              });
                            },
                          ),
                          ProfileButton(
                            text: 'Approvals',
                            isSelected: selectedButton == 'Approvals',
                            onPressed: () {
                              setState(() {
                                selectedButton = 'Approvals';
                                updateIndex(4);
                              });
                            },
                          ),
                          ProfileButton(
                            text: 'More Info',
                            isSelected: selectedButton == 'More Info',
                            onPressed: () {
                              setState(() {
                                selectedButton = 'More Info';
                                updateIndex(5);
                              });
                            },
                          ),
                          ProfileButton(
                            text: 'Gallery',
                            isSelected: selectedButton == 'Gallery',
                            onPressed: () {
                              setState(() {
                                selectedButton = 'Gallery';
                                updateIndex(6);
                              });
                            },
                          ),
                          ProfileButton(
                            text: 'Hours',
                            isSelected: selectedButton == 'Hours',
                            onPressed: () {
                              setState(() {
                                selectedButton = 'Hours';
                                updateIndex(7);
                              });
                            },
                          ),
                          ProfileButton(
                            text: 'Media Links',
                            isSelected: selectedButton == 'Media Links',
                            onPressed: () {
                              setState(() {
                                selectedButton = 'Media Links';
                                updateIndex(8);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: pages[pageIndex],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
