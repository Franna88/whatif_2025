import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/category/categoryText.dart';
import 'package:webdirectories/myutility.dart';

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
              width: 655,
              height: 655,
            ),
            Positioned(
              top: 8,
              left: 33,
              child: Container(
                child: SvgPicture.asset(
                  'images/gauge.svg',
                  width: 600,
                  height: 600,
                ),
              ),
            ),
            Positioned(
              top: 306,
              left: 84,
              child: GestureDetector(
                onTap: () {
                  widget.changeMenu(0);
                  _controller.animateTo(-0.32);
                },
                child: Container(
                  child: SvgPicture.asset(
                    widget.menuIndex == 0
                        ? 'images/cloud2.svg'
                        : 'images/cloud1.svg',
                    width: 1,
                    height: 212,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 101,
              left: 33,
              child: GestureDetector(
                onTap: () {
                  widget.changeMenu(1);
                  _controller.animateTo(-0.16);
                },
                child: Container(
                  child: SvgPicture.asset(
                    widget.menuIndex == 1
                        ? 'images/local2.svg'
                        : 'images/local1.svg',
                    width: 1,
                    height: 257,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 4,
              left: 183,
              child: GestureDetector(
                onTap: () {
                  widget.changeMenu(2);
                  _controller.animateTo(0.0);
                },
                child: Container(
                  child: SvgPicture.asset(
                    widget.menuIndex == 2
                        ? 'images/car2.svg'
                        : 'images/car1.svg',
                    width: 1,
                    height: 259,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 103,
              right: 85,
              child: GestureDetector(
                onTap: () {
                  widget.changeMenu(3);
                  _controller.animateTo(0.17);
                },
                child: Container(
                  child: SvgPicture.asset(
                    widget.menuIndex == 3
                        ? 'images/stack2.svg'
                        : 'images/stack1.svg',
                    width: 1,
                    height: 210,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 259,
              right: 30,
              child: GestureDetector(
                onTap: () {
                  widget.changeMenu(4);

                  _controller.animateTo(0.325);
                },
                child: Container(
                  child: SvgPicture.asset(
                    widget.menuIndex == 4
                        ? 'images/tow2.svg'
                        : 'images/tow1.svg',
                    width: 1,
                    height: 258,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 150,
              right: 238,
              child: Container(
                child: RotationTransition(
                  alignment: Alignment.center,
                  turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                  child: Container(
                    height: 325.0,
                    width: 170.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/red1.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (widget.menuIndex == 0)
              Positioned(
                bottom:130,
                left: 228,
                child: CategoryText(
                  text1: 'Download',
                  text2: 'WATIF',
                ),
              )
            else if (widget.menuIndex == 1)
              Positioned(
                bottom:130,
                left: 228,
                child: CategoryText(
                  text1: 'Body Shop',
                  text2: 'NEAR ME',
                ),
              )
            else if (widget.menuIndex == 2)
              Positioned(
                bottom:130,
                left: 228,
                child: CategoryText(
                  text1: 'Panel Shop',
                  text2: 'SERVICES',
                ),
              )
            else if (widget.menuIndex == 3)
              Positioned(
                bottom:130,
                left: 228,
                child: CategoryText(
                  text1: 'Info &',
                  text2: 'FINANCE',
                ),
              )
            else if (widget.menuIndex == 4)
              Positioned(
                bottom:130,
                left: 228,
                child: CategoryText(
                  text1: 'More',
                  text2: 'SERVICES',
                ),
              )
          ],
        ),
        
      ],
    );
  }
}
