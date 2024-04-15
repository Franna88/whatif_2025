import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MyUtility(context).height * 0.4,
      decoration: BoxDecoration(
        color: Color(0xFFD9D9D9),
      ),
      child: Center(
        child: Text(
          "Google Maps",
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'ralewaysemi',
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
