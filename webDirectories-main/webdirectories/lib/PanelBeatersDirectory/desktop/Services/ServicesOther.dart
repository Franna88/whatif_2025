import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Locations/LocationOtherFeature/ImageContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesComponent/ServiceStackedButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesComponent/ServicesOtherContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/iconButton.dart';
import 'package:webdirectories/myutility.dart';

class ServicesOther extends StatefulWidget {
  const ServicesOther({super.key});

  @override
  State<ServicesOther> createState() => _ServicesOtherState();
}

class _ServicesOtherState extends State<ServicesOther> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MyUtility(context).height,
        width: MyUtility(context).width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/mainbackgroundPanel.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            SizedBox(
              width: MyUtility(context).width / 1.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ServicesStackedButton(), IconButtons()],
              ),
            ),
            Container(
              width: MyUtility(context).width / 1.1,
              height: 34.68,
              padding: const EdgeInsets.only(
                top: 10.80,
                left: 10.80,
                right: 21.59,
                bottom: 10.80,
              ),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.83),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: TextField(
                controller: TextEditingController(),
                decoration: InputDecoration(
                  hintText: 'Search Featured',
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14.6812,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w400,
                    height: 1.0,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.only(
                    top: 10.80,
                    left: 10.80,
                    right: 21.59,
                    bottom: 10.80,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.83),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.6812,
                  fontFamily: 'raleway',
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.85,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: MyUtility(context).height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ServicesOtherContainer(
                        businessImage: 'images/pending.png',
                        businessName: 'Ramcom Trucks & Load Bodies',
                        businessAddress:
                            'Pacaltsville, George, Western Cape, 6530',
                        OnPressed: () {},
                        views: '16 133',
                      ),
                      ServicesOtherContainer(
                        businessImage: 'images/pending.png',
                        businessName: 'Ramcom Trucks & Load Bodies',
                        businessAddress:
                            'Pacaltsville, George, Western Cape, 6530',
                        OnPressed: () {},
                        views: '16 133',
                      ),
                      ImageContainer(image: 'images/hippo.png'),
                      ServicesOtherContainer(
                        businessImage: 'images/pending.png',
                        businessName: 'Ramcom Trucks & Load Bodies',
                        businessAddress:
                            'Pacaltsville, George, Western Cape, 6530',
                        OnPressed: () {},
                        views: '16 133',
                      ),
                      ServicesOtherContainer(
                        businessImage: 'images/pending.png',
                        businessName: 'Ramcom Trucks & Load Bodies',
                        businessAddress:
                            'Pacaltsville, George, Western Cape, 6530',
                        OnPressed: () {},
                        views: '16 133',
                      ),
                      SizedBox(
                        width: MyUtility(context).width * 0.02,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ImageContainer(image: 'images/hurricane2.png'),
                      ServicesOtherContainer(
                        businessImage: 'images/pending.png',
                        businessName: 'Ramcom Trucks & Load Bodies',
                        businessAddress:
                            'Pacaltsville, George, Western Cape, 6530',
                        OnPressed: () {},
                        views: '16 133',
                      ),
                      ServicesOtherContainer(
                        businessImage: 'images/pending.png',
                        businessName: 'Ramcom Trucks & Load Bodies',
                        businessAddress:
                            'Pacaltsville, George, Western Cape, 6530',
                        OnPressed: () {},
                        views: '16 133',
                      ),
                      ImageContainer(image: 'images/glasurit2.png'),
                      ServicesOtherContainer(
                        businessImage: 'images/pending.png',
                        businessName: 'Ramcom Trucks & Load Bodies',
                        businessAddress:
                            'Pacaltsville, George, Western Cape, 6530',
                        OnPressed: () {},
                        views: '16 133',
                      ),
                      SizedBox(
                        width: MyUtility(context).width * 0.02,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ServicesOtherContainer(
                        businessImage: 'images/pending.png',
                        businessName: 'Ramcom Trucks & Load Bodies',
                        businessAddress:
                            'Pacaltsville, George, Western Cape, 6530',
                        OnPressed: () {},
                        views: '16 133',
                      ),
                      ImageContainer(image: 'images/celette.png'),
                      ServicesOtherContainer(
                        businessImage: 'images/pending.png',
                        businessName: 'Ramcom Trucks & Load Bodies',
                        businessAddress:
                            'Pacaltsville, George, Western Cape, 6530',
                        OnPressed: () {},
                        views: '16 133',
                      ),
                      ServicesOtherContainer(
                        businessImage: 'images/pending.png',
                        businessName: 'Ramcom Trucks & Load Bodies',
                        businessAddress:
                            'Pacaltsville, George, Western Cape, 6530',
                        OnPressed: () {},
                        views: '16 133',
                      ),
                      ImageContainer(image: 'images/hippo.png'),
                      SizedBox(
                        width: MyUtility(context).width * 0.02,
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
