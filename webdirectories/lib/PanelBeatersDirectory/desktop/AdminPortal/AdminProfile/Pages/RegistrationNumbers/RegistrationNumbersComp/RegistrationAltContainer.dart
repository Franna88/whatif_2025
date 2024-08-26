import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class RegistrationAltContainer extends StatelessWidget {
  final String registrationType;
  final String registrationNumber;
  final String displayProfile;
  final VoidCallback pressEdit;
  final VoidCallback pressDelete;
  final bool isEven;

  const RegistrationAltContainer({
    super.key,
    required this.registrationType,
    required this.registrationNumber,
    required this.displayProfile,
    required this.pressEdit,
    required this.pressDelete,
    required this.isEven,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isEven ? Color(0xFF0E1013) : Color(0x7F292E31),
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      alignment: Alignment.centerLeft,
      height: MyUtility(context).height * 0.05,
      child: Row(
        children: [
          // Registration Type
          Expanded(
            flex: 2,
            child: Text(
              registrationType,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.64,
                fontFamily: 'raleway',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          // Vertical Divider
          Container(
            width: 0.5,
            color: Colors.white,
          ),
          SizedBox(width: 10),
          // Registration Number
          Expanded(
            flex: 2,
            child: Text(
              registrationNumber,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.64,
                fontFamily: 'raleway',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          // Vertical Divider
          Container(
            width: 0.5,
            color: Colors.white,
          ),
          SizedBox(width: 10),
          // Display Profile
          Expanded(
            flex: 2,
            child: Text(
              displayProfile,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.64,
                fontFamily: 'raleway',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          // Vertical Divider
          Container(
            width: 0.5,
            color: Colors.white,
          ),
          SizedBox(width: 10),
          // Edit/Delete Buttons
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: pressEdit,
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: pressDelete,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
