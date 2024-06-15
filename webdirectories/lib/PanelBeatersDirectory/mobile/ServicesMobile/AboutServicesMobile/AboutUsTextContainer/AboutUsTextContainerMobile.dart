import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

import 'package:webdirectories/myutility.dart';

class AboutUsTextContainerMobile extends StatefulWidget {
  const AboutUsTextContainerMobile({super.key});

  @override
  State<AboutUsTextContainerMobile> createState() =>
      _AboutUsTextContainerMobileState();
}

class _AboutUsTextContainerMobileState
    extends State<AboutUsTextContainerMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.9,
      height: MyUtility(context).height * 0.58,
      decoration: ShapeDecoration(
        color: Color(0xFF181B1D),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                'About Us:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.4,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              width: MyUtility(context).width * 0.72,
              child: Text(
                'N4 Autocraft Panelbeaters was established in 1983 and is based in George, Western Cape. With our 38 years of experience, N4 Autocraft Panelbeaters is a trusted collision repair specialist, specializing in panel beating, spray painting, and major structural repairs. We provide a full-service offering to repair all motor vehicle types and are RMI and insurance approved. Throughout our history, a key aspect ofN4 Autocraft philosophy has been to acquire and maintain a reputation for high-quality customer service. Honesty, integrity, and quality are the 3 pillars on which the company is built and will remain the pillars as the company continues to grow.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.64,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
