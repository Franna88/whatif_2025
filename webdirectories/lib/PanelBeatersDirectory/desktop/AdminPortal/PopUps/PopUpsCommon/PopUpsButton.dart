import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class PopUpsButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const PopUpsButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  State<PopUpsButton> createState() => _PopUpsButtonState();
}

class _PopUpsButtonState extends State<PopUpsButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: MyUtility(context).width * 0.065,
        height: MyUtility(context).height * 0.055,
        decoration: ShapeDecoration(
          color: Color(0xFFEF9040),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.32,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
        ),
      ),
    );
  }
}
