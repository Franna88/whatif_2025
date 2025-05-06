import 'package:flutter/material.dart';
import 'dart:math';

class FuelDirectoryDial extends StatefulWidget {
  final Function(int)? onIconTap;
  final double? size;

  const FuelDirectoryDial({
    Key? key,
    this.onIconTap,
    this.size,
  }) : super(key: key);

  @override
  State<FuelDirectoryDial> createState() => _FuelDirectoryDialState();
}

class _FuelDirectoryDialState extends State<FuelDirectoryDial> {
  int _selectedIconIndex = 0;

  // List of icon data - icon path and label
  // Reordered: profile, fuel, panel beaters, towing, auto repair
  final List<Map<String, String>> _dialIcons = [
    {'icon': 'images/watif_profile_icon.png', 'label': 'Profile'},
    {'icon': 'images/fuel_icon.png', 'label': 'Fuel'},
    {'icon': 'images/panel_beater_icon.png', 'label': 'Panel'},
    {'icon': 'images/towing_icon.png', 'label': 'Towing'},
    {'icon': 'images/auto_repair_icon.png', 'label': 'Repair'},
  ];

  void _handleIconTap(int index) {
    setState(() {
      _selectedIconIndex = index;
    });

    if (widget.onIconTap != null) {
      widget.onIconTap!(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double dialSize = widget.size ?? screenSize.width * 0.8;
    final double iconSize = dialSize * 0.15;
    final double centerCircleSize = dialSize * 0.3;

    return SizedBox(
      width: dialSize,
      height: dialSize,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Main dial background
          Container(
            width: dialSize,
            height: dialSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF1E3048),
              border: Border.all(color: Colors.grey.shade800, width: 1),
            ),
          ),

          // Center circle with label
          Container(
            width: centerCircleSize,
            height: centerCircleSize,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF0A1622),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'fuel',
                    style: TextStyle(
                      fontSize: dialSize * 0.065,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'directory',
                    style: TextStyle(
                      fontSize: dialSize * 0.035,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Dial section buttons arranged in a circle
          ...List.generate(_dialIcons.length, (index) {
            // Calculate position on the circle
            // Start from bottom left (-135 degrees) and go clockwise
            final double angle =
                (2 * pi * index) / _dialIcons.length + (3 * pi / 4);
            final double radius = (dialSize - iconSize) / 2.5;

            final double x = radius * cos(angle);
            final double y = radius * sin(angle);

            final bool isSelected = _selectedIconIndex == index;
            final Color sectionColor =
                isSelected ? const Color(0xFF011F33) : const Color(0xFF2A3F55);

            return Positioned(
              left: (dialSize / 2) + x - (iconSize / 2),
              top: (dialSize / 2) + y - (iconSize / 2),
              child: GestureDetector(
                onTap: () => _handleIconTap(index),
                child: Container(
                  width: iconSize,
                  height: iconSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: sectionColor,
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 8,
                              spreadRadius: 1,
                            )
                          ]
                        : null,
                  ),
                  child: Center(
                    child: Image.asset(
                      _dialIcons[index]['icon']!,
                      width: iconSize * 0.6,
                      height: iconSize * 0.6,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
