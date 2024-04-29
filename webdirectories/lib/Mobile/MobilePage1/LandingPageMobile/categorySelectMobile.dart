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

class _CategorySelectMobileState extends State<CategorySelectMobile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  double top = 100;
  double right = 130;
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
          //    top = 80;
          //     right = 10;

          break;
        case 0.2:
          //    top = 90;
          //     right = 100;
          _controller.animateTo(0.2);
          break;
        case 0.4:
          //    top = 125;
          //    right = 100;
          _controller.animateTo(0.4);
          break;
        case 0.7:
          //   top = 110;
          //   right = 160;
          _controller.animateTo(0.7);
          break;
        case 0.8:
          //   top = 95;
          //   right = 165;
          _controller.animateTo(0.8);
          break;
        case 1.0:
          //   top = 80;
          //right = 135;
          _controller.animateTo(1.0);
          break;
      }
      /* */
    });
  }

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
                  'images/centergauge2.svg',
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
                  updateValue(1.0);
                },
                child: Container(
                  child: SvgPicture.asset(
                    widget.menuIndex == 2
                        ? 'images/topWhite1.svg'
                        : 'images/topb1.svg',
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
                  updateValue(0.8);
                },
                child: Container(
                  child: SvgPicture.asset(
                    widget.menuIndex == 1
                        ? 'images/leftWhite.svg'
                        : 'images/leftb.svg',
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
                  updateValue(0.7);
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
              right: 38,
              child: GestureDetector(
                onTap: () {
                  widget.changeMenu(3);
                  updateValue(0.2);
                },
                child: Container(
                  child: SvgPicture.asset(
                    widget.menuIndex == 3
                        ? 'images/rightWhite1.svg'
                        : 'images/rightb.svg',
                    width: 1,
                    height: 100,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 145,
              right: 15,
              child: GestureDetector(
                onTap: () {
                  widget.changeMenu(4);
                  updateValue(0.4);
                },
                child: Container(
                  child: SvgPicture.asset(
                    widget.menuIndex == 4
                        ? 'images/rightDownWhite1.svg'
                        : 'images/rightDownb.svg',
                    width: 1,
                    height: 118,
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
                      height: 150.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/red1.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
              ),
            ),
            /* */
          ],
        ),
      ],
    );
  }
}
