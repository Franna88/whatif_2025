import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class StackedMobileButtons extends StatelessWidget {
  final Function(int) onButtonPressed;
  final int selectedIndex;

  const StackedMobileButtons({
    Key? key,
    required this.selectedIndex,
    required this.onButtonPressed,
  }) : super(key: key);

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
              onPressed: () => onButtonPressed(1),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    selectedIndex == 1 ? Color(0xFFFF8728) : Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                fixedSize: Size(110, 40),
              ),
              child: Text(
                'Other',
                style: TextStyle(
                  color: selectedIndex == 1 ? Colors.black : Colors.white,
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
              onPressed: () => onButtonPressed(0),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    selectedIndex == 0 ? Color(0xFFFF8728) : Colors.black,
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
                  color: selectedIndex == 0 ? Colors.black : Colors.white,
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
