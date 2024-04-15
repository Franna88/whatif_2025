import 'package:flutter/material.dart';
import 'package:webdirectories/Mobile/FooterMobile/FooterMobile.dart';
import 'package:webdirectories/Mobile/MobilePage6/GetinTouchMobile/GetinTouchMobile.dart';
import 'package:webdirectories/Mobile/MobilePage6/MessageUsMobile/MessageUsMobile.dart';
import 'package:webdirectories/Mobile/MobileTopNavBar/MobileTopNavBar.dart';

class MobilePage6 extends StatefulWidget {
  const MobilePage6({super.key});

  @override
  State<MobilePage6> createState() => _MobilePage6State();
}

class _MobilePage6State extends State<MobilePage6> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MobileTopNavBar(),
          GetinTouchMobile(),
          MessageUsMobile(),
          FooterMobile()
        ],
      ),
    );
  }
}
