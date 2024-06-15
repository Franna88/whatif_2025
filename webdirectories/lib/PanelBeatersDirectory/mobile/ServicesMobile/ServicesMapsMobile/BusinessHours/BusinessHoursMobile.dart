import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/ServicesMapsMobile/BusinessHours/BusinessHoursMobileComp/DaysHoursMobile.dart';
import 'package:webdirectories/myutility.dart';

class BusinessHoursMobile extends StatefulWidget {
  const BusinessHoursMobile({super.key});

  @override
  State<BusinessHoursMobile> createState() => _BusinessHoursMobileState();
}

class _BusinessHoursMobileState extends State<BusinessHoursMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.9,
      height: MyUtility(context).height * 0.52,
      decoration: ShapeDecoration(
        color: Color(0xFF181B1D),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                'Business Hours ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.4,
                  fontFamily: 'raleway',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 20, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Column(
                      children: [
                        DaysHoursMobile(
                          days: 'Monday',
                          BusinessHOurs: '07:30 - 17:00',
                        ),
                        DaysHoursMobile(
                          days: 'Tuesday',
                          BusinessHOurs: '07:30 - 17:00',
                        ),
                        DaysHoursMobile(
                          days: 'Wednesday',
                          BusinessHOurs: '07:30 - 17:00',
                        ),
                        DaysHoursMobile(
                          days: 'Thursday',
                          BusinessHOurs: '07:30 - 17:00',
                        ),
                        DaysHoursMobile(
                          days: 'Friday',
                          BusinessHOurs: '07:30 - 17:00',
                        ),
                        DaysHoursMobile(
                          days: 'Saturday',
                          BusinessHOurs: 'Closed',
                        ),
                        DaysHoursMobile(
                          days: 'Sunday',
                          BusinessHOurs: 'Closed',
                        ),
                        DaysHoursMobile(
                          days: 'Public Holidays',
                          BusinessHOurs: 'Closed',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MyUtility(context).width * 0.85,
                  height: MyUtility(context).height * 0.17,
                  decoration: ShapeDecoration(
                    color: Color(0xFF3C4043),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignOutside,
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Useful Information',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.4,
                                  fontFamily: 'raleway',
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'Our shop will be closed on Easter Weekend.\n29 March - 02 April 2024. Please use our after hours number in case of an\nemergency.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.64,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'ralewayit',
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
