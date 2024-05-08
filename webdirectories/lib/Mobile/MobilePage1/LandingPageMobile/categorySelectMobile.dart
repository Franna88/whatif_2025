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
  @override
  void initState() {
    _controller = AnimationController(
      lowerBound: -0.6,
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _controller.animateTo(-0.35);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
              top: 10,
              left: 0,
              child: Container(
                child: SvgPicture.asset(
                  'images/centerGauge2.svg',
                  width: 325,
                  height: 325,
                ),
              ),
            ),
            Positioned(
              top: 18,
              left: 107 - 10,
              child: GestureDetector(
                onTap: () {
                  widget.changeMenu(2);
                  _controller.animateTo(0.0);
                },
                child: Container(
                  child: SvgPicture.asset(
                    widget.menuIndex == 2
                        ? 'images/fuelSvg.svg'
                        : 'images/top1.svg',
                    width: 1,
                    height: 125,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 65,
              left: 28 - 10,
              child: GestureDetector(
                onTap: () {
                  widget.changeMenu(1);
                  _controller.animateTo(-0.15);
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
              left: 55 - 10,
              child: GestureDetector(
                onTap: () {
                  widget.changeMenu(0);
                  _controller.animateTo(-0.35);
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
              right: 38 + 10,
              child: GestureDetector(
                onTap: () {
                  widget.changeMenu(3);
                  _controller.animateTo(0.17);
                },
                child: Container(
                  child: SvgPicture.asset(
                    widget.menuIndex == 3
                        ? 'images/hammerSvg.svg'
                        : 'images/rightb.svg',
                    width: 1,
                    height: 100,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 145,
              right: 15 + 10,
              child: GestureDetector(
                onTap: () {
                  widget.changeMenu(4);
                  _controller.animateTo(0.325);
                },
                child: Container(
                  child: SvgPicture.asset(
                    widget.menuIndex == 4
                        ? 'images/rightDownWhite1.svg'
                        : 'images/rightDown.svg',
                    width: 1,
                    height: 118,
                  ),
                ),
              ),
            ),
            Positioned(
              top: top - 10,
              right: right + 10,
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
