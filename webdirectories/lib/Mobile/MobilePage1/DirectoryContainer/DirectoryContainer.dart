import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class DirectoryContainer extends StatefulWidget {
  final String page;
  final String headlinebold;
  final String headline;
  final String discription;
  final VoidCallback onpress;
  final PageController pageController;

  const DirectoryContainer({
    Key? key,
    required this.page,
    required this.headlinebold,
    required this.headline,
    required this.discription,
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
      height: MyUtility(context).height / 1.8,
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
                      widget.pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                    color: Colors.black,
                    iconSize: 20,
                    padding: EdgeInsets.all(8),
                    splashRadius: 20,
                    constraints: BoxConstraints(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.page,
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
                      widget.pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                    color: Colors.black,
                    iconSize: 20,
                    padding: EdgeInsets.all(8),
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
              height: MyUtility(context).height * 0.13,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: 'raleway',
                    fontSize: 48,
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(
                      text: widget.headlinebold,
                      style: TextStyle(
                        fontFamily: 'ralewaybold',
                        fontSize: 48,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: widget.headline,
                      style: TextStyle(
                        fontFamily: 'raleway',
                        fontSize: 48,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: MyUtility(context).width / 1.15,
            height: MyUtility(context).height * 0.25,
            child: Text(
              widget.discription,
              style: TextStyle(
                fontFamily: 'raleway',
                fontSize: 23,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: MyUtility(context).width * 0.5,
            height: 50,
            child: ElevatedButton(
              onPressed: widget.onpress,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    padding: EdgeInsets.all(8),
                    child: Icon(Icons.keyboard_arrow_right),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Learn More',
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
