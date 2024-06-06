import 'package:flutter/material.dart';

class MobileCheckMarkText extends StatelessWidget {
  String text;
  MobileCheckMarkText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return





Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.zero,
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 14,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    text,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.white,
                        
                        fontSize: 14,
                        fontFamily: 'raleway',
                        letterSpacing: 0.5),
                  ),
                )
              ],
            ),
          );}}