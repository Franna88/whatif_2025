import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class HoursAlt extends StatefulWidget {
  final String days;
  final String from;
  final String till;

  const HoursAlt(
      {super.key, required this.days, required this.from, required this.till});

  @override
  State<HoursAlt> createState() => _HoursAltState();
}

class _HoursAltState extends State<HoursAlt> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.317,
      //height: MyUtility(context).height * 0.06,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.days,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.73,
                fontFamily: 'raleway',
              ),
            ),
            Container(
              width: MyUtility(context).width * 0.125,
              height: MyUtility(context).height * 0.045,
              decoration: ShapeDecoration(
                color: Color(0xFFB2BAC6).withOpacity(0.35),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Center(
                child: Text(
                  '${widget.from} - ${widget.till}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.73,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w100,
                    height: 0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
