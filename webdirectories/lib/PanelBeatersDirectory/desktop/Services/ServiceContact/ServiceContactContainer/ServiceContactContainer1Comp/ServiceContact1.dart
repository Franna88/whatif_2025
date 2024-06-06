import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class ServiceContact1 extends StatefulWidget {
  final List<String> section1Texts;
  final List<String> section2Texts;

  const ServiceContact1({
    Key? key,
    required this.section1Texts,
    required this.section2Texts,
  }) : super(key: key);

  @override
  State<ServiceContact1> createState() => _ServiceContact1State();
}

class _ServiceContact1State extends State<ServiceContact1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.85,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Color(0xFF0E1013),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Flexible(
            flex: 1, // This column will take 3 parts out of total 7
            child: _buildSection(widget.section1Texts),
          ),
          Flexible(
            flex: 4, // This column will take 4 parts out of total 7
            child: _buildSection(widget.section2Texts),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(List<String> texts) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF5B5B5B)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _buildBoxes(texts),
      ),
    );
  }

  List<Widget> _buildBoxes(List<String> texts) {
    List<Widget> boxes = [];
    bool isAlternate = false;

    for (String text in texts) {
      boxes.add(Container(
        color: isAlternate ? Color(0xFF1D2023) : Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        alignment: Alignment.centerLeft,
        height: MyUtility(context).height * 0.05,
        child: Text(
          text,
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.white,
            fontSize: MyUtility(context).width * 0.011,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w400,
          ),
        ),
      ));

      isAlternate = !isAlternate;
    }

    return boxes;
  }
}
