import 'package:flutter/material.dart';
import 'package:webdirectories/Footer/Footer.dart';
import 'package:webdirectories/Page1/AboutUS/AboutUs.dart';
import 'package:webdirectories/Page1/AiCoDriver/AiCoDriver.dart';
import 'package:webdirectories/Page1/Comments/Comments.dart';
import 'package:webdirectories/Page1/JoinUs/JoinUs.dart';
import 'package:webdirectories/Page1/PartnerWithUs/PartnerWithUs.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PartnerWithUs(),
          AboutUs(),
          JoinUs(),
          AiCoDriver(),
          Comments(),
          Footer()
        ],
      ),
    );
  }
}
