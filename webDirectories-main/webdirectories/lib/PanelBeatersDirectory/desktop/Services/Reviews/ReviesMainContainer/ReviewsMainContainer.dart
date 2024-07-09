import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/LeaveReview/LeaveReview.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/ReviesMainContainer/LeftReviews/LeftReviews.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/ReviesMainContainer/RatingReviews/RatingReviews.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/ReviewsComponents/ReviewIconButtons.dart';
import 'package:webdirectories/myutility.dart';

class ReviewsMainContainer extends StatefulWidget {
  const ReviewsMainContainer({super.key});

  @override
  State<ReviewsMainContainer> createState() => _ReviewsMainContainerState();
}

class _ReviewsMainContainerState extends State<ReviewsMainContainer> {
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
      RatingReviews(changePageIndex: changePageIndex),
      LeaveReview(changePageIndex: changePageIndex),
    ];
    return Container(
      width: MyUtility(context).width * 0.84,
      height: MyUtility(context).height * 0.7,
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
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Loved your experience?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MyUtility(context).width * 0.011,
                      fontFamily: 'ralewaybold',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text:
                        " Tell us about it! We appreciate positive feedback that helps us recognize and reward our amazing staff.\n",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MyUtility(context).width * 0.011,
                      fontFamily: 'raleway',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: "Didn't meet your expectations?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MyUtility(context).width * 0.011,
                      fontFamily: 'ralewaybold',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text:
                        " We want to hear why.  Your feedback is crucial to help us improve and ensure we deliver the best service possible.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MyUtility(context).width * 0.011,
                      fontFamily: 'raleway',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [reviewPages[pageIndex], LeftReviews()],
          ),
          SizedBox(
            width: MyUtility(context).width / 1.3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ReviewIconButton(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
