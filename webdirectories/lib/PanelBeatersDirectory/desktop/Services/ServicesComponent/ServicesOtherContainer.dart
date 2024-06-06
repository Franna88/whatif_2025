import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webdirectories/myutility.dart';

class ServicesOtherContainer extends StatefulWidget {
  final String businessImage;
  final String businessName;
  final String businessAddress;
  final VoidCallback OnPressed;
  final String views;

  const ServicesOtherContainer({
    Key? key,
    required this.businessImage,
    required this.businessName,
    required this.businessAddress,
    required this.OnPressed,
    required this.views,
  }) : super(key: key);

  @override
  State<ServicesOtherContainer> createState() => _ServicesOtherContainerState();
}

class _ServicesOtherContainerState extends State<ServicesOtherContainer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MyUtility(context).height * 0.275,
      child: Stack(
        children: [
          Positioned(
            bottom: 10,
            child: Container(
              width: 250,
              height: 165,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MyUtility(context).height * 0.1,
                  ),
                  Text(
                    widget.businessName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11.56,
                      fontFamily: 'ralewaysemi',
                      height: 0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SizedBox(
                      width: 208.08,
                      child: Text(
                        widget.businessAddress,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 8.84,
                          fontFamily: 'ralewaymedium',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: 17.5,
                      width: 157.76,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          padding: EdgeInsets.all(0),
                          backgroundColor: Color(0xFFFF8728),
                        ),
                        child: Text(
                          'Send Message',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 8.84,
                            fontFamily: 'ralewayMedium',
                            fontWeight: FontWeight.w500,
                            height: 1.0, // Line height
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: 17.5,
                      width: 157.76,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          padding: EdgeInsets.all(0),
                          backgroundColor: Color(0xFF0E1013),
                        ),
                        child: Text(
                          'See Reviews',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8.84,
                            fontFamily: 'ralewayMedium',
                            fontWeight: FontWeight.w500,
                            height: 1.0, // Line height
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: MyUtility(context).width * 0.035,
                        child: Text(
                          'Views:',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: 'ralewaybold',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                      Text(
                        widget.views,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            child: Container(
              width: 250,
              height: 95.0,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.businessImage),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
