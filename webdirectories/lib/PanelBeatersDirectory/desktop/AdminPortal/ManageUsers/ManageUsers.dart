import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Advertisement/Advertisementcomp/AdvertButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/ManageUsers/ManageUserComp/ManageUserInfo.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/NewUserPopup/NewUserPopup.dart';
import 'package:webdirectories/myutility.dart';

class ManageUsers extends StatefulWidget {
  const ManageUsers({super.key});

  @override
  State<ManageUsers> createState() => _ManageUsersState();
}

class _ManageUsersState extends State<ManageUsers> {
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
                      width: MyUtility(context).width * 0.725,
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
                    child: ListView.builder(
                      itemCount: userInfo.length,
                      itemBuilder: (context, index) {
                        final user = userInfo[index];
                        return ManageUserInfo(
                          year: user['year']!,
                          month: user['month']!,
                          day: user['day']!,
                          email: user['email']!,
                          fullName: user['fullName']!,
                          status: user['status']!,
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
