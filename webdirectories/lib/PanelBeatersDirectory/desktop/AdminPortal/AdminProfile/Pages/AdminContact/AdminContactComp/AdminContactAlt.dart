import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/AdminContact/AdminContactComp/AdMinContactAltContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/AdminContact/AdminContactComp/AdminContactContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/AdminContact/AdminContactComp/NewTeamMemberAlt.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/AddButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/CommonReuseable/IconSearchBoxB.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/ContactPopup/ContactPopup.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

class AdminContactAlt extends StatefulWidget {
  const AdminContactAlt({super.key});

  @override
  State<AdminContactAlt> createState() => _AdminContactAltState();
}

class _AdminContactAltState extends State<AdminContactAlt> {
  late List<Map<String, String>> contactInfo;
  final _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, String>>> _fetchContactData() async {
    StoredUser? user = await getUserInfo();

    if (user == null) {
      return [];
    }

    QuerySnapshot contactSnapshot = await _firestore
        .collection('contact_person')
        .where('listingsId', isEqualTo: 1)
        .get();

    if (contactSnapshot.docs.isNotEmpty) {
      List<Map<String, String>> contactData = contactSnapshot.docs
          .map((doc) => doc.data() as Map<String, String>)
          .toList();
      return contactData;
    } else {
      return [
        {
          'contactPersonDesignation': 'Administrator',
          'contactPerson': 'Samantha Sheingold',
          'contactPersonCell': '0123464690',
          'contactPersonEmail': 'samantha@webdirectories.co.za',
        },
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MyUtility(context).height * 0.05,
        ),
        AddButton(
          text: 'Insert Contact',
          onPressed: () {
            showDialog(
              context: context,
              barrierDismissible: true,
              barrierColor: Colors.black.withOpacity(0.5),
              builder: (BuildContext context) {
                return Dialog(
                  backgroundColor: Colors.transparent,
                  insetPadding: EdgeInsets.all(10),
                  child: ContactPopup(),
                );
              },
            );
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconSearchBoxB(),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 15),
          child: Container(
            width: MyUtility(context).width * 0.9,
            height: MyUtility(context).height * 0.065,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: MyUtility(context).width * 0.195,
                    // check first two to see if it matches
                    child: Text(
                      'Designation',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.6064,
                        fontFamily: 'ralewaybold',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MyUtility(context).width * 0.195,
                    child: Text(
                      'Name & Surname',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.6064,
                        fontFamily: 'ralewaybold',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MyUtility(context).width * 0.12,
                    child: Text(
                      'Phone',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.6064,
                        fontFamily: 'ralewaybold',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MyUtility(context).width * 0.23,
                    child: Text(
                      'Email',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.6064,
                        fontFamily: 'ralewaybold',
                      ),
                    ),
                  ),
                  Text(
                    'Email',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.6064,
                      fontFamily: 'ralewaybold',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: heightDevice,
          child: FutureBuilder<List<Map<String, dynamic>>>(
            future: _fetchContactData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No contact persons found'));
              } else {
                final contactInfo = snapshot.data!;
                return ListView.builder(
                  itemCount: contactInfo.length,
                  itemBuilder: (context, index) {
                    final contact = contactInfo[index];
                    return AdminContactAltContainer(
                      type: contact['contactPersonDesignation'],
                      contactPerson: contact['contactPerson'],
                      phone: contact['contactPersonCell'],
                      email: contact['contactPersonEmail'],
                      pressEdit: () {},
                      pressDelete: () {},
                      isEven: index % 2 == 0,
                    );
                  },
                );
              }
            },
          ),
        ),
        Container(
          height: MyUtility(context).height * 0.6,
          child: NewTeamMemberAlt(),
        ),
      ],
    );
  }
}
