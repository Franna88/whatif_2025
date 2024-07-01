import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/SideNavBar/SideNavButton/SideNavButton.dart';

class SideNavBar extends StatefulWidget {
  final ValueChanged<int> onItemSelected;

  const SideNavBar({Key? key, required this.onItemSelected}) : super(key: key);

  @override
  State<SideNavBar> createState() => _SideNavBarState();
}

class _SideNavBarState extends State<SideNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 276.76,
      height: 779.28,
      decoration: BoxDecoration(
        color: Color(0xFF181B1D),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              'images/panLogo.png',
              height: 100,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SideNavButton(
                  icon: 'images/Dashboard.svg',
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
                  icon: 'images/Profile.svg',
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
                  icon: 'images/Notifications.svg',
                  label: 'Notifications',
                  isSelected: _selectedIndex == 4,
                  onTap: () => _onItemTapped(4),
                ),
                SideNavButton(
                  icon: 'images/JobFinder.svg',
                  label: 'Job Finder',
                  isSelected: _selectedIndex == 5,
                  onTap: () => _onItemTapped(5),
                ),
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
    );
  }
}
