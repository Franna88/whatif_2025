import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webdirectories/PanelBeatersDirectory/panelBeatersHome.dart';
import 'package:webdirectories/WebDirectories/Page4/Page4.dart';
import 'package:webdirectories/myutility.dart';

class CircleTextBox extends StatefulWidget {
  String Title1;
  String Title2;
  String description;
  String url;
  int menuIndex;
  Function(int) changeMenu;
  CircleTextBox(
      {super.key,
      required this.Title1,
      required this.Title2,
      required this.description,
      required this.url,
      required this.menuIndex,
      required this.changeMenu});

  @override
  State<CircleTextBox> createState() => _CircleTextBoxState();
}

class _CircleTextBoxState extends State<CircleTextBox> {
  @override
  Widget build(BuildContext context) {
    double width = MyUtility(context).width;

    changeIndex() {
      setState(() {
        var value = widget.menuIndex + 1;
        widget.changeMenu(value);
      });
    }

    goToLink(url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        // Handle error if URL cannot be launched
        print('Could not launch $url');
      }
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 0, right: 50),
      child: Container(
        width: 500,
        height: 550,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 2, 27, 43),
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 2.5,
          ),
        ),
        child: Container(
          width: 500,
          height: 500,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color.fromARGB(255, 14, 16, 19),
              width: 38.0,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "<  ",
                      style: TextStyle(
                          fontSize: 22,
                          color: const Color.fromARGB(255, 255, 255, 255)),
                    ),
                    Text(
                      "${widget.menuIndex + 1} / 5 ",
                      style: TextStyle(
                          fontSize: 18,
                          color: const Color.fromARGB(255, 255, 255, 255)),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "  >",
                        style: TextStyle(
                            fontSize: 22,
                            color: const Color.fromARGB(255, 255, 255, 255)),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: MyUtility(context).width / 5.5,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: '',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                            text: widget.Title1,
                            style: TextStyle(
                              fontSize: 32,
                              fontFamily: 'ralewaybold',
                              color: const Color.fromARGB(255, 255, 255, 255),
                            )),
                        TextSpan(
                          text: widget.Title2,
                          style: TextStyle(
                              fontSize: 32,
                              fontFamily: 'raleway',
                              color: const Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ],
                    ),
                  ),
                ),

                /*     SizedBox(
                  width: MyUtility(context).width / 5.2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.Title1,
                          style: TextStyle(
                              fontSize: 32,
                              fontFamily: 'ralewaybold',
                              color: const Color.fromARGB(255, 255, 255, 255)),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          widget.Title2,
                          style: TextStyle(
                              fontSize: 32,
                              fontFamily: 'raleway',
                              color: const Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ],
                    ),
                  ),
                ),
           */
                SizedBox(
                  width: MyUtility(context).width / 4.8,
                  height: MyUtility(context).height * 0.18,
                  child: Text(
                    widget.description,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'raleway',
                        color: const Color.fromARGB(255, 255, 255, 255)),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: MyUtility(context).height * 0.05,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: ElevatedButton(
                    onPressed: () {
                      widget.Title2 == "WATIF"
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Material(
                                        child: Page4(),
                                      )))
                          : widget.Title1 == "PANEL BEATER "
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Material(
                                            child: PanelBeatersHome(),
                                          )))
                              : goToLink(widget.url);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () async {},
                          child: Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            padding: EdgeInsets.zero,
                            child: Icon(
                              Icons.keyboard_arrow_right_outlined,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                        SizedBox(width: 4),
                        Text(
                          widget.Title2 == "WATIF"
                              ? 'Learn More'
                              : 'View Directory',
                          style: TextStyle(
                            color: Color(0xFF0C0C0C).withOpacity(0.9),
                            fontSize: 16.5,
                            fontFamily: 'Raleway',
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
