import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/AddButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DashboardContainers/DashProfileView.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Notifications/NotificationMessage.dart/NotMessageReuseable/BackButtonMessage.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/jobFinder.dart';
import 'package:webdirectories/myutility.dart';

import 'JobFinderComp/ReqruitDetails.dart';

class JobFinderDetails extends StatelessWidget {
  final Function(int) navigateToPage;
  final JobFinderModel job;

  const JobFinderDetails(
      {Key? key, required this.job, required this.navigateToPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MyUtility(context).width,
        height: MyUtility(context).height,
        decoration: const BoxDecoration(color: Color(0xFF171616)),
        child: Column(
          children: [
            Center(
              child: Container(
                width: MyUtility(context).width * 0.78,
                height: MyUtility(context).height * 0.85,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: const Alignment(0.57, -0.82),
                    end: const Alignment(-0.57, 0.82),
                    colors: [
                      const Color(0x19777777),
                      Colors.white.withOpacity(0.4),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0xBF000000),
                      blurRadius: 24,
                      offset: Offset(0, 4),
                      spreadRadius: -1,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BackButtonMessage(
                              onPress: () {
                                navigateToPage(8);
                              },
                            ),
                            AddButton(text: 'Email Data', onPressed: () {})
                          ],
                        ),
                      ),

                      // Details Section
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: ListView(
                            children: [
                              ReqruitDetails(
                                year:
                                    job.dateSubmitted.toDate().year.toString(),
                                month:
                                    job.dateSubmitted.toDate().month.toString(),
                                day: job.dateSubmitted.toDate().day.toString(),
                                occupation: job.occupation,
                                contact: job.contactNumber,
                                name: job.name,
                                location:
                                    "${job.province} ${job.city} ${job.country}",
                                qualification: job.qualification,
                                years: job.years,
                                email: job.email,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
