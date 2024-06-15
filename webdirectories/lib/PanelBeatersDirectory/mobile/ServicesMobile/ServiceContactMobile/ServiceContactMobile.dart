import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/ServiceContactMobile/ServiceContactContainer/ServiceContactContainer1Mobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/ServiceContactMobile/ServiceContactContainer/ServiceContactContainer2Mobile.dart';

class ServiceContactMobile extends StatefulWidget {
  const ServiceContactMobile({super.key});

  @override
  State<ServiceContactMobile> createState() => _ServiceContactMobileState();
}

class _ServiceContactMobileState extends State<ServiceContactMobile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: ServiceContactContainer1Mobile(
              customerCare1: '012 980 001',
              customerCare2: '012 980 0010',
              towingService: '012 333 3456',
              afterHours: '074 686 8850',
              email: 'info@n4autocraft.co.za',
              fax: '086 547 7509',
              streetAddress:
                  '18 Sneeuberg Street, N4 Gateway Industrial Park, Willow Park Manor X65, Pretoria East, Gauteng, 0184',
              postalAddress:
                  'P.O Box 123, Gateway 4567, Willow Park Manor 0826',
              gpsCoordinates: '25°45\'16.4"S 28°21\'50.2"E',
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 10),
          child: Text(
            'The Team:',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.4,
              fontFamily: 'raleway',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ServiceContactContainer2Mobile()),
        )
      ],
    );
  }
}
