import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class CircleTextBox extends StatefulWidget {
  String Title1;
  String Title2;
  String description;
  int menuIndex;
  CircleTextBox(
      {super.key,
      required this.Title1,
      required this.Title2,
      required this.description,
      required this.menuIndex});

  @override
  State<CircleTextBox> createState() => _CircleTextBoxState();
}

class _CircleTextBoxState extends State<CircleTextBox> {
  @override
  Widget build(BuildContext context) {
    double width = MyUtility(context).width;

    return Container(
      width: MyUtility(context).width / 3.5,
      height: MyUtility(context).height / 2,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 2, 27, 43),
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 2.0,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "<  ",
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'ralewaybold',
                      color: const Color.fromARGB(255, 255, 255, 255)),
                ),
                Text(
                  "${widget.menuIndex + 1} / 5 ",
                  style: TextStyle(
                      fontSize: 18,
                      color: const Color.fromARGB(255, 255, 255, 255)),
                ),
                Text(
                  "  >",
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'ralewaybold',
                      color: const Color.fromARGB(255, 255, 255, 255)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.Title1,
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'ralewaybold',
                      color: const Color.fromARGB(255, 255, 255, 255)),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  widget.Title2,
                  style: TextStyle(
                      fontSize: 25,
                      color: const Color.fromARGB(255, 255, 255, 255)),
                ),
              ],
            ),
            SizedBox(
              width: MyUtility(context).width / 4.5,
              child: Text(
                widget.description,
                style: TextStyle(
                    fontSize: 17,
                    color: const Color.fromARGB(255, 255, 255, 255)),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
