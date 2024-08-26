import 'package:flutter/material.dart';

class DashDropDown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        switch (value) {
          case 'Profile':
            // Navigate to My Profile page
            print('My Profile selected');
            break;
          case 'Logout':
            // Perform logout action
            print('Logout selected');
            break;
        }
      },
      icon: Icon(
        Icons.arrow_drop_down,
        size: 28,
        color: Colors.white,
      ),
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem<String>(
            value: 'Profile',
            child: Text('My Profile', style: TextStyle(fontFamily: 'Raleway')),
          ),
          PopupMenuItem<String>(
            value: 'Logout',
            child: Text('Logout', style: TextStyle(fontFamily: 'Raleway')),
          ),
        ];
      },
    );
  }
}
