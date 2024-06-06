import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class ServiceContainer2top extends StatefulWidget {
  final List<String> section1Texts;
  final List<String> section2Texts;
  final List<String> section3Texts;
  final List<String> section4Texts;

  const ServiceContainer2top({
    Key? key,
    required this.section1Texts,
    required this.section2Texts,
    required this.section3Texts,
    required this.section4Texts,
  }) : super(key: key);

  @override
  State<ServiceContainer2top> createState() => _ServiceContainer2topState();
}

class _ServiceContainer2topState extends State<ServiceContainer2top> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.85,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Color(0xFF0E1013),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          _buildSection(widget.section1Texts),
          _buildSection(widget.section2Texts),
          _buildSection(widget.section3Texts),
          _buildSection(widget.section4Texts),
        ],
      ),
    );
  }

  Widget _buildSection(List<String> texts) {
    return Expanded(
      child: Container(
        height: MyUtility(context).height * 0.051 * texts.length.toDouble(),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF5B5B5B)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _buildBoxes(texts),
        ),
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
