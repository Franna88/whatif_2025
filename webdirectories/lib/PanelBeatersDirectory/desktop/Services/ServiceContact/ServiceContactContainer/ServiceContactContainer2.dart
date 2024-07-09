import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServiceContact/ServiceContactContainer/ServiceContactContainer2comp/ServiceContactContainer2top.dart';
import 'package:webdirectories/myutility.dart';

class ServiceContactContainer2 extends StatefulWidget {
  const ServiceContactContainer2({
    Key? key,
  }) : super(key: key);

  @override
  State<ServiceContactContainer2> createState() =>
      _ServiceContactContainer2State();
}

class _ServiceContactContainer2State extends State<ServiceContactContainer2> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MyUtility(context).height * 0.2,
      width: MyUtility(context).width * 0.85,
      decoration: BoxDecoration(
        color: const Color(0xFF1D2023),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: DraggableScrollbar.rrect(
          controller: _scrollController,
          backgroundColor: Colors.grey,
          alwaysVisibleScrollThumb: true,
          padding: EdgeInsets.only(right: 8.0),
          child: ListView(
            controller: _scrollController,
            children: [
              ServiceContainer2top(
                section1Texts: [
                  'Contact',
                  'Ella Jansen van Vuuren',
                  'Marthinus Scheepers',
                  'J.P Nortje',
                  'Another Contact', // Added a fifth item for testing
                ],
                section2Texts: [
                  'Designation',
                  'Administration',
                  'Marthinus Scheepers',
                  'Owner',
                  'Another Designation', // Added a fifth item for testing
                ],
                section3Texts: [
                  'Tel',
                  '012 980 0010',
                  '074 686 8850',
                  '083 279 8288',
                  'Another Tel', // Added a fifth item for testing
                ],
                section4Texts: [
                  'Email',
                  'queries@n4autocraft.co.za',
                  'marthinus@n4autocraft.co.za',
                  'jp@n4autocraft.co.za',
                  'another@n4autocraft.co.za', // Added a fifth item for testing
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
