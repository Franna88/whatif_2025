import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServiceContact/ServiceContactContainer/ServiceContactContainer2comp/ServiceContactContainer2top.dart';

class ServiceContactContainer2 extends StatefulWidget {
  const ServiceContactContainer2({
    Key? key,
  }) : super(key: key);

  @override
  State<ServiceContactContainer2> createState() =>
      _ServiceContactContainer2State();
}

class _ServiceContactContainer2State extends State<ServiceContactContainer2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF1D2023),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          ServiceContainer2top(
            section1Texts: [
              'Contact',
              'Ella Jansen van Vuuren',
              'Marthinus Scheepers',
              'J.P Nortje'
            ],
            section2Texts: [
              'Designation',
              'Administration',
              'Marthinus Scheepers',
              'Owner'
            ],
            section3Texts: [
              'Tel',
              '012 980 0010',
              '074 686 8850',
              '083 279 8288'
            ],
            section4Texts: [
              'Email',
              'queries@n4autocraft.co.za',
              'marthinus@n4autocraft.co.za',
              'jp@n4autocraft.co.za'
            ],
          ),
        ],
      ),
    );
  }
}
