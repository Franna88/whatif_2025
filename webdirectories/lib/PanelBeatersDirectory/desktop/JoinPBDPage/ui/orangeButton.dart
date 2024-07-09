import 'package:flutter/material.dart';

class OrangeButton extends StatefulWidget {
  Function onPressed;
  String buttonText;
  OrangeButton({super.key, required this.buttonText, required this.onPressed});

  @override
  State<OrangeButton> createState() => _OrangeButtonState();
}

class _OrangeButtonState extends State<OrangeButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return widthDevice > 1290
        ? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MouseRegion(
                onEnter: (_) {
                  setState(() {
                    isHovered = true;
                  });
                },
                onExit: (_) {
                  setState(() {
                    isHovered = false;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  /*width: MediaQuery.of(context).size.width * 0.08,*/
                  /*height: MediaQuery.of(context).size.height * 0.05,*/
                  child: ElevatedButton(
                    onPressed: () {
                      widget.onPressed();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          isHovered ? Colors.black : Color(0xFFE2822B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8, bottom: 8, left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            widget.buttonText,
                            style: TextStyle(
                              color: isHovered ? Colors.white : Colors.black,
                              fontSize: 16,
                              fontFamily: 'ralewaymedium',
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Icon(
                            Icons.east,
                            color: isHovered ? Colors.white : Colors.black,
                            size: 22,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        //SMALLER SCREENS

        : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MouseRegion(
                onEnter: (_) {
                  setState(() {
                    isHovered = true;
                  });
                },
                onExit: (_) {
                  setState(() {
                    isHovered = false;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  /*width: MediaQuery.of(context).size.width * 0.08,*/
                  /*height: MediaQuery.of(context).size.height * 0.05,*/
                  child: ElevatedButton(
                    onPressed: () {
                      widget.onPressed();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          isHovered ? Colors.black : Color(0xFFE2822B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 4, bottom: 4, left: 6, right: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            widget.buttonText,
                            style: TextStyle(
                              color: isHovered ? Colors.white : Colors.black,
                              fontSize: 14,
                              fontFamily: 'ralewaymedium',
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Icon(
                            Icons.east,
                            color: isHovered ? Colors.white : Colors.black,
                            size: 18,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
