import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class LongTextField extends StatefulWidget {
  final TextEditingController controller;
  final String headline;

  const LongTextField({
    Key? key,
    required this.controller,
    required this.headline,
  }) : super(key: key);

  @override
  State<LongTextField> createState() => _LongTextFieldState();
}

class _LongTextFieldState extends State<LongTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20 , right: 20),
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
            width: MyUtility(context).width * 0.38,
            height: MyUtility(context).height * 0.075,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  cursorColor: Colors.black,
                  controller: widget.controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Inter',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
