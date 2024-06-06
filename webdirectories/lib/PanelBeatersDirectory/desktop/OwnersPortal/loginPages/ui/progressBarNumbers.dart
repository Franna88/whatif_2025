import 'package:flutter/cupertino.dart';

class ProgressBarNumbers extends StatelessWidget {
  String number;
  ProgressBarNumbers({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 5.1,
      top: 5.1,
      child: Text(
        //NUMBER
        number,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFF5F6368),
          fontSize: 13,
          fontFamily: 'raleway',
          fontWeight: FontWeight.w500,
          height: 0,
        ),
      ),
    );
  }
}
