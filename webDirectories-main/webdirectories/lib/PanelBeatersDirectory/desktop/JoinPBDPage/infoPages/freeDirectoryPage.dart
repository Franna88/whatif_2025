import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/ui/checkMarkText.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/ui/smallGlassContainer.dart';

class FreeDirectory extends StatefulWidget {
  Function(String) nextContainer;
  FreeDirectory({super.key, required this.nextContainer});

  @override
  State<FreeDirectory> createState() => _FreeDirectoryState();
}

class _FreeDirectoryState extends State<FreeDirectory> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return SmallGlassContainer(
      nextContainer: widget.nextContainer,
      child: Padding(
        padding:  EdgeInsets.only(left: 25, top: widthDevice < 1500 ? 20 : 25, bottom: widthDevice < 1500 ? 20 : 30),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'It is FREE* to be in \nthe ',
                        style: widthDevice < 1500
                            ? const TextStyle(
                                color: Colors.white,
                                fontSize: 60,
                                fontFamily: 'ralewaybold',
                                fontWeight: FontWeight.w700,
                                height: 1,
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(1, 1),
                                    blurRadius: 1,
                                    color: Color.fromARGB(255, 53, 53, 53),
                                  ),
                                ],
                              )
                            : const TextStyle(
                                color: Colors.white,
                                fontSize: 85,
                                fontFamily: 'ralewaybold',
                                fontWeight: FontWeight.w700,
                                height: 1,
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(1, 1),
                                    blurRadius: 1,
                                    color: Color.fromARGB(255, 53, 53, 53),
                                  ),
                                ],
                              )),
                    TextSpan(
                        text: 'Directory',
                        style: widthDevice < 1500
                            ? const TextStyle(
                                color: Color(0xFFEF9040),
                                fontSize: 60,
                                fontFamily: 'ralewaybold',
                                fontWeight: FontWeight.w700,
                                height: 1,
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(1, 1),
                                    blurRadius: 1,
                                    color: Color.fromARGB(255, 53, 53, 53),
                                  ),
                                ],
                              )
                            : const TextStyle(
                                color: Color(0xFFEF9040),
                                fontSize: 85,
                                fontFamily: 'ralewaybold',
                                fontWeight: FontWeight.w700,
                                height: 1,
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(1, 1),
                                    blurRadius: 1,
                                    color: Color.fromARGB(255, 53, 53, 53),
                                  ),
                                ],
                              )),
                  ],
                ),
              ),
              SizedBox(
                height: widthDevice < 1500 ? 18 : 30,
              ),
              CheckMarkText(text: 'Connect with more customers'),
              CheckMarkText(text: 'Boosts your online brand visibility'),
              CheckMarkText(text: 'Take control of your business listing'),
              CheckMarkText(text: 'It\'s easy and only takes a few minutes'),
              const SizedBox(
                height: 50,
              ),
              widthDevice > 1500
                  ? Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
          
                        // youtube button
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
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    isHovered ? Colors.black : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                padding: EdgeInsets.zero,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 5, bottom: 5, left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Stack(
                                      children: [
                                        Positioned(
                                          left: 9,
                                          top: 9,
                                          child: Container(
                                            child: Center(
                                              child: Container(
                                                height: 14,
                                                width: 19,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          child: Center(
                                            child: Icon(
                                              Icons.smart_display,
                                              color: Colors.red,
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'Watch our video',
                                      style: TextStyle(
                                        color: isHovered
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 16,
                                        fontFamily: 'ralewaymedium',
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  //*********** */
                  // SMALLER SCREENS
                  //************* */
                  : Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
          
                        // youtube button
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
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    isHovered ? Colors.black : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: EdgeInsets.zero,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 5, bottom: 5, left: 8, right: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Stack(
                                      children: [
                                        Positioned(
                                          left: 7,
                                          top: 7,
                                          child: Container(
                                            child: Center(
                                              child: Container(
                                                height: 10,
                                                width: 15,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          child: Center(
                                            child: Icon(
                                              Icons.smart_display,
                                              color: Colors.red,
                                              size: 25,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'Watch our video',
                                      style: TextStyle(
                                        color: isHovered
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'ralewaymedium',
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
