import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesMaps/BusinessHours/BusinessHoursComp/DaysHours.dart';
import 'package:webdirectories/myutility.dart';

class BusinessHours extends StatefulWidget {
  const BusinessHours({super.key});

  @override
  State<BusinessHours> createState() => _BusinessHoursState();
}

class _BusinessHoursState extends State<BusinessHours> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.42,
      height: MyUtility(context).height * 0.625,
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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                width: MyUtility(context).width * 0.36,
                child: Text(
                  'Business Hours ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MyUtility(context).width * 0.016,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: MyUtility(context).width * 0.36,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DaysHours(
                      days: 'Monday',
                      BusinessHOurs: '07:30 - 17:00',
                    ),
                    DaysHours(
                      days: 'Tuesday',
                      BusinessHOurs: '07:30 - 17:00',
                    ),
                    DaysHours(
                      days: 'Wednesday',
                      BusinessHOurs: '07:30 - 17:00',
                    ),
                    DaysHours(
                      days: 'Thursday',
                      BusinessHOurs: '07:30 - 17:00',
                    ),
                    DaysHours(
                      days: 'Friday',
                      BusinessHOurs: '07:30 - 17:00',
                    ),
                    DaysHours(
                      days: 'Saturday',
                      BusinessHOurs: 'Closed',
                    ),
                    DaysHours(
                      days: 'Sunday',
                      BusinessHOurs: 'Closed',
                    ),
                    DaysHours(
                      days: 'Public Holidays',
                      BusinessHOurs: 'Closed',
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                width: MyUtility(context).width * 0.38,
                height: MyUtility(context).height * 0.2,
                decoration: ShapeDecoration(
                  color: Color(0xFF3C4043),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignOutside,
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Useful Information',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: MyUtility(context).width * 0.016,
                                fontFamily: 'raleway',
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Our shop will be closed on Easter Weekend. 29 March - 02 April 2024. Please use our after hours number in case of an emergency.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MyUtility(context).width * 0.0111,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'raleway',
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
