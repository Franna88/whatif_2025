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
  List<Map<String, dynamic>> usersData = []; // Store user and documentId
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
          .where('listingMembersId', isEqualTo: 1218)
          .get();

      List<Map<String, dynamic>> users = [];

      print(usersSnapshot.docs[0].get('fullname'));

      if (usersSnapshot.docs.isNotEmpty) {
        print('loading users... ${usersSnapshot.docs.length} users found');
        for (var doc in usersSnapshot.docs) {
          // Handle 'dateAdded' as Timestamp, with null check and fallback
          Timestamp? timestamp = doc.data()['dateAdded'] as Timestamp?;
          DateTime dateAdded =
              timestamp != null ? timestamp.toDate() : DateTime.now();

          // Safely split fullname into firstName and surname
          String fullName = doc.data()['fullname']?.toString() ?? '';
          List<String> nameParts =
              fullName.split(' '); // Split full name by spaces
          String firstName = nameParts.isNotEmpty
              ? nameParts[0]
              : ''; // First part as firstName
          String surname = nameParts.length > 1
              ? nameParts.sublist(1).join(' ')
              : ''; // Combine remaining parts as surname

          // Optional fields
          String? mobile = doc.data()['mobile'];
          String displayOnProfile =
              doc.data()['displayOnProfile']?.toString() ?? 'false';

          UserModel userData = UserModel(
            dateAdded: dateAdded,
            firstName: firstName,
            surname: surname,
            email: doc.data()['email']?.toString() ?? '',
            status: doc.data()['status']?.toString() ?? 'Active',
          );

          // Store user data and documentId
          users.add({
            'user': userData,
            'documentId': doc.id,
            'mobile': mobile,
            'displayOnProfile': displayOnProfile,
          });
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
    // Safely split fullName into firstName and surname
    List<String> nameParts = userData['fullName']!.split(' ');
    String firstName =
        nameParts.isNotEmpty ? nameParts[0] : ''; // Use first part as firstName
    String surname = nameParts.length > 1
        ? nameParts[1]
        : ''; // Use second part as surname, if available

    // Add new user to local usersData list
    setState(() {
      usersData.add({
        'user': UserModel(
          firstName: firstName,
          surname: surname,
          email: userData['email']!,
          status: 'Active',
          dateAdded: DateTime.now(),
        ),
        'documentId': null, // No document ID for new users
        'mobile': userData['mobile'],
        'displayOnProfile': userData['displayOnProfile'],
      });
    });

    // Save new user to Firestore
    _firestore.collection('listing_members').add({
      'firstName': firstName,
      'surname': surname,
      'email': userData['email'],
      'status': 'Active',
      'dateAdded': DateTime.now(), // Firestore converts to Timestamp
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

  // Handle editing a user
  void _editUser(String documentId, Map<String, String> updatedUserData) {
    _firestore.collection('listing_members').doc(documentId).update({
      'firstName': updatedUserData['fullName']?.split(' ')[0],
      'surname': updatedUserData['fullName']?.split(' ')[1],
      'email': updatedUserData['email'],
      'mobile': updatedUserData['mobile'],
      'displayOnProfile': updatedUserData['displayOnProfile'],
    }).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User updated successfully')),
      );
      _fetchUserData(); // Refresh the user list after update
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error updating user: $error')),
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
                                            var userMap = usersData[index];
                                            UserModel user = userMap['user'];
                                            String documentId =
                                                userMap['documentId'];

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
                                              pressEdit: () {
                                                showDialog(
                                                  context: context,
                                                  barrierDismissible: true,
                                                  barrierColor: Colors.black
                                                      .withOpacity(0.5),
                                                  builder:
                                                      (BuildContext context) {
                                                    return Dialog(
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      insetPadding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      child: NewUserPopup(
                                                        initialData: {
                                                          'fullName':
                                                              '${user.firstName} ${user.surname}', // Pre-fill with user's full name
                                                          'email': user
                                                              .email, // Pre-fill with user's email
                                                          'mobile': userMap[
                                                                  'mobile'] ??
                                                              '',
                                                          'displayOnProfile':
                                                              userMap['displayOnProfile'] ??
                                                                  'false',
                                                        },
                                                        onSubmit:
                                                            (updatedUserData) {
                                                          // Pass the document ID and updated user data to edit the user
                                                          _editUser(documentId,
                                                              updatedUserData);
                                                        },
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
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
