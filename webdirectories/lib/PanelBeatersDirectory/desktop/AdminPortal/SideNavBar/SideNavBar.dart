import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminJobFinder/AdminJobFinder.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/AdminProfile.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Advertisement/Advertisement.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DasboardComp/Notifications.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/Dashboard.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/ManageUsers/ManageUsers.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Notifications/AdminNotifications.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/SideNavBar/SideNavButton/SideNavButton.dart';
import 'package:webdirectories/myutility.dart';

class SideNavBar extends StatefulWidget {
  const SideNavBar({Key? key}) : super(key: key);

  @override
  State<SideNavBar> createState() => _SideNavBarState();
}

class _SideNavBarState extends State<SideNavBar> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    var pages = [
      Dashboard(),
      AdminProfile(),
      Advertisement(),
      ManageUsers(),
      AdminNotifications(),
      AdminJobFinder()
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
                      isSelected: _selectedIndex == 5,
                      onTap: () => _onItemTapped(5),
                    ),
                    SideNavButton(
                      icon: 'images/jobrequests.svg',
                      label: 'Edit Specials & Promotions',
                      isSelected: _selectedIndex == 5,
                      onTap: () => _onItemTapped(5),
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
