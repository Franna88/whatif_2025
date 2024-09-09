import 'package:flutter/material.dart';

class DashDropDown extends StatelessWidget {
  final VoidCallback? onPress;

  const DashDropDown({Key? key, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        print("Selected: $value");
        switch (value) {
          case 'Profile':
            if (onPress != null) {
              print("Navigating to page 14");
              onPress!(); // Call the onPress callback
            } else {
              print('onPress callback is null');
            }
            break;

          case 'Logout':
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
