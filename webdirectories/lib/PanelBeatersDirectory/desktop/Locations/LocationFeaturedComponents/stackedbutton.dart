import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Locations/LocationFeatured.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Locations/LocationOther.dart';

class StackedButtons extends StatefulWidget {
  const StackedButtons({super.key});

  @override
  State<StackedButtons> createState() => _StackedButtonsState();
}

class _StackedButtonsState extends State<StackedButtons> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 50,
      child: Stack(
        children: [
          Positioned(
            top: 15,
            left: 100,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LocationOther()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                fixedSize: Size(126, 40),
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
                  MaterialPageRoute(builder: (context) => LocationFeatured()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFF8728),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                fixedSize: Size(126, 40),
                padding: EdgeInsets.only(right: -10),
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
