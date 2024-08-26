import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Advertisement/Advertisementcomp/AdvertButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/ManageUsers/ManageUserComp/ManageUserInfo.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/NewUserPopup/NewUserPopup.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/users.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

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

  final List<Map<String, String>> userInfo = [
    {
      'year': '2024',
      'month': '03',
      'day': '07',
      'email': 'user1@gmail.com',
      'fullName': 'User1 User1',
      'status': 'Active'
    },
    {
      'year': '2024',
      'month': '03',
      'day': '07',
      'email': 'user2@gmail.com',
      'fullName': 'User2 User2',
      'status': 'Inactive'
    },
    {
      'year': '2024',
      'month': '03',
      'day': '07',
      'email': 'user3@gmail.com',
      'fullName': 'User3 User3',
      'status': 'Active'
    },
    // Add more user info as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MyUtility(context).width,
        height: MyUtility(context).height,
        decoration: BoxDecoration(color: Color(0xFFF4F4F4)),
        child: Center(
          child: Container(
            width: MyUtility(context).width * 0.75,
            height: MyUtility(context).height * 0.9,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Manage Users',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.48,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      AdvertButton(
                        text: 'Request User',
                        onPressed: () {
                          showDialog(
                            context: context,
                            barrierDismissible: true,
                            barrierColor: Colors.black.withOpacity(0.5),
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
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Container(
                      width: MyUtility(context).width * 0.73,
                      height: MyUtility(context).height * 0.06,
                      decoration: ShapeDecoration(
                        color: Color(0xFF00437B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MyUtility(context).width * 0.15,
                              child: Text(
                                'Date Reg',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.96,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MyUtility(context).width * 0.15,
                              child: Text(
                                'Email',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.96,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MyUtility(context).width * 0.225,
                              child: Text(
                                'Full Name',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.96,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MyUtility(context).width * 0.15,
                              child: Text(
                                'Status',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.96,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Text(
                              'View',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.96,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
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
                            : ListView.builder(
                                itemCount: usersData.length,
                                itemBuilder: (context, index) {
                                  UserModel user = usersData[index];
                                  return ManageUserInfo(
                                    year: user.dateAdded.year.toString(),
                                    month: user.dateAdded.month.toString(),
                                    day: user.dateAdded.day.toString(),
                                    email: user.email,
                                    fullName:
                                        '${user.firstName} ${user.surname}',
                                    status: user.status,
                                  );
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
