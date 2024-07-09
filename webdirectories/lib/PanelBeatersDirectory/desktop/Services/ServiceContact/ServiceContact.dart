import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServiceContact/ServiceContactContainer/ServiceContactContainer2.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServiceContact/ServiceContactContainer/ServiceContactcontainer1.dart';
import 'package:webdirectories/myutility.dart';

class ServiceContact extends StatefulWidget {
  const ServiceContact({super.key});

  @override
  State<ServiceContact> createState() => _ServiceContactState();
}

class _ServiceContactState extends State<ServiceContact> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        ServiceContactContainer1(
          customerCare1: '012 980 001',
          customerCare2: '012 980 0010',
          towingService: '012 333 3456',
          afterHours: '074 686 8850',
          email: 'info@n4autocraft.co.za',
          fax: '086 547 7509',
          streetAddress:
              '18 Sneeuberg Street, N4 Gateway Industrial Park, Willow Park Manor X65, Pretoria East, Gauteng, 0184',
          postalAddress: 'P.O Box 123, Gateway 4567, Willow Park Manor 0826',
          gpsCoordinates: '25°45\'16.4"S 28°21\'50.2"E',
        ),
        SizedBox(
          height: 20,
        ),
        ServiceContactContainer2(),
        SizedBox(
          height: MyUtility(context).height * 0.05,
        )
      ],
    );
  }
}
