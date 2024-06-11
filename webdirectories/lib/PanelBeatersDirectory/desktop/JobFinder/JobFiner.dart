import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JobFinder/JobFindaContainer/JobFinderContainer.dart';
import 'package:webdirectories/myutility.dart';

class JobFinder extends StatefulWidget {
  const JobFinder({super.key});

  @override
  State<JobFinder> createState() => _JobFinderState();
}

class _JobFinderState extends State<JobFinder> {
  final search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: MyUtility(context).height,
        width: MyUtility(context).width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/Mechanic1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    child: SizedBox(
                      width: MyUtility(context).width * 0.84,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Image.asset(
                              'images/logoPanel.png',
                              width: 225,
                              height: 110,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Job Finder:',
                                style: TextStyle(
                                  fontSize: MyUtility(context).width * 0.02,
                                  fontFamily: 'ralewaybold',
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Connect with top employers for free',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: MyUtility(context).width * 0.015,
                                  fontFamily: 'ralewaymedium',
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MyUtility(context).width * 0.865,
                    height: MyUtility(context).height * 0.767,
                    decoration: ShapeDecoration(
                      gradient: LinearGradient(
                        end: Alignment(0.56, 0.83),
                        begin: Alignment(0.56, -0.83),
                        colors: [
                          Colors.white.withOpacity(0.200000000149012),
                          Colors.white.withOpacity(0.4000000059604645)
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0xBF000000),
                          blurRadius: 24,
                          offset: Offset(0, 6),
                          spreadRadius: -3,
                        ),
                      ],
                    ),
                    child: Center(
                      child: JobFinderContainer(),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MyUtility(context).width * 0.04,
              )
            ],
          ),
        ),
      ),
    );
  }
}
