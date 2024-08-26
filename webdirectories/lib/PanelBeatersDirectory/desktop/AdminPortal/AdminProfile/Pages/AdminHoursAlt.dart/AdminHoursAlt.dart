import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/AdminHoursAlt.dart/HoursReuseable/DaysButtonAlt.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/AdminHoursAlt.dart/HoursReuseable/HoursAlt.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/DaysButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/Hours.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/BusinessProfile/BusinessProfileHours.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

class AdminHoursAlt extends StatefulWidget {
  const AdminHoursAlt({super.key});

  @override
  State<AdminHoursAlt> createState() => _AdminHoursAltState();
}

class _AdminHoursAltState extends State<AdminHoursAlt> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Businessprofilehours? _listingHours;

  @override
  void initState() {
    super.initState();
    _fetchHoursData();
  }

  Future<void> _fetchHoursData() async {
    StoredUser? user = await getUserInfo();

    String? lisitingId = user?.id;

    QuerySnapshot hoursDoc = await _firestore
        .collection('listing_hours')
        .where('listingsId', isEqualTo: int.parse(lisitingId!))
        .get();

    if (hoursDoc.docs.isNotEmpty) {
      try {
        Map<String, dynamic> data =
            hoursDoc.docs.first.data() as Map<String, dynamic>;
        // set hours data
        setState(() {
          _listingHours = Businessprofilehours.fromMap(data);
        });
      } catch (e) {
        print('Error fetching listing hours: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            'To maintain system security and reliability, please avoid uploading images or links in the Useful Information section. All posts are subject to moderation.',
            style: TextStyle(
              color: Color(0xFFD17226),
              fontSize: 13.7364,
              fontFamily: 'ralewaysemi',
            ),
          ),
        ),
        Center(
          child: Container(
            width: MyUtility(context).width * 0.85,
            padding: const EdgeInsets.all(20.0),
            decoration: ShapeDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.57, -0.82),
                end: Alignment(-0.57, 0.82),
                colors: [
                  Color(0x19777777),
                  Colors.white.withOpacity(0.4),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    'Business Hours & Useful Information ',
                    style: TextStyle(
                      color: Colors.black, // Adjusted color for visibility
                      fontSize: 15.6064,
                      fontFamily: 'ralewaybold',
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DaysButtonAlt(
                        day: 'M', isSelected: _listingHours?.mOpen != 'closed'),
                    DaysButtonAlt(
                        day: 'T', isSelected: _listingHours?.tOpen != 'closed'),
                    DaysButtonAlt(
                        day: 'W', isSelected: _listingHours?.wOpen != 'closed'),
                    DaysButtonAlt(
                        day: 'T',
                        isSelected: _listingHours?.thOpen != 'closed'),
                    DaysButtonAlt(
                        day: 'F', isSelected: _listingHours?.fOpen != 'closed'),
                    DaysButtonAlt(
                        day: 'S',
                        isSelected: _listingHours?.saOpen != 'closed'),
                    DaysButtonAlt(
                        day: 'S',
                        isSelected: _listingHours?.suOpen != 'closed'),
                    DaysButtonAlt(
                        day: 'P', isSelected: _listingHours?.pOpen != 'closed'),
                  ],
                ),
                SizedBox(height: 20), // Add space between rows and time slots
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _listingHours?.mOpen != null &&
                            _listingHours?.mOpen != 'closed'
                        ? HoursAlt(
                            days: 'Monday',
                            from: _listingHours!.mOpen,
                            till: _listingHours!.mClosed)
                        : SizedBox.shrink(),
                    _listingHours?.tOpen != null &&
                            _listingHours?.tOpen != 'closed'
                        ? HoursAlt(
                            days: 'Tuesday',
                            from: _listingHours!.tOpen,
                            till: _listingHours!.tClosed)
                        : SizedBox.shrink(),
                    _listingHours?.wOpen != null &&
                            _listingHours?.wOpen != 'closed'
                        ? HoursAlt(
                            days: 'Wednesday',
                            from: _listingHours!.wOpen,
                            till: _listingHours!.wClosed)
                        : SizedBox.shrink(),
                    _listingHours?.thOpen != null &&
                            _listingHours?.thOpen != 'closed'
                        ? HoursAlt(
                            days: 'Thursday',
                            from: _listingHours!.thOpen,
                            till: _listingHours!.thClosed)
                        : SizedBox.shrink(),
                    _listingHours?.fOpen != null &&
                            _listingHours?.fOpen != 'closed'
                        ? HoursAlt(
                            days: 'Friday',
                            from: _listingHours!.fOpen,
                            till: _listingHours!.fClosed)
                        : SizedBox.shrink(),
                    _listingHours?.saOpen != null &&
                            _listingHours?.saOpen != 'closed'
                        ? HoursAlt(
                            days: 'Saturday',
                            from: _listingHours!.saOpen,
                            till: _listingHours!.saClosed)
                        : SizedBox.shrink(),
                    _listingHours?.suOpen != null &&
                            _listingHours?.suOpen != 'closed'
                        ? HoursAlt(
                            days: 'Sunday',
                            from: _listingHours!.suOpen,
                            till: _listingHours!.suClosed)
                        : SizedBox.shrink(),
                    _listingHours?.pOpen != null &&
                            _listingHours?.pOpen != 'closed'
                        ? HoursAlt(
                            days: 'Public Holidays',
                            from: _listingHours!.pOpen,
                            till: _listingHours!.pClosed)
                        : SizedBox.shrink(),
                  ],
                ),
                SizedBox(height: 20), // Additional padding
                // Text field and save button can be added here with appropriate padding
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: TextField(
                    // This field represents the additional information input
                    decoration: InputDecoration(
                      hintText: "We are closed between Christmas & New Year...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle save action
                    },
                    child: Text("Save"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
