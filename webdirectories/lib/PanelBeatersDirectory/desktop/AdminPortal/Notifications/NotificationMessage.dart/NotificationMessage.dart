import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DashboardContainers/DashProfileView.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Notifications/NotificationMessage.dart/NotMessageReuseable/MessageText.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Notifications/NotificationMessage.dart/NotMessageReuseable/QuotationRequests.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Notifications/NotificationsComp/icons/NotificationSearch.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Notifications/NotificationsComp/icons/ReuseableiconButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/notifications.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

import 'NotMessageReuseable/BackButtonMessage.dart';
import 'NotMessageReuseable/CircleAvitarReuseable.dart';

class NotificationMessage extends StatefulWidget {
  final Function(int) navigateToPage;
  const NotificationMessage({super.key, required this.navigateToPage});

  @override
  State<NotificationMessage> createState() => _NotificationMessageState();
}

class _NotificationMessageState extends State<NotificationMessage> {
  final _firestore = FirebaseFirestore.instance;
  List<NotificationsModel> _notificationData = [];
  String _searchQuery = '';
  bool _isLoading = true;
  @override
  void initState() {
    _fetchNotificationData();
    super.initState();
  }

  void _fetchNotificationData() async {
    StoredUser? user = await getUserInfo();

    if (user == null) {
      return;
    }

    final notificationsFuture = _firestore
        .collection('notifications')
        .where('listingsId', isEqualTo: int.parse(user.id))
        .orderBy('notificationDate', descending: true)
        .get();

    final generalNotificationsFuture = _firestore
        .collection('notifications')
        .where('listingsId', isEqualTo: 0)
        .orderBy('notificationDate', descending: true)
        .get();

    // Run both queries in parallel
    List<QuerySnapshot<Map<String, dynamic>>> results =
        await Future.wait([notificationsFuture, generalNotificationsFuture]);

    List<NotificationsModel> notificationList = [];

    final generalNotificationSnapshot = results[1];
    if (generalNotificationSnapshot.docs.isNotEmpty) {
      for (var doc in generalNotificationSnapshot.docs) {
        notificationList.add(NotificationsModel(
          notificationsId: doc['notificationId'],
          notificationTypeId: doc['notificationTypeId'],
          notificationTitle: doc['notificationTitle'],
          notificationDate: doc['notificationDate'],
          notification: doc['notification'],
          listingsId: doc['listingsId'],
        ));
      }
    }

    final notificationSnapshot = results[0];
    if (notificationSnapshot.docs.isNotEmpty) {
      for (var doc in notificationSnapshot.docs) {
        notificationList.add(NotificationsModel(
          notificationsId: doc['notificationId'],
          notificationTypeId: doc['notificationTypeId'],
          notificationTitle: doc['notificationTitle'],
          notificationDate: doc['notificationDate'],
          notification: doc['notification'],
          listingsId: doc['listingsId'],
        ));
      }
    }

    setState(() {
      _notificationData = notificationList;
      _isLoading = false;
    });
  }

  List<NotificationsModel> get _filteredNotifications {
    List<NotificationsModel> filtered = _notificationData;

    // Apply search filter
    if (_searchQuery.isNotEmpty) {
      filtered = filtered.where((notification) {
        return notification.notificationTitle
            .toLowerCase()
            .contains(_searchQuery.toLowerCase());
      }).toList();
    }

    return filtered;
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  @override
  int _currentPage = 0;
  final ScrollController _scrollController = ScrollController();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MyUtility(context).width,
        height: MyUtility(context).height,
        decoration: BoxDecoration(color: Color(0xFF171616)),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Column(
            children: [
              //DashProfileView(),
              Container(
                width: MyUtility(context).width,
                height: MyUtility(context).height * 0.82,
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
                child: Column(
                  children: [
                    SizedBox(
                        width: MyUtility(context).width * 0.75,
                        height: MyUtility(context).height * 0.065,
                        child: BackButtonMessage(
                          onPress: () {
                            widget.navigateToPage(4);
                          },
                        )),
                    Center(
                      child: Container(
                        width: MyUtility(context).width * 0.75,
                        height: MyUtility(context).height * 0.55,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CustomCircleAvatar(
                                        imageUrl: '',
                                        radius: 20.0,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 6, right: 6),
                                        child: Text(
                                          'Theresa Webb',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17.64,
                                            fontFamily: 'ralewaysemi',
                                          ),
                                        ),
                                      ),
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: '<',
                                              style: TextStyle(
                                                color: Color(0xFF202124),
                                                fontSize: 15.7364,
                                                fontFamily: 'raleway',
                                              ),
                                            ),
                                            TextSpan(
                                              text: 'theresawebb01@gmail.com',
                                              style: TextStyle(
                                                color: Color(0xFF202124),
                                                fontSize: 15.7364,
                                                fontFamily: 'raleway',
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '>',
                                              style: TextStyle(
                                                color: Color(0xFF202124),
                                                fontSize: 15.7364,
                                                fontFamily: 'raleway',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      QuotationRequests()
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      ReuseableIconButton(
                                        icon: Icons.delete,
                                        size: 25.0,
                                        iconColor: Color(0xFF757575),
                                        tooltipMessage: 'Delete',
                                        onPressed: () {},
                                      ),
                                      ReuseableIconButton(
                                        icon: Icons.print,
                                        size: 25.0,
                                        iconColor: Color(0xFF757575),
                                        tooltipMessage: 'Delete',
                                        onPressed: () {},
                                      ),
                                      Text(
                                        '12:01 PM',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Color(0xFF202124),
                                          fontSize: 13.9272,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        '(4 hours ago)',
                                        style: TextStyle(
                                          color: Color(0xFF202124),
                                          fontSize: 15.7364,
                                          fontFamily: 'raleway',
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(75, 16, 16, 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15, bottom: 20),
                                      child: Text(
                                        'Good day. May I request a quotation for replacement and fitment of the Sunroof on my vehicle. Thank You ',
                                        style: TextStyle(
                                          color: Color(0xFF202124),
                                          fontSize: 15.7364,
                                          fontFamily: 'raleway',
                                        ),
                                      ),
                                    ),
                                    MessageText(
                                        boldText: 'From:',
                                        normalText: 'Theresa Webb'),
                                    MessageText(
                                        boldText: 'Email:',
                                        normalText: 'theresawebb01@gmail.com'),
                                    MessageText(
                                        boldText: 'Contact:',
                                        normalText: '012 345 6789'),
                                    MessageText(
                                        boldText: 'Make:', normalText: 'Audi'),
                                    MessageText(
                                        boldText: 'Model:', normalText: 'Q5'),
                                    MessageText(
                                        boldText: 'Address:',
                                        normalText:
                                            '123 Berg Street, Eden, George, 6529 '),
                                    MessageText(
                                        boldText: 'Date:',
                                        normalText: '13-08-2024'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
