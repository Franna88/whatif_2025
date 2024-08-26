import 'package:flutter/material.dart';

class AddButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const AddButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  _AddButtonState createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            _isHovered = true;
          });
        },
        onExit: (_) {
          setState(() {
            _isHovered = false;
          });
        },
        child: GestureDetector(
          onTap: widget.onPressed,
          child: Container(
            decoration: ShapeDecoration(
              color: Color(0xFFFF8728),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.5),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x7F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Text(
              widget.text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.24,
                fontFamily: 'raleway',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
