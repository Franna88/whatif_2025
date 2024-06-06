import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webdirectories/myutility.dart';

class MapsContainer extends StatefulWidget {
  const MapsContainer({super.key});

  @override
  State<MapsContainer> createState() => _MapsContainerState();
}

class _MapsContainerState extends State<MapsContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.42,
      height: MyUtility(context).height * 0.625,
      decoration: ShapeDecoration(
        color: Color(0xFFFF8728),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
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
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 20,
                    height: 20,
                    child: SvgPicture.asset('images/pindropblack.svg')),
                Text(
                  '18 Sneeuberg Street, N4 Gateway Industrial Park, Willow Park Manor X65, Pretoria East, Gauteng, 0184',
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
            width: MyUtility(context).width * 0.41,
            height: MyUtility(context).height * 0.57,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: AssetImage("images/maps.png"),
                fit: BoxFit.fill,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
