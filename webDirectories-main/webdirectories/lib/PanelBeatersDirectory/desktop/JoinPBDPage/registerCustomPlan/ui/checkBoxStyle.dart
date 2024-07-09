import 'package:flutter/material.dart';

class CheckBoxStyle extends StatefulWidget {
  String description;
  bool checkboxValue;
  CheckBoxStyle(
      {super.key, required this.description, required this.checkboxValue});

  @override
  State<CheckBoxStyle> createState() => _CheckBoxStyleState();
}

class _CheckBoxStyleState extends State<CheckBoxStyle> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: CheckboxListTile(
        
        controlAffinity: ListTileControlAffinity.leading,
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (!states.contains(MaterialState.selected)) {
            return Colors.white;
          }
          return null;
        }),
        side: BorderSide(
          color: Colors.white,
        ),
        visualDensity: VisualDensity(vertical: -4, horizontal: -4),
        contentPadding: EdgeInsets.all(0),
        checkboxShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        value: widget.checkboxValue,
        activeColor: Color(0xFFEF9040),
        checkColor: Colors.white,
        onChanged: (bool? value) {
          setState(() {
            widget.checkboxValue = !widget.checkboxValue;
          });
        },
        title: Text(
          widget.description,
          maxLines: 1,
          style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: 'raleway',
              ),
        ),
      ),
    );
  }
}
