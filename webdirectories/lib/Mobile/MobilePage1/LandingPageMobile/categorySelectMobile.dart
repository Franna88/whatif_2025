import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/myutility.dart';

class CategorySelectMobile extends StatefulWidget {
  int menuIndex;
  Function(int) changeMenu;
  CategorySelectMobile(
      {super.key, required this.menuIndex, required this.changeMenu});

  @override
  State<CategorySelectMobile> createState() => _CategorySelectMobileState();
}

class _CategorySelectMobileState extends State<CategorySelectMobile> {
  @override
  Widget build(BuildContext context) {
    double width = MyUtility(context).width;

    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Stack(
          children: [
            Container(
              width: 335,
              height: 335,
            ),
            Positioned(
              top: 25,
              left: 25,
              child: Container(
                child: SvgPicture.asset(
                  'images/centerGauge.svg',
                  width: 300,
                  height: 300,
                ),
              ),
            ),
            Positioned(
              top: 18,
              left: 107,
              child: GestureDetector(
                onTap: () {
                  widget.changeMenu(2);
                },
                child: Container(
                  child: SvgPicture.asset(
                    widget.menuIndex == 2
                        ? 'images/topWhite.svg'
                        : 'images/top.svg',
                    width: 1,
                    height: 125,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 65,
              left: 28,
              child: GestureDetector(
                onTap: () {
                  widget.changeMenu(1);
                },
                child: Container(
                  child: SvgPicture.asset(
                    widget.menuIndex == 1
                        ? 'images/leftWhite.svg'
                        : 'images/left.svg',
                    width: 1,
                    height: 130,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 170,
              left: 55,
              child: GestureDetector(
                onTap: () {
                  widget.changeMenu(0);
                },
                child: Container(
                  child: SvgPicture.asset(
                    widget.menuIndex == 0
                        ? 'images/leftDownWhite.svg'
                        : 'images/leftDown.svg',
                    width: 1,
                    height: 100,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 68,
              right: 27,
              child: GestureDetector(
                onTap: () {
                  widget.changeMenu(3);
                },
                child: Container(
                  child: SvgPicture.asset(
                    widget.menuIndex == 3
                        ? 'images/rightWhite.svg'
                        : 'images/right.svg',
                    width: 1,
                    height: 100,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 145,
              right: 7,
              child: GestureDetector(
                onTap: () {
                  widget.changeMenu(4);
                },
                child: Container(
                  child: SvgPicture.asset(
                    widget.menuIndex == 4
                        ? 'images/rightDownWhite.svg'
                        : 'images/rightDown.svg',
                    width: 1,
                    height: 118,
                  ),
                ),
              ),
            ),
            /* */
          ],
        ),
      ],
    );
  }
}
