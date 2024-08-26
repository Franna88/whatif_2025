import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class DashNewGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MyUtility(context).width * 0.34,
          height: MyUtility(context).height * 0.3,
          child: LineChart(
            LineChartData(
              gridData: FlGridData(
                show: true,
                drawHorizontalLine: true,
                horizontalInterval: 1.5,
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                    color: const Color(0xff37434d),
                    strokeWidth: 1,
                  );
                },
              ),
              titlesData: FlTitlesData(
                show: false,
              ),
              borderData: FlBorderData(
                show: false,
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: [
                    FlSpot(0, 3),
                    FlSpot(1, 1),
                    FlSpot(2, 4),
                    FlSpot(3, 3.5),
                    FlSpot(4, 5),
                    FlSpot(5, 3),
                    FlSpot(6, 4),
                  ],
                  isCurved: true,
                  color: const Color(0xFFF59121),
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFFF59121).withOpacity(0.4),
                        const Color(0x00822776).withOpacity(0),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  dotData: FlDotData(
                    show: true,
                    getDotPainter: (spot, percent, barData, index) {
                      if (spot.x == 4) {
                        return FlDotCirclePainter(
                          radius: 6,
                          color: Colors.white,
                          strokeWidth: 2,
                          strokeColor: const Color(0xfffbb03b),
                        );
                      } else {
                        return FlDotCirclePainter(
                          radius: 0,
                          color: Colors.transparent,
                        );
                      }
                    },
                  ),
                  curveSmoothness: 0.35,
                  barWidth: 4,
                ),
              ],
              minX: 0,
              maxX: 6,
              minY: 0,
              maxY: 6,
            ),
          ),
        ),
        SizedBox(
          height: MyUtility(context).height * 0.01,
        ),
        Text(
          'Months',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Color(0xFFD6D6D6),
            fontSize: 14.832,
            fontFamily: 'ralewaymedium',
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
