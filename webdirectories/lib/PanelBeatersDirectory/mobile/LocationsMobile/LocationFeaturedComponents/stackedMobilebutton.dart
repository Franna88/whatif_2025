import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/LocationsMobile/LocationFeatureMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/LocationsMobile/LocationMobileOther.dart';
import 'package:webdirectories/myutility.dart';

class StackedMobileButtons extends StatefulWidget {
  const StackedMobileButtons({super.key});

  @override
  State<StackedMobileButtons> createState() => _StackedMobileButtonsState();
}

class _StackedMobileButtonsState extends State<StackedMobileButtons> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MyUtility(context).width * 0.55,
      height: 50,
      child: Stack(
        children: [
          Positioned(
            top: 15,
            left: 90,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LocationMobileOther()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                fixedSize: Size(110, 40),
              ),
              child: Text(
                'Other',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.4,
                  fontFamily: 'raleway',
                  fontWeight: FontWeight.w400,
                  height: 1.0,
                ),
              ),
            ),
          ),
          Positioned(
            top: 15,
            left: 0,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LocationFeatureMobile()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFF8728),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                fixedSize: Size(110, 40),
                padding: EdgeInsets.only(right: 12),
              ),
              child: Text(
                'Featured',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.4,
                  fontFamily: 'raleway',
                  fontWeight: FontWeight.w400,
                  height: 1.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
