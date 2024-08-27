import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
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
  List<Map<String, dynamic>> _registrationInfo = [];
  final _firestore = FirebaseFirestore.instance;
  bool _isLoading = true;

  Future<List<Map<String, dynamic>>> _fetchRegistrationData() async {
    // Implement registration data fetching logic
    StoredUser? user = await getUserInfo();
    if (user != null) {
      print(user.id);
      try {
        // QuerySnapshot registrationSnapshot = await _firestore
        //     .collection('registration_numbers')
        //     .where('listingsId', isEqualTo: int.parse(user.id))
        //     .get();

        // if (registrationSnapshot.docs.isNotEmpty) {
        //   List<Map<String, dynamic>> registrationData = registrationSnapshot
        //       .docs
        //       .map((doc) => doc.data() as Map<String, dynamic>)
        //       .toList();

        //   // Fetch the registration type names
        //   for (var registration in registrationData) {
        //     int? registrationTypeId = registration['registrationTypeId'];
        //     QuerySnapshot registrationTypeSnapshot = await FirebaseFirestore
        //         .instance
        //         .collection('registration_type')
        //         .where('registrationTypeId', isEqualTo: registrationTypeId)
        //         .get();
        //     String registrationTypeName =
        //         registrationTypeSnapshot.docs.first['registrationType'];
        //     String showRegistration =
        //         registrationTypeSnapshot.docs.first['registrationShow'] == 1
        //             ? 'Yes'
        //             : 'No';
        //     registration['registrationType'] = registrationTypeName;
        //     registration['displayProfile'] = showRegistration;
        //   }

        //   return registrationData;

        // Fetch the registration numbers related to the listing
        QuerySnapshot registrationSnapshot = await _firestore
            .collection('registration_numbers')
            .where('listingsId', isEqualTo: int.parse(user.id))
            .get();

        if (registrationSnapshot.docs.isEmpty) return [];

        List<Map<String, dynamic>> registrationData = registrationSnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();

        // Extract all registrationTypeIds from registrationData
        Set<int?> registrationTypeIds = registrationData
            .map((registration) => registration['registrationTypeId'] as int?)
            .toSet();

        registrationTypeIds.removeWhere((i) => i == null);

        // Fetch all relevant registration types in one query
        QuerySnapshot registrationTypeSnapshot = await _firestore
            .collection('registration_type')
            .where('registrationTypeId', whereIn: registrationTypeIds)
            .get();

        // Create a map of registrationTypeId to registrationType details
        Map<int, Map<String, dynamic>> registrationTypeMap = {
          for (var doc in registrationTypeSnapshot.docs)
            doc['registrationTypeId']: {
              'type': doc['registrationType'],
              'show': doc['registrationShow'],
            }
        };

        // Map the registration type names and show profile status back to the registration data
        for (var registration in registrationData) {
          int? registrationTypeId = registration['registrationTypeId'];
          if (registrationTypeId != null &&
              registrationTypeMap.containsKey(registrationTypeId)) {
            registration['registrationType'] =
                registrationTypeMap[registrationTypeId]!['type'];
            registration['displayProfile'] =
                registrationTypeMap[registrationTypeId]!['show'] == 1
                    ? 'Yes'
                    : 'No';
          }
        }

        return registrationData;
        //     } else {
        //       return [
        //         {
        //           'registrationType': 'CRA Membership',
        //           'registrationNumbers': '2068',
        //           'displayProfile': 'Yes',
        //         },
        //         {
        //           'registrationType': 'CRA Membership',
        //           'registrationNumbers': '2068',
        //           'displayProfile': 'Yes',
        //         },
        //         {
        //           'registrationType': 'CRA Membership',
        //           'registrationNumbers': '2068',
        //           'displayProfile': 'yes',
        //         },
        //         {
        //           'registrationType': 'CRA Membership',
        //           'registrationNumbers': '2068',
        //           'displayProfile': 'yes',
        //         },
        //       ];
        //     }
      } catch (e) {
        print(e);
      }
    } else {
      throw "User not found";
    }

    return [];
  }

  void updateRegistrationNumbersOnAdd(Map<String, dynamic> newRegistration) {
    List<Map<String, dynamic>> regData = _registrationInfo;
    regData.add(newRegistration);
    setState(() {
      _registrationInfo = regData;
    });
  }

  @override
  final ScrollController _scrollController = ScrollController();

  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    return Center(
      child: SizedBox(
        width: MyUtility(context).width * 0.9,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
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
                children: [
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
                                child: RegistrationPopup(
                                  onAddRegistration:
                                      updateRegistrationNumbersOnAdd,
                                ),
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
                            Expanded(
                              flex: 3,
                              child: Text(
                                'Registration Type',
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
                                'Registration Number',
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
                                'Display on Business Profile',
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
                    height: heightDevice * 0.5,
                    child: FutureBuilder<List<Map<String, dynamic>>>(
                      future: _fetchRegistrationData(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return Center(child: Text('No registrations found'));
                        } else {
                          final registrationInfo = snapshot.data!;
                          return DraggableScrollbar.rrect(
                            controller: _scrollController,
                            backgroundColor: Color(0x7F9E9E9F),
                            alwaysVisibleScrollThumb: true,
                            child: ListView.builder(
                              controller:
                                  _scrollController, // Make sure this controller is initialized
                              itemCount: registrationInfo.length,
                              itemBuilder: (context, index) {
                                final registration = registrationInfo[index];
                                return RegistrationAltContainer(
                                  registrationType:
                                      registration['registrationType']!,
                                  registrationNumber:
                                      registration['registrationNumbers']!
                                          .toString(),
                                  displayProfile:
                                      registration['displayProfile']!,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
