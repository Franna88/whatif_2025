import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminJobFinder/AdminJobFinder.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminLightStoneKai/AdminLightStone.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/AdminProfile.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Advertisement/Advertisement.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DasboardComp/Notifications.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/Dashboard.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/ManageUsers/ManageUsers.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Notifications/AdminNotifications.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Notifications/AdminNotificationsAlt.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/SideNavBar/SideNavButton/SideNavButton.dart';
import 'package:webdirectories/myutility.dart';

import '../AdminJobFinder/JobFinderDetails.dart';
import '../ContactUsPage/OwnersContactUs.dart';
import '../Notifications/CustomerReviews.dart/CustomerReviews.dart';
import '../Notifications/DocumentExpires/DocumentExpired.dart';
import '../Notifications/NotificationMessage.dart/NotificationMessage.dart';
import '../Notifications/SystemAlert.dart/SystemAlert.dart';
import '../PerformanceandStats/PerformanceandStats.dart';

class SideNavBar extends StatefulWidget {
  const SideNavBar({Key? key}) : super(key: key);

  @override
  State<SideNavBar> createState() => _SideNavBarState();
}

class _SideNavBarState extends State<SideNavBar> {
  int _selectedIndex = 11;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // widget.onItemSelected(index);
  }

  void navigateToPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    var pages = [
      Dashboard(),
      AdminProfile(),
      Advertisement(),
      ManageUsers(),
      AdminNotificationsAlt(navigateToPage: navigateToPage),
      SystemAlert(navigateToPage: navigateToPage),
      DocumentExpired(navigateToPage: navigateToPage),
      CustomerReviews(navigateToPage: navigateToPage),
      AdminJobFinder(),
      //JobFinderDetails(),
      AdminLightStone(
        data: null,
      ),
      PerformanceAndStats(),
      OwnersContactUs()
    ];

    return Row(
      children: [
        Container(
          width: MyUtility(context).width / 5.2,
          height: MyUtility(context).height,
          decoration: BoxDecoration(
            color: Color(0xFF181B1D),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  'images/newpandir.png',
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    SideNavButton(
                      icon: 'images/dashicon.svg',
                      label: 'Dashboard',
                      isSelected: _selectedIndex == 0,
                      onTap: () => _onItemTapped(0),
                    ),
                    SideNavButton(
                      icon: 'images/Profile1.svg',
                      label: 'Profile',
                      isSelected: _selectedIndex == 1,
                      onTap: () => _onItemTapped(1),
                    ),
                    SideNavButton(
                      icon: 'images/advert1.svg',
                      label: 'Advertisement',
                      isSelected: _selectedIndex == 2,
                      onTap: () => _onItemTapped(2),
                    ),
                    SideNavButton(
                      icon: 'images/ManageUsers.svg',
                      label: 'Manage Users',
                      isSelected: _selectedIndex == 3,
                      onTap: () => _onItemTapped(3),
                    ),
                    SideNavButton(
                      icon: 'images/totalnotifications.svg',
                      label: 'Notifications',
                      isSelected: _selectedIndex == 4,
                      onTap: () => _onItemTapped(4),
                    ),
                    SideNavButton(
                      icon: 'images/jobrequests.svg',
                      label: 'Job Finder',
                      isSelected: _selectedIndex == 8,
                      onTap: () => _onItemTapped(8),
                    ),
                    SideNavButton(
                      icon: 'images/jobrequests.svg',
                      label: 'Lightstone KAI',
                      isSelected: _selectedIndex == 9,
                      onTap: () => _onItemTapped(9),
                    ),
                    SideNavButton(
                      icon: 'images/advert1.svg',
                      label: 'Profile Performance & Stats',
                      isSelected: _selectedIndex == 10,
                      onTap: () => _onItemTapped(10),
                    ),
                    SideNavButton(
                      icon: 'images/advert1.svg',
                      label: 'Contact Us',
                      isSelected: _selectedIndex == 11,
                      onTap: () => _onItemTapped(11),
                    ),
                    SizedBox(
                        height: widthDevice < 1500
                            ? MyUtility(context).height * 0.23
                            : MyUtility(context).height * 0.38),
                    SideNavButton(
                      icon: 'images/Logout.svg',
                      label: 'Logout',
                      isSelected: _selectedIndex == 6,
                      onTap: () => _onItemTapped(6),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MyUtility(context).width - MyUtility(context).width / 5.2,
          height: MyUtility(context).height,
          child: pages[_selectedIndex],
        )
      ],
    );
  }
}
