import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class DirectoryContainer extends StatefulWidget {
  String Title1;
  String Title2;
  String description;
  int menuIndex;
  Function(int) changeMenu;
  final VoidCallback onpress;
  final PageController pageController;

  DirectoryContainer({
    Key? key,
    required this.menuIndex,
    required this.Title1,
    required this.Title2,
    required this.description,
    required this.changeMenu,
    required this.onpress,
    required this.pageController,
  }) : super(key: key);

  @override
  State<DirectoryContainer> createState() => _DirectoryContainerState();
}

class _DirectoryContainerState extends State<DirectoryContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width / 1.15,
      height: MyUtility(context).height / 1.63,
      decoration: BoxDecoration(
        color: Color(0xFF0E1013),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          SizedBox(
            height: MyUtility(context).height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  widget.pageController.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.keyboard_arrow_left),
                    onPressed: () {
                      widget.changeMenu(widget.menuIndex - 1);
                      widget.pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                    color: Colors.black,
                    iconSize: 30,
                    padding: EdgeInsets.all(0),
                    splashRadius: 20,
                    constraints: BoxConstraints(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${widget.menuIndex + 1} / 5 ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  widget.pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.keyboard_arrow_right),
                    onPressed: () {
                      widget.changeMenu(widget.menuIndex + 1);
                      widget.pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                    color: Colors.black,
                    iconSize: 30,
                    padding: EdgeInsets.all(0),
                    splashRadius: 20,
                    constraints: BoxConstraints(),
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: SizedBox(
              width: MyUtility(context).width / 1.15,
              height: MyUtility(context).height * 0.14,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: 'raleway',
                    fontSize: 42,
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(
                      text: widget.Title1,
                      style: TextStyle(
                        fontFamily: 'ralewaybold',
                        fontSize: 42,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: widget.Title2,
                      style: TextStyle(
                        fontFamily: 'raleway',
                        fontSize: 42,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: MyUtility(context).height * 0.01,
          ),
          SizedBox(
            width: MyUtility(context).width / 1.25,
            height: MyUtility(context).height * 0.265,
            child: Text(
              widget.description,
              style: TextStyle(
                fontFamily: 'raleway',
                fontSize: 20,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: MyUtility(context).height * 0.02,
          ),
          SizedBox(
            width: 200,
            height: MyUtility(context).height * 0.06,
            child: ElevatedButton(
              onPressed: widget.onpress,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: EdgeInsets.symmetric(horizontal: 0),
              ),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center the content
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    padding:
                        EdgeInsets.all(1), // Reduce padding around the icon
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 8), // Adjust space between the icon and text
                  Text(
                    'View Directory',
                    style: TextStyle(
                      fontFamily: 'raleway',
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
