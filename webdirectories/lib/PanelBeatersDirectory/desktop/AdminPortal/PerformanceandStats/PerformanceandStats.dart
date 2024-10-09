import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PerformanceandStats/PerformanceReuseable/PerformanceListContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PerformanceandStats/PerformanceReuseable/StatGraphContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';
import 'package:intl/intl.dart';
import '../Dashboard/DashboardContainers/DashProfileView.dart';

class PerformanceAndStats extends StatefulWidget {
  const PerformanceAndStats({super.key});

  @override
  State<PerformanceAndStats> createState() => _PerformanceAndStatsState();
}

class _PerformanceAndStatsState extends State<PerformanceAndStats> {
  final _scrollController = ScrollController();
  final _firestore = FirebaseFirestore.instance;
  bool _isLoading = true; // Track loading
  List viewList = [];
  Future<void> _fetchViewData() async {
    StoredUser? user =
        await getUserInfo(); // Assuming you have this method to get the user

    if (user != null) {
      try {
        // Fetch the user's document from Firestore based on their ID
        final viewData =
            await _firestore.collection('views').doc(user.id).get();

        if (viewData.exists) {
          setState(() {
            print(viewData.get('views'));
            viewList = (viewData.get('views'));
          });
        }
      } catch (e) {
        print('Error fetching user data: $e');
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void initState() {
    _fetchViewData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dummyData = [
      {
        'ipAddress': '105.244.93.99',
        'linkReference':
            'https://www.panelbeatersdirectory.co.za/convenience-advanced.php',
        'dateAndTime': '2024-08-22 21:34:14',
      },
      {
        'ipAddress': '156.155.78.178',
        'linkReference':
            'https://panelbeatersdirectory.co.za/owner/listings-registration-numbers.php?listings_id=2473&page=number&menu=1',
        'dateAndTime': '2024-08-22 13:09:56',
      },
      {
        'ipAddress': '105.186.235.56',
        'linkReference':
            'https://panelbeatersdirectory.co.za/advanced-search-form.php?',
        'dateAndTime': '2024-08-21 21:19:07',
      },
      {
        'ipAddress': '196.15.134.130',
        'linkReference':
            'https://panelbeatersdirectory.co.za/advanced-search-form.php?approval_select=3&country_id=8',
        'dateAndTime': '2024-08-20 14:53:09',
      },
      {
        'ipAddress': '105.245.122.10',
        'linkReference':
            'https://panelbeatersdirectory.co.za/advanced-search-form.php?approval_select=327&city_id=148',
        'dateAndTime': '2024-08-20 09:43:11',
      },
      {
        'ipAddress': '102.131.29.218',
        'linkReference':
            'https://panelbeatersdirectory.co.za/directory-city.php?city_id=148',
        'dateAndTime': '2024-08-20 08:40:48',
      },
      {
        'ipAddress': '105.244.93.99',
        'linkReference':
            'https://www.panelbeatersdirectory.co.za/convenience-advanced.php',
        'dateAndTime': '2024-08-22 21:34:14',
      },
      {
        'ipAddress': '105.244.93.99',
        'linkReference':
            'https://www.panelbeatersdirectory.co.za/convenience-advanced.php',
        'dateAndTime': '2024-08-22 21:34:14',
      },
    ];

    return Container(
      width: MyUtility(context).width,
      height: MyUtility(context).height,
      decoration: BoxDecoration(color: Color(0xFF171616)),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 0, right: 20),
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              width: MyUtility(context).width * 0.8,
              height: MyUtility(context).height * 0.85,
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
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Review your Profile Analytics',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.6,
                          fontFamily: 'ralewayBold',
                        ),
                      ),
                      SizedBox(height: 10),
                      Text.rich(
                        TextSpan(
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.60,
                            fontFamily: 'raleway',
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(text: 'Gain '),
                            TextSpan(
                              text: 'valuable insights',
                              style: TextStyle(
                                color: Color(0xFFEF9040),
                                fontFamily: 'ralewaybold',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                                text:
                                    ' into your panel beater business\'s performance. '),
                            TextSpan(
                              text:
                                  'Please note that we only keep 12 months of detailed data to protect our data integrity.',
                              style: TextStyle(
                                color: Color(0xFFEF9040),
                                fontFamily: 'raleway',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10), // Add spacing
                      StatGraphContainer(views: viewList),
                      SizedBox(height: 10),
                      Text(
                        'Review your Profile Analytics',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.6,
                          fontFamily: 'ralewayBold',
                        ),
                      ),
                      SizedBox(height: 10),
                      Text.rich(
                        TextSpan(
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.60,
                            fontFamily: 'raleway',
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(text: 'Gain '),
                            TextSpan(
                              text: 'valuable insights',
                              style: TextStyle(
                                color: Color(0xFFEF9040),
                                fontFamily: 'ralewaybold',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                                text:
                                    ' into your panel beater business\'s performance. '),
                            TextSpan(
                              text:
                                  'Please note that we only keep 12 months of detailed data to protect our data integrity.',
                              style: TextStyle(
                                color: Color(0xFFEF9040),
                                fontFamily: 'raleway',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                          height: MyUtility(context).height * 0.5,
                          child: DraggableScrollbar.rrect(
                            controller: _scrollController,
                            backgroundColor: Color(0x7F9E9E9F),
                            alwaysVisibleScrollThumb: true,
                            child: ListView.builder(
                              controller: _scrollController,
                              itemCount: viewList.length,
                              itemBuilder: (context, index) {
                                final document = viewList[index];

                                DateTime viewDate = (document['date']).toDate();

                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(viewDate!);

                                String formattedTime =
                                    DateFormat('hh:mm a').format(viewDate);
                                return PerformanceListContainer(
                                  ipAddress: document['ip']!,
                                  linkReference: "No DATA ,CHECK with CLIENT",
                                  dateAndTime:
                                      "${formattedDate} ${formattedTime}",
                                  isEven: index % 2 == 0,
                                );
                              },
                            ),
                          )),
                    ],
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
