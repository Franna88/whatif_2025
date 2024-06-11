import 'package:flutter/material.dart';

import 'dart:ui'; // Import for ImageFilter
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webdirectories/myutility.dart';

class NavBar extends StatefulWidget {
  final Function(int) onIconTapped;

  // Define a list of icon paths
  final List<String> iconPaths = [
    'images/home.svg',
    'images/pindrop.svg',
    'images/business.svg',
    'images/gears.svg',
    'images/BPD.svg',
    'images/shop.svg',
    'images/ownersportal.svg',
  ];

  final List<String> menuTooltips = [
    'PBD Home',
    'Featured',
    'Job Finder',
    '#WeConnect',
    'Articles',
    'Shop',
    'Owners Login'
  ];

  NavBar({required this.onIconTapped});

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: MyUtility(context).height,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: [
            Color.fromARGB(108, 255, 255, 255),
            const Color.fromARGB(59, 255, 255, 255),
          ],
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
              
              width: 1,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: Colors.white),
        ),
        shadows: [
          BoxShadow(
            color: Color(0xBF000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: -1,
          ),
        ],
      ),
      child: Column(
        children: [
          Column(
            children: List.generate(
              5,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Tooltip(
                  message: widget.menuTooltips[index],
                  textStyle: TextStyle(
                      color: Color(0xFFEF9040), fontFamily: 'raleway'),
                  child: IconButton(
                    icon: SvgPicture.asset(
                      widget.iconPaths[index],
                      width: 40,
                      height: 40,
                      color: selectedIndex == index
                          ? Color(0xFFFF8828)
                          : Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        selectedIndex = index;
                      });

                      widget.onIconTapped(index);
                    },
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0),
            child: Tooltip(
              message: widget.menuTooltips[5],
              
                  textStyle: TextStyle(
                      color: Color(0xFFEF9040), fontFamily: 'raleway'),

              child: IconButton(
                
                icon: SvgPicture.asset(
                  widget.iconPaths[5],
                  width: 50,
                  height: 50,
                  color: selectedIndex == 5 ? Color(0xFFFF8828) : Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    selectedIndex = 5;
                  });
              
                  widget.onIconTapped(5);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Tooltip(
              message: widget.menuTooltips[6],
                  textStyle: TextStyle(
                      color: Color(0xFFEF9040), fontFamily: 'raleway'),
              child: IconButton(
                
                icon: SvgPicture.asset(
                  widget.iconPaths[6],
                  width: 50,
                  height: 50,
                  color: selectedIndex == 6 ? Color(0xFFFF8828) : Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    selectedIndex = 6;
                  });
              
                  widget.onIconTapped(6);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
