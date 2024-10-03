import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/AddButton.dart';
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
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _fetchUserData();
    super.initState();
  }

  // Fetch user data from Firestore and handle errors
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
        for (var doc in usersSnapshot.docs) {
          UserModel userData = UserModel(
            dateAdded: (doc.data()['dateAdded'] as Timestamp).toDate(),
            firstName: doc.data()['firstName'],
            surname: doc.data()['surname'],
            email: doc.data()['email'],
            status: doc.data()['status'] ?? 'Active',
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
      print('Error fetching user data: $e');
      if (!mounted) return;
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error fetching user data')));
    }
  }

  // Handle the submission of new user data from NewUserPopup
  void _addNewUser(Map<String, String> userData) {
    // Add new user to local usersData list
    setState(() {
      usersData.add(
        UserModel(
          firstName: userData['fullName']!.split(' ')[0],
          surname: userData['fullName']!.split(' ')[1],
          email: userData['email']!,
          status: 'Active',
          dateAdded: DateTime.now(),
        ),
      );
    });

    // Save new user to Firestore
    _firestore.collection('listing_members').add({
      'firstName': userData['fullName']!.split(' ')[0],
      'surname': userData['fullName']!.split(' ')[1],
      'email': userData['email'],
      'status': 'Active',
      'dateAdded': DateTime.now(),
    }).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('New user added successfully')),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error adding user: $error')),
      );
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MyUtility(context).width,
        height: MyUtility(context).height,
        decoration: const BoxDecoration(
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
                      begin: const Alignment(0.57, -0.82),
                      end: const Alignment(-0.57, 0.82),
                      colors: [
                        const Color(0x19777777),
                        Colors.white.withOpacity(0.4),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    shadows: const [
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
                        // Header section
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
                                          insetPadding:
                                              const EdgeInsets.all(10),
                                          child: NewUserPopup(
                                            onSubmit: _addNewUser,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: Text(
                                'Manage Users',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.6,
                                  fontFamily: 'ralewaybold',
                                ),
                              ),
                            ),
                            const Text(
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

                        // User list table header
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: Container(
                            padding: const EdgeInsets.only(left: 8, right: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Date Reg',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.6,
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
                                      fontSize: 16.6,
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
                                      fontSize: 16.6,
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
                                      fontSize: 16.6,
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
                                      fontSize: 16.6,
                                      fontFamily: 'ralewaybold',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // User list with scroll bar
                        Expanded(
                          child: _isLoading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.black,
                                  ),
                                )
                              : usersData.isEmpty
                                  ? const Center(
                                      child: Text(
                                        'No users found',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    )
                                  : DraggableScrollbar.rrect(
                                      controller: _scrollController,
                                      backgroundColor: const Color(0x7F9E9E9F),
                                      alwaysVisibleScrollThumb: true,
                                      child: ListView.builder(
                                        controller: _scrollController,
                                        itemCount: usersData.length,
                                        itemBuilder: (context, index) {
                                          if (index < usersData.length) {
                                            UserModel user = usersData[index];
                                            return ManageUserInfo(
                                              year: user.dateAdded.year
                                                  .toString(),
                                              month: user.dateAdded.month
                                                  .toString(),
                                              day:
                                                  user.dateAdded.day.toString(),
                                              email: user.email,
                                              fullName:
                                                  '${user.firstName} ${user.surname}',
                                              status: user.status,
                                              isEven: index % 2 == 0,
                                              pressEdit: () {},
                                              pressDelete: () {},
                                            );
                                          }
                                          return const SizedBox.shrink();
                                        },
                                      ),
                                    ),
                        ),
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
