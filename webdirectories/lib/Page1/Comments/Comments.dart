import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/Page1/Comments/CommentsComponents/CommentsContainer.dart';
import 'package:webdirectories/myutility.dart';

class Comments extends StatefulWidget {
  const Comments({Key? key}) : super(key: key);

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MyUtility(context).width / 1.2,
          height: MyUtility(context).height * 0.32,
          child: PageView(
            controller: _pageController,
            children: [
              CommentsContainer(
                profileimage: 'images/pfp.png',
                comment:
                    "“ I've been taking my car to the same panel beater for years, and I've always been happy with their service. Johan and his team is always honest and upfront about the cost, and they do a great job. I highly recommend the Panel Beater Directory to anyone looking to find a reliable auto body repairer. “",
                username: 'Stephan Williams',
              ),
              CommentsContainer(
                profileimage: 'images/pfp2.png',
                comment:
                    "“ I've been taking my car to the same panel beater for years, and I've always been happy with their service. Johan and his team is always honest and upfront about the cost, and they do a great job. I highly recommend the Panel Beater Directory to anyone looking to find a reliable auto body repairer. “",
                username: 'Lisa Thornberg',
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                _pageController.previousPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              },
              icon: SvgPicture.asset(
                'images/arrowr.svg',
                width: 24,
                height: 24,
              ),
            ),
            IconButton(
              onPressed: () {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              },
              icon: SvgPicture.asset(
                'images/arrowc.svg',
                width: 24,
                height: 24,
              ),
            ),
          ],
        ),
        SizedBox(
          height: MyUtility(context).height * 0.05,
        ),
      ],
    );
  }
}
