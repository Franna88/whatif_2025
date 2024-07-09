import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminJobFinder/JobFinderComp/InfoTextBox.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminJobFinder/JobFinderComp/JobFinderInfo.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/CommonReuseable/IconSearchBox.dart';
import 'package:webdirectories/myutility.dart';

class AdminJobFinder extends StatefulWidget {
  const AdminJobFinder({super.key});

  @override
  State<AdminJobFinder> createState() => _AdminJobFinderState();
}

class _AdminJobFinderState extends State<AdminJobFinder> {
  final List<Map<String, String>> registrationInfo = [
    {
      'year': '2024',
      'month': '02',
      'day': '15',
      'occupation': 'Paintless Dent Remover',
      'contact': '0845858569',
      'name': 'Willem Harmse',
      'location': 'SA Gauteng Vereeniging',
    },
    {
      'year': '2024',
      'month': '02',
      'day': '15',
      'occupation': 'Paintless Dent Remover',
      'contact': '0845858569',
      'name': 'Willem Harmse',
      'location': 'SA Gauteng Vereeniging',
    },
    {
      'year': '2024',
      'month': '02',
      'day': '15',
      'occupation': 'Paintless Dent Remover',
      'contact': '0845858569',
      'name': 'Willem Harmse',
      'location': 'SA Gauteng Vereeniging',
    },
  ];

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: MyUtility(context).width,
        height: MyUtility(context).height,
        decoration: BoxDecoration(color: Color(0xFFF4F4F4)),
        child: Center(
          child: Container(
            width: MyUtility(context).width * 0.75,
            height: MyUtility(context).height * 0.9,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Job Finder',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.48,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoTextBox(),
                        IconSearchBox(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Container(
                      width: MyUtility(context).width * 0.73,
                      height: MyUtility(context).height * 0.06,
                      decoration: ShapeDecoration(
                        color: Color(0xFF0F253A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MyUtility(context).width * 0.1,
                              child: Text(
                                'Applied Date',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.68,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MyUtility(context).width * 0.17,
                              child: Text(
                                'Occupation',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.68,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MyUtility(context).width * 0.12,
                              child: Text(
                                'Contact',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.68,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MyUtility(context).width * 0.12,
                              child: Text(
                                'Name',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.68,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MyUtility(context).width * 0.17,
                              child: Text(
                                'Location',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.68,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MyUtility(context).width * 0.01,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: registrationInfo.length,
                      itemBuilder: (context, index) {
                        final registration = registrationInfo[index];
                        return JobFinderInfo(
                          year: registration['year']!,
                          month: registration['month']!,
                          day: registration['day']!,
                          occupation: registration['occupation']!,
                          contact: registration['contact']!,
                          name: registration['name']!,
                          location: registration['location']!,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
