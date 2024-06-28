import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class DaysButton extends StatefulWidget {
  final String day;

  const DaysButton({super.key, required this.day});

  @override
  State<DaysButton> createState() => _DaysButtonState();
}

class _DaysButtonState extends State<DaysButton> {
  bool isSelected = false;

  void _toggleSelected() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 7.5, bottom: 15),
      child: GestureDetector(
        onTap: _toggleSelected,
        child: Container(
          width: MyUtility(context).width * 0.035,
          height: MyUtility(context).height * 0.065,
          decoration: ShapeDecoration(
            color: isSelected ? Color(0xFF0F253A) : Color(0xFFB2BAC6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Center(
            child: Text(
              widget.day,
              style: TextStyle(
                color: Colors.white,
                fontSize: 21.76,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 1.2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
