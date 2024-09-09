import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DasboardComp/DashPartsandQuote.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DashboardContainers/DashEditProfile.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DashboardContainers/DashGraph.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DashboardContainers/DashJobFinder.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DashboardContainers/DashNotificationsUp.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DashboardContainers/DashProfileView.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DashboardContainers/GraphContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DashboardContainers/IconTotalContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DashboardContainers/JobFinderOverviewContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DashboardContainers/NotificationsContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DashboardContainers/WelcomeBack.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

class Dashboard extends StatefulWidget {
  final Function(int) navigateToPage;

  const Dashboard({super.key, required this.navigateToPage});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _firestore = FirebaseFirestore.instance;
  String _title = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Container(
      width: MyUtility(context).width,
      height: MyUtility(context).height,
      decoration: BoxDecoration(color: Color(0xFF171616)),
      child: Padding(
        padding: EdgeInsets.only(
          left: widthDevice < 1500 ? 15 : 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /* DashProfileView(
              onPress: () {
                widget.navigateToPage(14);
              },
              connectToIndexPage: true, // Enables page navigation via dropdown
            ),*/
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                /*WelcomeBack(),*/
                DashEditProfile(),
                SizedBox(
                  width: widthDevice < 1500 ? 15 : 30,
                ),
                /*GraphContaier()*/
                DashGraph()
              ],
            ),
            SizedBox(
              height: widthDevice < 1500 ? 15 : 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                /*Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IcontTotalContainer(
                      iconpath: 'images/jobrequests.svg',
                      description: 'Job Requests',
                      total: '100',
                      colorsvgBack: Color(0xFFEF9040),
                    ),
                    IcontTotalContainer(
                      iconpath: 'images/totalviews.svg',
                      description: 'Total Views',
                      total: '600',
                      colorsvgBack: Color(0xFF0F253A),
                    ),
                    IcontTotalContainer(
                      iconpath: 'images/totalnotifications.svg',
                      description: 'Total\nNotifications',
                      total: '80',
                      colorsvgBack: Color(0xFF212529),
                    ),
                  ],
                ),*/
                /* SizedBox(
                  width: MyUtility(context).width * 0.1,
                )*/
              ],
            ),

            /* SizedBox(
              height: widthDevice < 1500 ? 15 : 30,
            ),*/
            SizedBox(
              height: MyUtility(context).height * 0.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //Notificationscontainer(),
                  DashJobFinder(),
                  SizedBox(
                    width: widthDevice < 1500 ? 15 : 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Dashpartsandquote(
                          containerText: 'Parts & Equipment\nPlatform',
                          containerNumber: '*51',
                          svgImage: 'images/gear1.svg',
                        ),
                      ),
                      Dashpartsandquote(
                        containerText: 'Request a\nQuote',
                        containerNumber: '*51',
                        svgImage: 'images/quote.svg',
                      ),
                      Dashpartsandquote(
                        svgImage: 'images/quote.svg',
                        containerText: 'View My Latest\nLightstone Results',
                        containerNumber: '',
                      ),
                    ],
                  ),
                  SizedBox(
                    width: widthDevice < 1500 ? 15 : 30,
                  ),
                  DashNotificationsUp()
                  //JobFinderOverviewContainer()
                  //Notificationscontainer()
                ],
              ),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            )
          ],
        ),
      ),
    );
  }
}
