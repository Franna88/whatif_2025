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

class _CategorySelectState extends State<CategorySelect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  double top = 145;
  double right = 235;
  double number = 0;
  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

//change position of needle
  updateValue(numberVal) {
    setState(() {
      switch (numberVal) {
        case 0.0:
          top = 120;
          right = 235;
          break;
        case 0.2:
          top = 145;
          right = 190;
          break;
        case 0.4:
          top = 195;
          right = 210;
          break;
        case 0.7:
          top = 165;
          right = 275;
          break;
        case 0.8:
          top = 145;
          right = 265;
          break;
        case 1.0:
          top = 145;
          right = 300;
          break;
      }
    });
  }

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
                  _controller.animateTo(0.0);
                  updateValue(0.0);
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
                  _controller.animateTo(0.8);
                  updateValue(0.8);
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
                  _controller.animateTo(0.7);
                  updateValue(0.7);
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
                  _controller.animateTo(0.2);
                  updateValue(0.2);
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

                  _controller.animateTo(0.4);
                  updateValue(0.4);
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
            Positioned(
              top: top,
              right: right,
              child: Container(
                child: RotationTransition(
                    alignment: Alignment.center,
                    turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                    child: Container(
                      height: 180.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/arrow.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
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
