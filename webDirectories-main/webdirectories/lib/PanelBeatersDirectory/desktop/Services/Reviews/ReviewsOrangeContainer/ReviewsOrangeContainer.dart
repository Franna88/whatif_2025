import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/LightStone/LightStone/LightStone.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/ReviesMainContainer/ReviewsMainContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/ReviewsComponents/ReviewsNavButton.dart';
import 'package:webdirectories/myutility.dart';

class ReviewsOrangeContainer extends StatefulWidget {
  const ReviewsOrangeContainer({super.key});

  @override
  State<ReviewsOrangeContainer> createState() => _ReviewsOrangeContainerState();
}

class _ReviewsOrangeContainerState extends State<ReviewsOrangeContainer> {
  List<Widget> reviewPages = [ReviewsMainContainer(), LightStone()];
  var pageIndex = 0;

  // This function changes page index
  void changePageIndex(int value) {
    setState(() {
      pageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReviewsNAvButton(
              changePageIndex: changePageIndex,
              pageIndex: pageIndex,
            ),
            Container(
              width: MyUtility(context).width * 0.845,
              height: MyUtility(context).height * 0.71,
              decoration: ShapeDecoration(
                color: pageIndex == 0 ? Color(0xFFFF8828) : Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
              ),
              child: Center(
                child: reviewPages[pageIndex],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
