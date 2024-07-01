import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DasboardComp/JobFinderReuseable.dart';
import 'package:webdirectories/myutility.dart';

class JobFinderOverviewContainer extends StatefulWidget {
  const JobFinderOverviewContainer({super.key});

  @override
  State<JobFinderOverviewContainer> createState() =>
      _JobFinderOverviewContainerState();
}

class _JobFinderOverviewContainerState
    extends State<JobFinderOverviewContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 507.28,
      height: 314.84,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'Job Finder',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.6,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 8),
              child: Text(
                'Overview of latest entries',
                style: TextStyle(
                  color: Color(0xFFAEAEAE),
                  fontSize: 10.88,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3, bottom: 10),
              child: Container(
                width: 495.04,
                height: 40.8,
                decoration: ShapeDecoration(
                  color: Color(0xFF212529),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        'Applied Date',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.6,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                    Text(
                      'Occupation',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.6,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    SizedBox(
                      width: MyUtility(context).width * 0.02,
                    ),
                    Text(
                      'Contact',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.6,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    SizedBox(
                      width: MyUtility(context).width * 0.075,
                    )
                  ],
                ),
              ),
            ),
            JobFinderReuseable(
              onPress: () {},
              appliedDate: '2024/02/15',
              occupation: 'Paintless Dent Remover',
              contact: '0845858569',
            ),
            JobFinderReuseable(
              onPress: () {},
              appliedDate: '2024/02/15',
              occupation: 'Paintless Dent Remover',
              contact: '0845858569',
            ),
            JobFinderReuseable(
              onPress: () {},
              appliedDate: '2024/02/15',
              occupation: 'Paintless Dent Remover',
              contact: '0845858569',
            ),
            JobFinderReuseable(
              onPress: () {},
              appliedDate: '2024/02/15',
              occupation: 'Paintless Dent Remover',
              contact: '0845858569',
            ),
          ],
        ),
      ),
    );
  }
}
