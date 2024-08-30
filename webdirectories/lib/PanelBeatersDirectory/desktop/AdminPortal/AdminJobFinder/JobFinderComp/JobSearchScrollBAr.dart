import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';

class JobSearchScrollBar extends StatefulWidget {
  const JobSearchScrollBar({super.key});

  @override
  State<JobSearchScrollBar> createState() => _JobSearchScrollBarState();
}

class _JobSearchScrollBarState extends State<JobSearchScrollBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
        height: MyUtility(context).height * 0.03,
        decoration: BoxDecoration(
          color: Color(0xFF0E1013), // Background color of the search bar
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Icon(
                Icons.search,
                color: Colors.white, // Color of the search icon
                size: 22.0,
              ),
            ),
            Text(
              "Search:",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'raleway',
                fontSize: 15.0,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Container(
                  height: 35.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                    ),
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
