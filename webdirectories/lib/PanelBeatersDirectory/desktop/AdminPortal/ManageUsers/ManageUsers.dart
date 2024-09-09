import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/AddButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Advertisement/Advertisementcomp/AdvertButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/ManageUsers/ManageUserComp/ManageUserInfo.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/NewUserPopup/NewUserPopup.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/users.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

import '../Dashboard/DashboardContainers/DashProfileView.dart';

class ManageUsers extends StatefulWidget {
  const ManageUsers({super.key});

  @override
  State<ManageUsers> createState() => _ManageUsersState();
}

class _ManageUsersState extends State<ManageUsers> {
  final _firestore = FirebaseFirestore.instance;
  List<UserModel> usersData = [];
  bool _isLoading = true;

  @override
  void initState() {
    _fetchUserData();
    super.initState();
  }

  void _fetchUserData() async {
    print('loading users...');
    try {
      StoredUser? user = await getUserInfo();
      if (user == null) {
        print('User not found');
        setState(() {
          _isLoading = false;
        });
        return;
      }

      QuerySnapshot<Map<String, dynamic>> usersSnapshot = await _firestore
          .collection('listing_members')
          .where('listingsId', isEqualTo: int.parse(user.id))
          .get();
      List<UserModel> users = [];
      if (usersSnapshot.docs.isNotEmpty) {
        print('loading users... ${usersSnapshot.docs.length} users found');
        for (var user in usersSnapshot.docs) {
          UserModel userData = UserModel(
            dateAdded: user.data()['dateAdded'],
            firstName: user.data()['firstName'],
            surname: user.data()['surname'],
            email: user.data()['email'],
            status: user.data()['status'] ?? 'Active',
          );

          users.add(userData);
        }

        setState(() {
          _isLoading = false;
          usersData = users;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
        print('No users found');
      }
    } catch (e) {
      print('error fetching user data: $e');
      if (!mounted) return;
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error fetching user data')));
    }
  }

  final List<UserModel> dummyUsers = [
    UserModel(
      dateAdded: DateTime(2024, 3, 7),
      firstName: 'User1',
      surname: 'User1',
      email: 'user1@gmail.com',
      status: 'Active',
    ),
    UserModel(
      dateAdded: DateTime(2024, 3, 7),
      firstName: 'User2',
      surname: 'User2',
      email: 'user2@gmail.com',
      status: 'Inactive',
    ),
    UserModel(
      dateAdded: DateTime(2024, 3, 7),
      firstName: 'User3',
      surname: 'User3',
      email: 'user3@gmail.com',
      status: 'Active',
    ),
  ];

  @override
  final ScrollController _scrollController = ScrollController();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MyUtility(context).width,
        height: MyUtility(context).height,
        decoration: BoxDecoration(
          color: Color(0xFF171616),
        ),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  width: MyUtility(context).width * 0.9,
                  height: MyUtility(context).height * 0.85,
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
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                AddButton(
                                  text: 'Request New User',
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      barrierColor:
                                          Colors.black.withOpacity(0.5),
                                      builder: (BuildContext context) {
                                        return Dialog(
                                          backgroundColor: Colors.transparent,
                                          insetPadding: EdgeInsets.all(10),
                                          child: NewUserPopup(),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Text(
                                'Manage Users',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.6064,
                                  fontFamily: 'ralewaybold',
                                ),
                              ),
                            ),
                            Text(
                              'Please fill out the following form to create a new user account. Once completed, we will send a welcome email with login instructions to the nominated email address',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.73,
                                fontFamily: 'raleway',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: Container(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 8, right: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Date Reg',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.60,
                                        fontFamily: 'ralewaybold',
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Email',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.60,
                                        fontFamily: 'ralewaybold',
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Full Name',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.60,
                                        fontFamily: 'ralewaybold',
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Status',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.60,
                                        fontFamily: 'ralewaybold',
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'View',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.60,
                                        fontFamily: 'ralewaybold',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: _isLoading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                  color: Colors.black,
                                ))
                              : usersData.isEmpty
                                  ? const Center(
                                      child: Text(
                                        'No users found',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    )
                                  : DraggableScrollbar.rrect(
                                      controller: _scrollController,
                                      backgroundColor: Color(0x7F9E9E9F),
                                      alwaysVisibleScrollThumb: true,
                                      child: ListView.builder(
                                        controller: _scrollController,
                                        itemCount: usersData.length,
                                        itemBuilder: (context, index) {
                                          UserModel user = usersData[index];
                                          return ManageUserInfo(
                                            year:
                                                user.dateAdded.year.toString(),
                                            month:
                                                user.dateAdded.month.toString(),
                                            day: user.dateAdded.day.toString(),
                                            email: user.email,
                                            fullName:
                                                '${user.firstName} ${user.surname}',
                                            status: user.status,
                                            isEven: index % 2 == 0,
                                            pressEdit: () {},
                                            pressDelete: () {},
                                          );
                                        },
                                      ),
                                    ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
