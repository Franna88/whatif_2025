import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/myutility.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CategorySelect extends StatefulWidget {
  int menuIndex;
  Function(int) changeMenu;
  CategorySelect(
      {super.key, required this.menuIndex, required this.changeMenu});

  @override
  State<CategorySelect> createState() => _CategorySelectState();
}

class _CategorySelectState extends State<CategorySelect> {
  @override
  Widget build(BuildContext context) {
    double width = MyUtility(context).width;

    return Column(
      children: [
        SizedBox(
          height: 100,
        ),
        Stack(
          children: [
            Container(
              width: 555,
              height: 555,
            ),
            Positioned(
              top: 15,
              left: 33,
              child: Container(
                child: SvgPicture.asset(
                  'images/centerGauge.svg',
                  width: 500,
                  height: 500,
                ),
              ),
            ),
            Positioned(
              top: 12,
              left: 180,
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
                    height: 202,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 90,
              left: 58,
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
                    height: 202,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 255,
              left: 95,
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
                    height: 175,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 95,
              right: 65,
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
                    height: 165,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 220,
              right: 25,
              child: GestureDetector(
                onTap: () {
                  widget.changeMenu(4);
                },
                child: Container(
                  child: SvgPicture.asset(
                    widget.menuIndex == 4
                        ? 'images/rightDownWhite.svg'
                        : 'images/rightDown.svg',
                    width: 190,
                    height: 200,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 100,
        ),
      ],
    );
  }
}
