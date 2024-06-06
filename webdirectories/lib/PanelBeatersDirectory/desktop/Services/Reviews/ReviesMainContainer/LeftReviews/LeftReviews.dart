import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/ReviesMainContainer/LeftReviews/LeftReviewsComponents/CommentContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/ReviesMainContainer/LeftReviews/LeftReviewsComponents/ReviewFilterButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/ReviesMainContainer/LeftReviews/LeftReviewsComponents/searchBox.dart';
import 'package:webdirectories/myutility.dart';

class LeftReviews extends StatefulWidget {
  const LeftReviews({super.key});

  @override
  State<LeftReviews> createState() => _LeftReviewsState();
}

class _LeftReviewsState extends State<LeftReviews> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MyUtility(context).width * 0.4,
      height: MyUtility(context).height * 0.51,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SearchBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ReviewFilterButton(
                      filterType: 'Date Posted', onPressed: () {}),
                  ReviewFilterButton(filterType: 'Lowest', onPressed: () {}),
                  ReviewFilterButton(filterType: 'Highest', onPressed: () {})
                ],
              )
            ],
          ),
          CommentContainer(
              starRating: '3',
              reviewName: 'Shaun Williams ',
              reviewDate: '25 March 2024',
              review:
                  'Excellent service received. The work they have done on my vehicle is outstanding! There is no indication that any repairs was done, the finishing is flawless.'),
          CommentContainer(
              starRating: '3',
              reviewName: 'Verona Medunsa',
              reviewDate: '10 January 2024',
              review:
                  'Decent fender bender repair work, and the repair process was done in good time.  I didn’t appreciate the staff attitudes though, they came across quite cold and unbothered. ')
        ],
      ),
    );
  }
}
