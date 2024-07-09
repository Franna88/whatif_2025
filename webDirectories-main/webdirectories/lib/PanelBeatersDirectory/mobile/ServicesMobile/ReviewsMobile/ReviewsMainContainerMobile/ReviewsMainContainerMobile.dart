import 'package:flutter/material.dart';



import 'package:webdirectories/myutility.dart';

import '../LeaveReviewMobile/LeaveReviewMobile.dart';
import 'LeftReviewsMobile/LeftReviewsMobile.dart';
import 'RatingReviewsMobile/RatingReviewsMobile.dart';

class ReviewsMainContainerMobile extends StatefulWidget {
  const ReviewsMainContainerMobile({super.key});

  @override
  State<ReviewsMainContainerMobile> createState() =>
      _ReviewsMainContainerMobileState();
}

class _ReviewsMainContainerMobileState
    extends State<ReviewsMainContainerMobile> {
  var pageIndex = 0;

  //this function changes page index
  changePageIndex(value) {
    setState(() {
      pageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    List reviewPages = [
      RatingReviewsMobile(changePageIndex: changePageIndex),
      LeaveReviewMobile(changePageIndex: changePageIndex),
    ];
    return SingleChildScrollView(
      child: Container(
        width: MyUtility(context).width * 0.9,
        decoration: ShapeDecoration(
          color: Color(0xFF181B1D),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: MyUtility(context).height * 0.01,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: reviewPages[pageIndex],
              ),
            ),
            /*RatingReviewsMobile(),
            LeaveReviewMobile(),*/
            SizedBox(
              height: MyUtility(context).height * 0.01,
            ),
            LeftReviewsMobile(),
          ],
        ),
      ),
    );
  }
}
