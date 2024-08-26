import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/RegistrationNumbers/RegistrationNumbersComp/RegistrationAltContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/RegistrationNumbers/RegistrationNumbersComp/Registrationcontainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/AddButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/CommonReuseable/IconSearchBoxB.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/RegistrationPopup/RegistrationPopup.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

class RegistrationAlit extends StatefulWidget {
  const RegistrationAlit({super.key});

  @override
  State<RegistrationAlit> createState() => _RegistrationAlitState();
}

class _RegistrationAlitState extends State<RegistrationAlit> {
  List<Map<String, dynamic>> registrationInfo = [];
  final _firestore = FirebaseFirestore.instance;
  bool _isLoading = true;

  Future<List<Map<String, dynamic>>> _fetchRegistrationData() async {
    StoredUser? user = await getUserInfo();
    if (user != null) {
      try {
        QuerySnapshot registrationSnapshot = await _firestore
            .collection('registration_numbers')
            .where('listingsId', isEqualTo: int.parse(user.id))
            .get();

        if (registrationSnapshot.docs.isNotEmpty) {
          List<Map<String, dynamic>> registrationData = registrationSnapshot
              .docs
              .map((doc) => doc.data() as Map<String, dynamic>)
              .toList();

          for (var registration in registrationData) {
            int? registrationTypeId = registration['registrationTypeId'];
            QuerySnapshot registrationTypeSnapshot = await FirebaseFirestore
                .instance
                .collection('registration_type')
                .where('registrationTypeId', isEqualTo: registrationTypeId)
                .get();
            String registrationTypeName =
                registrationTypeSnapshot.docs.first['registrationType'];
            String showRegistration =
                registrationTypeSnapshot.docs.first['registrationShow'] == 1
                    ? 'Yes'
                    : 'No';
            registration['registrationType'] = registrationTypeName;
            registration['displayProfile'] = showRegistration;
          }

          return registrationData;
        } else {
          return [
            {
              'registrationType': 'CRA Membership',
              'registrationNumbers': '2068',
              'displayProfile': 'Yes',
            },
            // Add default or placeholder data here if necessary
          ];
        }
      } catch (e) {
        print(e);
      }
    }

    return [{}];
  }

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    return Center(
      child: SizedBox(
        width: MyUtility(context).width * 0.9,
        child: Column(
          children: [
            SizedBox(
              height: MyUtility(context).height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AddButton(
                  text: 'Insert New Record',
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      barrierColor: Colors.black.withOpacity(0.5),
                      builder: (BuildContext context) {
                        return Dialog(
                          backgroundColor: Colors.transparent,
                          insetPadding: EdgeInsets.all(10),
                          child: RegistrationPopup(),
                        );
                      },
                    );
                  },
                ),
              ],
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
                        width: MyUtility(context).width * 0.26,
                        child: Text(
                          'Registration Type',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.6064,
                            fontFamily: 'ralewaybold',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MyUtility(context).width * 0.26,
                        child: Text(
                          'Registration Number',
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
                          'Display on Profile',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.6064,
                            fontFamily: 'ralewaybold',
                          ),
                        ),
                      ),
                      Text(
                        'Edit',
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
                future: _fetchRegistrationData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No registrations found'));
                  } else {
                    final registrationInfo = snapshot.data!;
                    return ListView.builder(
                      itemCount: registrationInfo.length,
                      itemBuilder: (context, index) {
                        final registration = registrationInfo[index];
                        return RegistrationAltContainer(
                          registrationType: registration['registrationType']!,
                          registrationNumber:
                              registration['registrationNumbers']!.toString(),
                          displayProfile: registration['displayProfile']!,
                          pressEdit: () {
                            // Implement edit functionality
                          },
                          pressDelete: () {
                            // Implement delete functionality
                          },
                          isEven: index % 2 == 0,
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
