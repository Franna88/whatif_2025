import 'package:flutter/material.dart';
import 'package:webdirectories/Footer/Footer.dart';
import 'package:webdirectories/Page7/GetinTouch/GetinTouch.dart';
import 'package:webdirectories/Page7/Maps/Maps.dart';
import 'package:webdirectories/TopNavBar/TopNavBar.dart';

class Page7 extends StatefulWidget {
  const Page7({super.key});

  @override
  State<Page7> createState() => _Page7State();
}

class _Page7State extends State<Page7> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [TopNavBar(), GetinTouch(), Maps(), Footer()],
      ),
    );
  }
}
