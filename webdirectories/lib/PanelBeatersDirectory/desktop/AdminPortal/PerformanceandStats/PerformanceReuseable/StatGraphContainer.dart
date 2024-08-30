import 'package:flutter/material.dart';

import '../../../../../myutility.dart';
import '../../AdminProfile/ProfileComp/buttons/AddButton.dart';
import 'PerformanceDatePicker.dart';
import 'PerformanceGraph.dart';
import 'PerformanceTags.dart';
import 'ProfileIconText.dart';

class StatGraphContainer extends StatefulWidget {
  const StatGraphContainer({super.key});

  @override
  State<StatGraphContainer> createState() => _StatGraphContainerState();
}

class _StatGraphContainerState extends State<StatGraphContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.75,
      height: MyUtility(context).height * 0.68,
      decoration: ShapeDecoration(
        color: Color(0xFF0E1013),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(44.72),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 5.83,
            offset: Offset(0, 5.83),
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Performancetags(header: 'Total Lead Views', figures: '2561'),
                SizedBox(
                  width: MyUtility(context).width * 0.03,
                ),
                Performancetags(header: 'Email Clicks', figures: '233'),
                SizedBox(
                  width: MyUtility(context).width * 0.03,
                ),
                Performancetags(header: 'Phone Clicks', figures: '702'),
                SizedBox(
                  width: MyUtility(context).width * 0.03,
                ),
                Performancetags(header: 'Quote Clicks', figures: '36')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Profile Performance - Lead Views',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.47,
                      fontFamily: 'ralewaybold',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MyUtility(context).height * 0.47,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ProfileIconText(
                          visitors: '+25 visitors',
                          date: 'July 2024',
                          previous: 'Previous'),
                      ProfileIconText(
                          visitors: '+75 visitors',
                          date: 'Aug 2024',
                          previous: 'Current'),
                    ],
                  ),
                  Performancegraph(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PerformanceDatePicker(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: AddButton(text: 'Search', onPressed: () {}),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
