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
  double right = 185;
  @override
  void initState() {
    //animation start
    _controller = AnimationController(
      lowerBound: -0.6,
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _controller.animateTo(-0.32);
    super.initState();
  }

  @override
  void dispose() {
    //end animation
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MyUtility(context).width;

    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 555,
              height: 555,
            ),
            Positioned(
              top: 8,
              left: 33,
              child: Container(
                child: SvgPicture.asset(
                  'images/centerGauge2.svg',
                  width: 500,
                  height: 500,
                ),
              ),
            ),
            Positioned(
              top: 14,
              left: 180,
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
                  _controller.animateTo(-0.15);
                },
                child: Container(
                  child: SvgPicture.asset(
                    widget.menuIndex == 1
                        ? 'images/leftWhite.svg'
                        : 'images/leftb.svg',
                    width: 1,
                    height: 202,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 251,
              left: 95,
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
                  _controller.animateTo(0.17);
                },
                child: Container(
                  child: SvgPicture.asset(
                    widget.menuIndex == 3
                        ? 'images/hammerSvg.svg'
                        : 'images/rightb.svg',
                    width: 1,
                    height: 165,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 218,
              right: 25,
              child: GestureDetector(
                onTap: () {
                  widget.changeMenu(4);

                  _controller.animateTo(0.325);
                },
                child: Container(
                  child: SvgPicture.asset(
                    widget.menuIndex == 4
                        ? 'images/rightdownwhite1.svg'
                        : 'images/rightdownb.svg',
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
                      height: 230.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/red1.png'),
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
