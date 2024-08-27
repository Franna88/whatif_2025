import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
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
  final ScrollController _scrollController = ScrollController();

  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12.5, bottom: 12.5),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Image max 2 Megabytes each. Prefer landscape format. Accepted file types: JPG, JPEG, PNG, GIF.',
                  style: TextStyle(
                    color: Color(0xFFD17226),
                    fontSize: 14.7364,
                    fontFamily: 'ralewaysemi',
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MyUtility(context).width * 0.9,
          decoration: ShapeDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.57, -0.82),
              end: Alignment(-0.57, 0.82),
              colors: [
                Color(0x19777777),
                Colors.white.withOpacity(0.4000000059604645)
              ],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            shadows: [
              BoxShadow(
                color: Color(0xBF000000),
                blurRadius: 24,
                offset: Offset(0, 4),
                spreadRadius: -1,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AddButton(
                  text: 'Insert New Contact Person',
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      barrierColor: Colors.black.withOpacity(0.5),
                      builder: (BuildContext context) {
                        return Dialog(
                          backgroundColor: Colors.transparent,
                          insetPadding: EdgeInsets.all(10),
                          child: ContactPopup(
                            onAddContact: (Map<String, dynamic> newContact) {},
                          ),
                        );
                      },
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 5),
                  child: Text(
                    'Insert Contact Persons',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.6064,
                      fontFamily: 'ralewaybold',
                    ),
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'Please insert designated individuals that serve as ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.7364,
                          fontFamily: 'raleway',
                        ),
                      ),
                      TextSpan(
                        text:
                            'primary points of contact for specific departments',
                        style: TextStyle(
                          color: Color(0xFFD17226),
                          fontSize: 14.7364,
                          fontFamily: 'ralewaysemi',
                        ),
                      ),
                      TextSpan(
                        text: ' within your business.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.7364,
                          fontFamily: 'raleway',
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
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
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Designation',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.6064,
                                fontFamily: 'ralewaybold',
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Name & Surname',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.6064,
                                fontFamily: 'ralewaybold',
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              'Email',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.6064,
                                fontFamily: 'ralewaybold',
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              'Phone',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.6064,
                                fontFamily: 'ralewaybold',
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Edit',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.6064,
                                fontFamily: 'ralewaybold',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: heightDevice * 0.25,
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
                        return DraggableScrollbar.rrect(
                          controller: _scrollController,
                          backgroundColor: Color(0x7F9E9E9F),
                          alwaysVisibleScrollThumb: true,
                          child: ListView.builder(
                            controller:
                                _scrollController, // Ensure this controller is initialized
                            itemCount: contactInfo.length,
                            itemBuilder: (context, index) {
                              final contact = contactInfo[index];
                              return AdminContactAltContainer(
                                type: contact['contactPersonDesignation'],
                                contactPerson: contact['contactPerson'],
                                phone: contact['contactPersonCell'],
                                email: contact['contactPersonEmail'],
                                pressEdit: () {
                                  // Implement edit functionality
                                },
                                pressDelete: () {
                                  // Implement delete functionality
                                },
                                isEven: index % 2 == 0,
                              );
                            },
                          ),
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
            ),
          ),
        ),
      ],
    );
  }
}
