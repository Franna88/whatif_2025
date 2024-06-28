import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    return Container(
      width: MyUtility(context).width,
      height: MyUtility(context).height,
      decoration: BoxDecoration(color: Color(0xFFF4F4F4)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [WelcomeBack(), GraphContaier()],
          ),
          SizedBox(
            width: MyUtility(context).width * 0.75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MyUtility(context).width * 0.45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  ),
                ),
                SizedBox(
                  width: MyUtility(context).width * 0.1,
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Notificationscontainer(), JobFinderOverviewContainer()],
          ),
        ],
      ),
    );
  }
}
