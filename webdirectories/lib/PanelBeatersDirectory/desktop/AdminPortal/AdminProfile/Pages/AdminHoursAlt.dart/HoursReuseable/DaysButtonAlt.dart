import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class DaysButtonAlt extends StatefulWidget {
  final String day;
  bool isSelected;
  DaysButtonAlt({super.key, required this.day, required this.isSelected});

  @override
  State<DaysButtonAlt> createState() => _DaysButtonAltState();
}

class _DaysButtonAltState extends State<DaysButtonAlt> {
  void _toggleSelected() {
    setState(() {
      widget.isSelected = !widget.isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 7.5, bottom: 15),
      child: GestureDetector(
        onTap: _toggleSelected,
        child: Container(
          width: MyUtility(context).width * 0.025,
          height: MyUtility(context).height * 0.05,
          decoration: ShapeDecoration(
            color: widget.isSelected
                ? Color(0xFFB2BAC6).withOpacity(0.35)
                : Color(0xFFFF7B16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          child: Center(
            child: Text(
              widget.day,
              style: TextStyle(
                color: widget.isSelected ? Colors.white : Colors.white,
                fontSize: 19.76,
                fontFamily: 'raleway',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
