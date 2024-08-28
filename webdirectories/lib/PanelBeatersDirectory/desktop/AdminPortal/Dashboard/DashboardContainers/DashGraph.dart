import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DasboardComp/DashNewGraph.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DasboardComp/PreviousandCurrent.dart';
import 'package:webdirectories/myutility.dart';

import '../DasboardComp/DashDatePicker.dart';

class DashGraph extends StatefulWidget {
  const DashGraph({super.key});

  @override
  State<DashGraph> createState() => _DashGraphState();
}

class _DashGraphState extends State<DashGraph> {
  @override
  Widget build(BuildContext context) {
    return Container(
      /*height: MyUtility(context).width < 1500
          ? 226.44
          : MyUtility(context).height * 0.38,
      width: MyUtility(context).width < 1500
          ? 452.88
          : MyUtility(context).width * 0.35,*/
      width: MyUtility(context).width * 0.42,
      height: MyUtility(context).height * 0.42,
      decoration: ShapeDecoration(
        color: Color(0xFF2C2C2C),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.71),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Profile Performance',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.61,
                    fontFamily: 'ralewaybold',
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CalendarPickerPopup();
                      },
                    );
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: Text(
                          'Edit Dates',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xFFD6D6D6),
                            fontSize: 11.09,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'ralewayit',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SvgPicture.asset(
                        'images/Briefcase.svg',
                        color: Color(0xFFFFA500),
                        height: MyUtility(context).width * 0.011,
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: MyUtility(context).height * 0.01,
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PreviousandCurrent(
                      visitors: '+75 Visitors',
                      date: 'july 2024',
                      previous: 'Previous',
                    ),
                    PreviousandCurrent(
                      visitors: '+25 Visitors',
                      date: 'Aug 2024',
                      previous: 'Current',
                    ),
                    SizedBox(
                      height: MyUtility(context).height * 0.02,
                    ),
                    Column(
                      children: [
                        Text(
                          'Total Views',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFCCCCCC),
                            fontSize: 10.8188,
                            fontFamily: 'ralewaymedium',
                          ),
                        ),
                        Text(
                          '2561',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFFFF8728),
                              fontSize: 20.7264,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width: 30,
                ),
                DashNewGraph()
              ],
            )
          ],
        ),
      ),
    );
  }
}
