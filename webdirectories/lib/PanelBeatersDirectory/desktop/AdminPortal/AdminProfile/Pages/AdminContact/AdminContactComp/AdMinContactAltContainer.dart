import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/myutility.dart';

class AdminContactAltContainer extends StatelessWidget {
  final String type;
  final String contactPerson;
  final String phone;
  final String email;
  final VoidCallback pressEdit;
  final VoidCallback pressDelete;
  final bool isEven;

  const AdminContactAltContainer({
    super.key,
    required this.type,
    required this.contactPerson,
    required this.phone,
    required this.email,
    required this.pressEdit,
    required this.pressDelete,
    required this.isEven,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: isEven ? Color(0xFF0E1013) : Color(0x7F292E31),
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          alignment: Alignment.centerLeft,
          height: MyUtility(context).height * 0.065,
          child: Row(
            children: [
              // Type
              Expanded(
                flex: 2,
                child: Text(
                  type,
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
              // Contact Person
              Expanded(
                flex: 2,
                child: Text(
                  contactPerson,
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
              // Phone
              Expanded(
                flex: 2,
                child: Text(
                  phone,
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
              // Email
              Expanded(
                flex: 3,
                child: Text(
                  email,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.64,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
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
        ),
      ],
    );
  }
}
