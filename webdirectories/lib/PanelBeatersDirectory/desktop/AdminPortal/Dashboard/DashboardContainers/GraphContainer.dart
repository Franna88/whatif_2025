import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DasboardComp/BarGraph.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DasboardComp/IconText.dart';

class GraphContaier extends StatefulWidget {
  const GraphContaier({super.key});

  @override
  State<GraphContaier> createState() => _GraphContaierState();
}

class _GraphContaierState extends State<GraphContaier> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 452.88,
      height: 226.44,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Directory Performance',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13.6,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                IconText(
                  visitors: '+25 visitors ',
                  month: 'February 2024',
                ),
                IconText(
                  visitors: '+25 visitors ',
                  month: 'Current Month',
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '450 visitors',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.48,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Total Views',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.6,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    'Views',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13.6,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                CustomBarGraph(),
                Text(
                  'Months',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13.6,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                )
              ],
            ),
            Column(
              children: [SvgPicture.asset('images/Briefcase.svg')],
            )
          ],
        ),
      ),
    );
  }
}
