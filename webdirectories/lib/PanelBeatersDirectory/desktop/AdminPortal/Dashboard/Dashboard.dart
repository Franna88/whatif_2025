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
import 'package:webdirectories/myutility.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Container(
      width: MyUtility(context).width,
      height: MyUtility(context).height,
      decoration: BoxDecoration(
        color: Color(0xFF181B1D),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            left: widthDevice < 1500 ? 15 : 30,
            top: widthDevice < 1500 ? 15 : 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DashProfileView(),
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
              height: widthDevice < 1500 ? 15 : 30,
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
              height: 315.94,
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
                        child: Dashpartsandquote(),
                      ),
                      Dashpartsandquote(),
                      Dashpartsandquote(),
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
          ],
        ),
      ),
    );
  }
}
