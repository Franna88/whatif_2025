import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/ReviesMainContainer/RatingReviews/RatingReviewsComponents/RatingsSliderWithText.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/CommonButtonR.dart';
import 'package:webdirectories/myutility.dart';

class RatingReviews extends StatefulWidget {
  const RatingReviews({Key? key}) : super(key: key);

  @override
  State<RatingReviews> createState() => _RatingReviewsState();
}

class _RatingReviewsState extends State<RatingReviews> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.4,
      height: MyUtility(context).height * 0.52,
      decoration: ShapeDecoration(
        color: Color(0xFF0E1013),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.46),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Ratings & Reviews (148) ',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: MyUtility(context).width * 0.0152,
              fontFamily: 'raleway',
              fontWeight: FontWeight.w400,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: MyUtility(context).height * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RatingSliderWithText(currentState: 5),
                    RatingSliderWithText(currentState: 4),
                    RatingSliderWithText(currentState: 3),
                    RatingSliderWithText(currentState: 2),
                    RatingSliderWithText(currentState: 1)
                  ],
                ),
              ),
              SizedBox(
                height: MyUtility(context).height * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '4.5',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: MyUtility(context).width * 0.0125,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Container(
                              width: 11.04,
                              height: 11.04,
                              child: SvgPicture.asset('images/reviews.svg'),
                            )
                          ],
                        ),
                        Text(
                          '273 Reviews',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: MyUtility(context).width * 0.006,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.41,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '88%',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: MyUtility(context).width * 0.0125,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'Recommended',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: MyUtility(context).width * 0.006,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.41,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            width: 422.008,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text:
                        'By submitting a Review, you consent to us publishing the results online and/or sending it to the management team of ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MyUtility(context).width * 0.011,
                      fontFamily: 'raleway',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: 'N4 Autocraft Panelbeaters - Pretoria East.',
                    style: TextStyle(
                      color: Color(0xFF64DAFF),
                      fontSize: MyUtility(context).width * 0.011,
                      fontFamily: 'raleway',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          CommonButtonR(buttonText: 'Leave Us a Review', onPress: () {})
        ],
      ),
    );
  }
}
