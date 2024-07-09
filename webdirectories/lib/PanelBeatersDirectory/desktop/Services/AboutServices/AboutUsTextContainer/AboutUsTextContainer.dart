import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/widgets.dart';

class AboutUSTextContainer extends StatefulWidget {
  const AboutUSTextContainer({super.key});

  @override
  State<AboutUSTextContainer> createState() => _AboutUSTextContainerState();
}

class _AboutUSTextContainerState extends State<AboutUSTextContainer> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 553.92,
      height: 487.2,
      decoration: ShapeDecoration(
        color: Color(0xFF181B1D),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text(
                'About Us:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.4,
                  fontFamily: 'raleway',
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(
              child: DraggableScrollbar.rrect(
                controller: _scrollController,
                backgroundColor: Colors.grey,
                alwaysVisibleScrollThumb: true,
                child: ListView(
                  controller: _scrollController,
                  children: [
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 35),
                        child: Text(
                          'N4 Autocraft Panelbeaters was established in 1983 and is based in George, Western Cape. With our 38 years of experience, N4 Autocraft Panelbeaters is a trusted collision repair specialist, specializing in panel beating, spray painting, and major structural repairs. We provide a full-service offering to repair all motor vehicle types and are RMI and insurance approved. Throughout our history, a key aspect of N4 Autocraft philosophy has been to acquire and maintain a reputation for high-quality customer service. Honesty, integrity, and quality are the 3 pillars on which the company is built and will remain the pillars as the company continues to grow.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.64,
                            fontFamily: 'raleway',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
