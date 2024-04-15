import 'package:flutter/material.dart';
import 'package:webdirectories/Footer/Footer.dart';
import 'package:webdirectories/Page2/WebsiteDisclaimer.dart/WebsiteDisclaimer.dart';

import 'package:webdirectories/TopNavBar/TopNavBar.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [TopNavBar(), WebsiteDisclaimer(), Footer()],
      ),
    );
  }
}
