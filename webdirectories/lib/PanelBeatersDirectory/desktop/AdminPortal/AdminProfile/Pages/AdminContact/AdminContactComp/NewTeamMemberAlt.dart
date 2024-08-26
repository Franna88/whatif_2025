import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/AdminContact/AdminContactComp/TeamProfileAlt.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/TeamProfile.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/AddButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/AddmemberPopup/AddmemberPopup.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/BusinessProfile/BusinessTeamMemberProfile.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

class NewTeamMemberAlt extends StatefulWidget {
  NewTeamMemberAlt({super.key});

  @override
  State<NewTeamMemberAlt> createState() => _NewTeamMemberAltState();
}

class _NewTeamMemberAltState extends State<NewTeamMemberAlt> {
  final _firestore = FirebaseFirestore.instance;
  Future<List<Map<String, dynamic>>> _fetchData() async {
    StoredUser? user = await getUserInfo();
    if (user == null) {
      // Return dummy data with images
      return [
        {
          'personPhoto': 'images/avatar1.png', // Dummy image with text "John"
          'firstName': 'John',
          'surname': 'Doe',
          'shortDescription': 'Team Lead',
          'teamOrder': 1,
        },
        {
          'personPhoto': 'images/avatar2.png', // Dummy image with text "Jane"
          'firstName': 'Jane',
          'surname': 'Smith',
          'shortDescription': 'Software Engineer',
          'teamOrder': 2,
        },
        {
          'personPhoto': 'images/avatar3.png', // Dummy image with text "Emily"
          'firstName': 'Emily',
          'surname': 'Johnson',
          'shortDescription': 'Product Manager',
          'teamOrder': 3,
        },
        {
          'personPhoto':
              'images/avatar4.png', // Dummy image with text "Michael"
          'firstName': 'Michael',
          'surname': 'Brown',
          'shortDescription': 'Designer',
          'teamOrder': 4,
        },
      ];
    }

    // Fetch team profiles from Firestore
    QuerySnapshot teamProfilesSnapshot = await _firestore
        .collection('listings_team')
        .where('listingsId', isEqualTo: int.parse(user.id))
        .get();

    return teamProfilesSnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MyUtility(context).width,
        decoration: BoxDecoration(color: Color(0xFF171616)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MyUtility(context).width * 0.10,
                  ),
                  Text(
                    'Team',
                    style: TextStyle(
                      color: Color(0xFF0F253A),
                      fontSize: 20.4,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                  ),
                  AddButton(
                    text: 'Add Member',
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        barrierColor: Colors.black.withOpacity(0.5),
                        builder: (BuildContext context) {
                          return Dialog(
                            backgroundColor: Colors.transparent,
                            insetPadding: EdgeInsets.all(10),
                            child: AddMemberPopup(),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: _fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No profiles found'));
                  } else {
                    List<Map<String, dynamic>> teamProfiles = snapshot.data!;
                    teamProfiles.sort((a, b) => (a['teamOrder'] as int)
                        .compareTo(b['teamOrder'] as int));
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: teamProfiles.map((profile) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TeamProfileAlt(
                              memberImage: profile['personPhoto'],
                              memberName:
                                  '${profile['firstName']} ${profile['surname']}',
                              memberPosition: profile['shortDescription'],
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: MyUtility(context).width / 2,
                    height: 1,
                    color: Color(0xFF0F253A),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
