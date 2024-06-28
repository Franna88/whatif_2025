import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DasboardComp/DashboardButton.dart';

class WelcomeBack extends StatefulWidget {
  const WelcomeBack({super.key});

  @override
  State<WelcomeBack> createState() => _WelcomeBackState();
}

class _WelcomeBackState extends State<WelcomeBack> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 558.28,
      height: 225.08,
      decoration: ShapeDecoration(
        color: Color(0x3FEF9040),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back',
              style: TextStyle(
                color: Colors.black,
                fontSize: 27.2,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Jaydon Frankie',
              style: TextStyle(
                color: Color(0xFFEF9040),
                fontSize: 21.76,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
              ),
            ),
            DashboardButton(text: 'Industry News', onPressed: () {}),
            Row(
              children: [
                DashboardButton(text: 'Lightstone Results', onPressed: () {}),
                DashboardButton(
                    text: 'View Business Profile', onPressed: () {}),
                DashboardButton(text: 'Talk to Us', onPressed: () {})
              ],
            )
          ],
        ),
      ),
    );
  }
}
