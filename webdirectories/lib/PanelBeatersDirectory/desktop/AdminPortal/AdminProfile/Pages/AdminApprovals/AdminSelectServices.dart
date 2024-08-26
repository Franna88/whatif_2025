import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/AdminApprovals/AdminReuseable.dart/AdminServicesCheckbox.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';

class Adminselectservices extends StatefulWidget {
  const Adminselectservices({super.key});

  @override
  State<Adminselectservices> createState() => _AdminselectservicesState();
}

class _AdminselectservicesState extends State<Adminselectservices> {
  final ScrollController _scrollController = ScrollController();

  final List<String> services = [
    'Airbag Repair',
    'Aircon Repair',
    'Assessment',
    'Audio Systems',
    'Plastic Bumper Repair',
    'Canopy Repair',
    'Colour Matching',
    'Cosmetic & Polishing',
    'Eco Conscious Paint Line',
    'Electronic Body Measuring System',
    'Exhaust System',
    'Hail Damage',
    'Microdot ID Technology',
    'Minor Dent & Scratch Repair',
    'Mobile Repair Unit',
    'Motorcycle Repair',
    'Non Structural Repair',
    'Paintless Dent Repair',
    'Paint Protection',
    'Plastic Bumper Repair', // Added twice to match your screenshot
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.4,
      height: MyUtility(context).height * 0.77,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.57, -0.82),
          end: Alignment(-0.57, 0.82),
          colors: [
            Color(0x19777777),
            Colors.white.withOpacity(0.4),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: [
          BoxShadow(
            color: Color(0xBF000000),
            blurRadius: 24,
            offset: Offset(0, 4),
            spreadRadius: -1,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'Select Specialist Services',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.6064,
                fontFamily: 'RalewayBold',
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Please click to select or deselect services your business currently offers.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 13.7364,
                fontFamily: 'Raleway',
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: DraggableScrollbar.rrect(
                controller: _scrollController,
                backgroundColor: Colors.grey,
                alwaysVisibleScrollThumb: true,
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: services.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: AdminServicesCheckBox(
                        label: services[index],
                        initialValue: false, // Adjust initial value as needed
                        onChanged: (value) {
                          setState(() {
                            // Handle the selection state change
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
