import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class ProfileShortTextField extends StatefulWidget {
  final TextEditingController controller;
  final String headline;

  const ProfileShortTextField({
    Key? key,
    required this.controller,
    required this.headline,
  }) : super(key: key);

  @override
  State<ProfileShortTextField> createState() => _ProfileShortTextFieldState();
}

class _ProfileShortTextFieldState extends State<ProfileShortTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.headline,
            style: TextStyle(
              color: Color(0xFF0F253A),
              fontSize: 20.4,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              height: 1,
            ),
          ),
          SizedBox(height: 8),
          Container(
            width: MyUtility(context).width * 0.18,
            height: MyUtility(context).height * 0.075,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                controller: widget.controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Inter',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
