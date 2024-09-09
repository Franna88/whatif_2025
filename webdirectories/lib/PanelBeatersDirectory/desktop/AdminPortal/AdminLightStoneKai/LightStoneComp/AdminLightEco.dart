import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/myutility.dart';

import '../../../Services/Reviews/LightStone/LightStone/LightStoneEcho/LightStoneComp/PercentageText.dart';
import 'AdminPercentageText.dart';

class AdminLightEco extends StatefulWidget {
  final String percentage;
  const AdminLightEco({super.key, required this.percentage});

  @override
  State<AdminLightEco> createState() => _AdminLightEcoState();
}

class _AdminLightEcoState extends State<AdminLightEco> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MyUtility(context).height * 0.06,
        ),
        Text(
          'Lightstone EchoMBR KAI Index',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: MyUtility(context).width * 0.0145,
            fontFamily: 'raleway',
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: MyUtility(context).height * 0.01,
        ),
        Stack(
          children: [
            SvgPicture.asset('images/noneedle.svg',
                height: MyUtility(context).height * 0.55,
                width: MyUtility(context).width * 0.4),
            Positioned(
              top: 115,
              left: 75,
              right: 0,
              child: SvgPicture.asset('images/needle.svg',
                  height: MyUtility(context).height * 0.3,
                  width: MyUtility(context).width * 0.2),
            ),
            Positioned(
                bottom: MyUtility(context).height * 0.08,
                left: MyUtility(context).width * 0.1,
                child: AdminPercentageText(percentage: widget.percentage)),
          ],
        )
      ],
    );
  }
}
