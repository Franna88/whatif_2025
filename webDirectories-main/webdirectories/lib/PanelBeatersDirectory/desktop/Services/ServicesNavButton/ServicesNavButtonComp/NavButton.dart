import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webdirectories/myutility.dart';

class NavButton extends StatelessWidget {
  final String navIcon;
  final String navText;
  final bool isSelected;
  final VoidCallback onTap;

  const NavButton({
    Key? key,
    required this.navIcon,
    required this.navText,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MyUtility(context).height * 0.05,
        decoration: ShapeDecoration(
          color: isSelected ? Color(0xFF0E1013) : Colors.transparent,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: isSelected ? Colors.white : Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(37.99),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: isSelected,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: SvgPicture.asset(
                  navIcon,
                  width: 20,
                  height: 20,
                  color: Color(0xFFFF8728),
                ),
              ),
              SizedBox(width: 8),
              Text(
                navText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MyUtility(context).width * 0.0145,
                  fontFamily: 'raleway',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
