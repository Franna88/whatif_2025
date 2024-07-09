import 'package:flutter/material.dart';

import 'ServiceContactContainer2comp/ServiceContainer2topMobile.dart';

class ServiceContactContainer2Mobile extends StatefulWidget {
  const ServiceContactContainer2Mobile({
    Key? key,
  }) : super(key: key);

  @override
  State<ServiceContactContainer2Mobile> createState() =>
      _ServiceContactContainer2MobileState();
}

class _ServiceContactContainer2MobileState
    extends State<ServiceContactContainer2Mobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF1D2023),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          ServiceContainer2topMobile(
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
