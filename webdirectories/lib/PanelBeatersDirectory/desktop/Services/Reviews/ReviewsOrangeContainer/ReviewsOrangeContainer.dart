import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/LightStone/LightStone/LightStone.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/ReviesMainContainer/ReviewsMainContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/ReviewsComponents/ReviewsNavButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

class ReviewsOrangeContainer extends StatefulWidget {
  const ReviewsOrangeContainer({super.key});

  @override
  State<ReviewsOrangeContainer> createState() => _ReviewsOrangeContainerState();
}

class _ReviewsOrangeContainerState extends State<ReviewsOrangeContainer> {
  String id = '';
  List<Map<String, dynamic>> _reviews = [];
  List<Map<String, dynamic>> _lightStoneData = [];
  bool _isloading = true;
  final _firestore = FirebaseFirestore.instance;

  var pageIndex = 0;

  @override
  void initState() {
    _getReviewData();
    super.initState();
  }

  Future<String?> _getReviewData() async {
    List<Map<String, dynamic>> reviewData = [];
    List<Map<String, dynamic>> registrationData = [];
    String? listingId = await GetListingId();
    if (listingId != null) {
      // Fetch reviews
      QuerySnapshot reviewsSnapshot = await _firestore
          .collection('rating')
          .where('listingsId', isEqualTo: int.parse(listingId))
          .get();
      if (reviewsSnapshot.docs.isNotEmpty) {
        reviewData = reviewsSnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
      }

      // Fetch registration data
      QuerySnapshot registrationDataSnapshot = await _firestore
          .collection('registration_numbers')
          .where('listingsId', isEqualTo: int.parse(listingId))
          .get();
      if (registrationDataSnapshot.docs.isNotEmpty) {
        List<Map<String, dynamic>> data = registrationDataSnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
        registrationData =
            data.where((e) => e['registrationTypeID'] == 8).toList();
      }

      setState(() {
        id = listingId;
        _reviews = reviewData;
        _lightStoneData = registrationData;
        _isloading = false;
      });
    }
  }

  // This function changes page index
  void changePageIndex(int value) {
    setState(() {
      pageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> reviewPages = [
      ReviewsMainContainer(reviewsData: _reviews, waiting: _isloading),
      LightStone()
    ];
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
