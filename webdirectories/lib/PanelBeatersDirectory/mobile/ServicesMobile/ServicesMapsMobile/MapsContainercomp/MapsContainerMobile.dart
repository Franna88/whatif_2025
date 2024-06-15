import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webdirectories/myutility.dart';

class MapsContainerMobile extends StatefulWidget {
  const MapsContainerMobile({super.key});

  @override
  State<MapsContainerMobile> createState() => _MapsContainerMobileState();
}

class _MapsContainerMobileState extends State<MapsContainerMobile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: MyUtility(context).width * 0.9,
        height: MyUtility(context).height * 0.4,
        decoration: ShapeDecoration(
          color: Color(0xFFFF8728),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(4, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 4, 4, 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 22,
                      height: 22,
                      child: SvgPicture.asset('images/pindropblack.svg')),
                  Text(
                    '18 Sneeuberg Street, N4 Gateway Industrial Park, Willow\nPark Manor X65, Pretoria East, Gauteng, 0184',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.88,
                      fontFamily: 'raleway',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MyUtility(context).width * 0.85,
              height: MyUtility(context).height * 0.35,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage("images/maps.png"),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
