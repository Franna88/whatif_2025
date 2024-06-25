import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class ProfileTextContainer extends StatefulWidget {
  const ProfileTextContainer({super.key});

  @override
  State<ProfileTextContainer> createState() => _ProfileTextContainerState();
}

class _ProfileTextContainerState extends State<ProfileTextContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.395,
      height: MyUtility(context).height * 0.421,
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
        child: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 520.2,
                child: Text(
                  '012 980 0010',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MyUtility(context).width * 0.0115,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white,
                    height: 0,
                  ),
                ),
              ),
              SizedBox(
                width: 520.2,
                child: Text(
                  '18 Sneeuberg Street, N4 Gateway Industrial Park, Willow Park Manor X65, Pretoria East, Gauteng, 0184',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MyUtility(context).width * 0.0115,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 520.2,
                child: Text(
                  '9397 Total Unique Page Views',
                  style: TextStyle(
                    color: Color(0xFFFF8728),
                    fontSize: MyUtility(context).width * 0.0115,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: MyUtility(context).width * 0.16,
                  height: MyUtility(context).height * 0.05,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 26.5744,
                        height: 26.5744,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.keyboard_arrow_left,
                            size: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Approvals & Services',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.8999999761581421),
                          fontSize: MyUtility(context).width * 0.0113,
                          fontFamily: 'raleway',
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
