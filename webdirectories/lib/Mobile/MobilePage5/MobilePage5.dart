import 'package:flutter/material.dart';
import 'package:webdirectories/Mobile/FooterMobile/FooterMobile.dart';
import 'package:webdirectories/Mobile/MobilePage5/EchoMBRMobile/EchoMBRMobile.dart';
import 'package:webdirectories/Mobile/MobileTopNavBar/MobileTopNavBar.dart';

class MobilePage5 extends StatefulWidget {
  const MobilePage5({super.key});

  @override
  State<MobilePage5> createState() => _MobilePage5State();
}

class _MobilePage5State extends State<MobilePage5> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MobileTopNavBar(),
          EchoMBRMobile(),
          FooterMobile(),
        ],
      ),
    );
  }
}
