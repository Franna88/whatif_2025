import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/DaysButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/Hours.dart';

class ServiceHours extends StatefulWidget {
  const ServiceHours({super.key});

  @override
  State<ServiceHours> createState() => _ServiceHoursState();
}

class _ServiceHoursState extends State<ServiceHours> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Hours',
                    style: TextStyle(
                      color: Color(0xFF0F253A),
                      fontSize: 20.4,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
                Row(
                  children: [
                    DaysButton(
                      day: 'M',
                    ),
                    DaysButton(
                      day: 'T',
                    ),
                    DaysButton(
                      day: 'W',
                    ),
                    DaysButton(
                      day: 'T',
                    ),
                    DaysButton(
                      day: 'F',
                    ),
                    DaysButton(
                      day: 'S',
                    ),
                    DaysButton(
                      day: 'S',
                    ),
                    DaysButton(
                      day: 'P',
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hours(days: 'Monday', from: '08:00', till: '17:00'),
                    Hours(days: 'Tuesday', from: '08:00', till: '17:00'),
                    Hours(days: 'Wednesday', from: '08:00', till: '17:00'),
                    Hours(days: 'Thursday', from: '08:00', till: '17:00'),
                  ],
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
