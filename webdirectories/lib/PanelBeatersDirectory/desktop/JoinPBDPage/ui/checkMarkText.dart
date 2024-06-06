import 'package:flutter/material.dart';

class CheckMarkText extends StatelessWidget {
  String text;
  CheckMarkText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return widthDevice > 1290
        ? Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                Container(
                  width: widthDevice / 25,
                  height: heightDevice / 25,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.zero,
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: heightDevice / 50,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  text,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: widthDevice / 73,
                      fontFamily: 'raleway',
                      letterSpacing: 0.5),
                )
              ],
            ),
          )

          //SMALLER SCREENS
        : Padding(
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
                Text(
                  text,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'raleway',
                      letterSpacing: 0.5),
                )
              ],
            ),
          );
  }
}
