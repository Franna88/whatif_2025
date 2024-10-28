import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DashboardContainers/DashProfileView.dart';
import '../PanelBeatersDirectory/desktop/AdminPortal/SideNavBar/SideNavButton/SideNavButton.dart';
import '../WebDirectories/Page1/Page1.dart';
import '../myutility.dart';
import 'ligtstoneExcelProcess/ligtstoneExcelProces.dart';
import 'listings/listings.dart';

class SuperAdmin extends StatefulWidget {
  const SuperAdmin({super.key});

  @override
  State<SuperAdmin> createState() => _SuperAdminState();
}

class _SuperAdminState extends State<SuperAdmin> {
  final PageController _pageController = PageController(initialPage: 0);
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  void navigateToPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  logOut() {
    FirebaseAuth.instance.signOut();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Material(
                  child: Page1(),
                )));
  }

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    var pages = [Listings(), LightStoneExcelProcess()];
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
                      icon: 'images/listings.svg',
                      selectedIcon: 'images/listings.svg',
                      label: 'Listings',
                      isSelected: _selectedIndex == 0,
                      onTap: () => _onItemTapped(0),
                    ),
                    SideNavButton(
                      icon: 'images/dash1.svg',
                      selectedIcon: 'images/dash1.1.svg',
                      label: 'LightStone Uploads',
                      isSelected: _selectedIndex == 1,
                      onTap: () => _onItemTapped(1),
                    ),
                    SideNavButton(
                      icon: 'images/Logout.svg',
                      selectedIcon: 'images/Logout.svg',
                      label: 'Logout',
                      isSelected: _selectedIndex == 6,
                      onTap: () => logOut,
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
          decoration: BoxDecoration(color: Color(0xFF171616)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: DashProfileView(
                  admin: true,
                  onSelect: (index) =>
                      navigateToPage(index), // Ensure this is correct
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  children: pages,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
