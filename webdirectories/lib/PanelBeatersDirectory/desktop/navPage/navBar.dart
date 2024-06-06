import 'package:flutter/material.dart';

import 'dart:ui'; // Import for ImageFilter
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      height: 1167,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.56, -0.83),
          end: Alignment(-0.56, 0.83),
          colors: [
            Colors.white.withOpacity(0.10),
            Colors.white.withOpacity(0.40),
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
              6,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0),
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
        ],
      ),
    );
  }
}
