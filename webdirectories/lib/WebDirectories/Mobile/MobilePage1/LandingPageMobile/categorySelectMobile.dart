import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/myutility.dart';

class CategorySelectMobile extends StatefulWidget {
  int menuIndex;
  Function(int) changeMenu;
  double dialIndex;
  AnimationController animateController;
  CategorySelectMobile(
      {super.key,
      required this.menuIndex,
      required this.changeMenu,
      required this.dialIndex,
      required this.animateController});

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
    _controller.animateTo(-0.31);
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
              top: 4,
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
              top: -10,
              left: 85,
              child: GestureDetector(
                onTap: () {
                  widget.changeMenu(2);
                  widget.animateController.animateTo(0.0);
                },
                child: Container(
                  child: SvgPicture.asset(
                    widget.menuIndex == 2
                        ? 'images/fuelSvg.svg'
                        : 'images/top1.svg',
                    width: 1,
                    height: 143,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 44,
              left: -2,
              child: GestureDetector(
                onTap: () {
                  widget.changeMenu(1);
                  widget.animateController.animateTo(-0.15);
                },
                child: Container(
                  child: SvgPicture.asset(
                    widget.menuIndex == 1
                        ? 'images/leftWhite.svg'
                        : 'images/leftb.svg',
                    width: 1,
                    height: 144.5,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 160,
              left: 27,
              child: GestureDetector(
                onTap: () {
                  widget.changeMenu(0);
                  widget.animateController.animateTo(-0.31);
                },
                child: Container(
                  child: SvgPicture.asset(
                    widget.menuIndex == 0
                        ? 'images/leftDownWhite.svg'
                        : 'images/leftDown.svg',
                    width: 1,
                    height: 120,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 45,
              right: 31,
              child: GestureDetector(
                onTap: () {
                  widget.changeMenu(3);
                  widget.animateController.animateTo(0.17);
                },
                child: /* Container(
                  child: SvgPicture.asset(
                    widget.menuIndex == 3
                        ? 'images/hammerSvg.svg'
                        : 'images/rightb.svg',
                    width: 1,
                    height: 120,
                  ),
                ),*/
                    Container(
                  child: SvgPicture.asset(
                    widget.menuIndex == 3
                        ? 'images/revpan2.svg'
                        : 'images/revpan1.svg',
                    width: 1,
                    height: 120,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 134,
              right: -2,
              child: GestureDetector(
                onTap: () {
                  widget.changeMenu(4);
                  widget.animateController.animateTo(0.325);
                },
                child: Container(
                  child: SvgPicture.asset(
                    widget.menuIndex == 4
                        ? 'images/rightDownWhite.svg'
                        : 'images/rightDown.svg',
                    width: 1,
                    height: 146,
                  ),
                ),
              ),
            ),
            Positioned(
              top: top - 20,
              right: right + 10,
              child: Container(
                child: RotationTransition(
                    alignment: Alignment.center,
                    turns: Tween(begin: 0.0, end: 1.0)
                        .animate(widget.animateController),
                    child: Container(
                      height: 170.0,
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
