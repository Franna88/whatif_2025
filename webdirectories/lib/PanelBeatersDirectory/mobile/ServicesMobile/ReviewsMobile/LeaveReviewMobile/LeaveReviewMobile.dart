import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/ReviewsMobile/LeaveReviewMobile/LeaveReviewsCompMobile/LeaveReviewFormFieldMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/ReviewsMobile/LeaveReviewMobile/LeaveReviewsCompMobile/LongFormFieldMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/ReviewsMobile/LeaveReviewMobile/LeaveReviewsCompMobile/MessageFormFieldMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/ReviewsMobile/LeaveReviewMobile/LeaveReviewsCompMobile/SelectStarMobile.dart';
import 'package:webdirectories/myutility.dart';

class LeaveReviewMobile extends StatefulWidget {
  Function(int) changePageIndex;
  LeaveReviewMobile({Key? key, required this.changePageIndex})
      : super(key: key);

  @override
  State<LeaveReviewMobile> createState() => _LeaveReviewMobileState();
}

class _LeaveReviewMobileState extends State<LeaveReviewMobile> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MyUtility(context).width * 0.85,
          height: MyUtility(context).height * 0.48,
          decoration: ShapeDecoration(
            color: Color(0xFF0E1013),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22.46),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: DraggableScrollbar.rrect(
              controller: _scrollController,
              backgroundColor: Color(0x7FD9D9D9),
              alwaysVisibleScrollThumb: true,
              child: ListView(
                controller: _scrollController,
                shrinkWrap: true,
                children: [
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Leave Review',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19.5364,
                            fontFamily: 'raleway',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: MyUtility(context).width * 0.8,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                LeaveReviewFormFieldMobile(
                                  reviewInfo: 'First name',
                                ),
                                LeaveReviewFormFieldMobile(
                                  reviewInfo: 'Last name',
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: LongFormFieldMobile(
                            reviewInfo: '*Email address',
                          ),
                        ),
                        Text(
                          '*Score',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.699999988079071),
                            fontSize: 13.022,
                            fontFamily: 'raleway',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: SelectStarMobile(
                            onRatingChanged: (rating) {
                              print('Selected rating: $rating');
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: MessageFormFieldMobile(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: LongFormFieldMobile(
                              reviewInfo: 'Add Image if Applicable'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              widget.changePageIndex(0);
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor: Color(0xFFFF8728),
                              foregroundColor: Colors.black,
                              minimumSize: Size(100.8, 45),
                            ),
                            child: Text(
                              'Post Review',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.0632,
                                fontFamily: 'raleway',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
