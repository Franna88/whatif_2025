import 'package:flutter/material.dart';

class DirectoryTopBar extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback? onBackPressed;
  final Color startColor;
  final Color endColor;
  final String mainTitle;
  final String subTitle;

  const DirectoryTopBar({
    Key? key,
    required this.title,
    required this.iconPath,
    this.onBackPressed,
    this.startColor = const Color(0xFF2D6E35), // Default darker green
    this.endColor = const Color(0xFF45A94E), // Default lighter green
    this.mainTitle = 'fuel',
    this.subTitle = 'directory',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double iconSize = screenSize.width * 0.08;
    final double fontSize = screenSize.width * 0.07;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenSize.width * 0.06,
        vertical: screenSize.height * 0.02,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left side with icon and text
          Row(
            children: [
              // Icon with gradient container
              Container(
                width: iconSize * 1.8,
                height: iconSize * 1.8,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      startColor,
                      endColor,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Image.asset(
                    iconPath,
                    width: iconSize,
                    height: iconSize,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: screenSize.width * 0.03),
              // Title
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mainTitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subTitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize * 0.6,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Menu icon on the right
          GestureDetector(
            onTap: () => Scaffold.of(context).openEndDrawer(),
            child: Icon(
              Icons.menu,
              color: Colors.white,
              size: screenSize.width * 0.08,
            ),
          ),
        ],
      ),
    );
  }
}
