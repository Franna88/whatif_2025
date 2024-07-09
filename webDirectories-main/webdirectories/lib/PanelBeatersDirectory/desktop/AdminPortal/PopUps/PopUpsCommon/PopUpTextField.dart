import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class PopUpTextField extends StatefulWidget {
  final String text;
  const PopUpTextField({super.key, required this.text});

  @override
  State<PopUpTextField> createState() => _PopUpTextFieldState();
}

class _PopUpTextFieldState extends State<PopUpTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.32,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            height: 1.0,
          ),
        ),
        SizedBox(height: 8.0),
        SizedBox(
          width: MyUtility(context).width * 0.25,
          child: TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
