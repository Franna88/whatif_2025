import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webdirectories/myutility.dart';

class SideNavButton extends StatelessWidget {
  final String icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  SideNavButton({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: isSelected
              ? Color(0xFFEF9040).withOpacity(0.2)
              : Colors.transparent,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MyUtility(context).width * 0.11,
                  child: Row(
                    children: [
                      SizedBox(
                        width: MyUtility(context).width * 0.03,
                        height: MyUtility(context).height * 0.035,
                        child: SvgPicture.asset(
                          icon,
                          width: 24,
                          height: 24,
                          color: isSelected ? Color(0xFFEF9040) : Colors.white,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        label,
                        style: TextStyle(
                          fontSize: 20,
                          color: isSelected ? Color(0xFFEF9040) : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
