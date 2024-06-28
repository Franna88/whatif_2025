import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Advertisement/Advertisementcomp/AdvertButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Advertisement/Advertisementcomp/Advertcontainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/AddAdvertPopup/AddAdvertPopup.dart';
import 'package:webdirectories/myutility.dart';

class Advertisement extends StatefulWidget {
  const Advertisement({super.key});

  @override
  State<Advertisement> createState() => _AdvertisementState();
}

class _AdvertisementState extends State<Advertisement> {
  final List<Map<String, String>> advertisements = [
    {
      'image': 'Images/advert.jpg',
      'name': 'VW Polo 2014 Front bumper',
    },
    {
      'image': 'Images/advert.jpg',
      'name': 'Toyota Corolla 2016 Headlight',
    },
    {
      'image': 'Images/advert.jpg',
      'name': 'Ford Focus 2018 Mirror',
    },
    {
      'image': 'Images/advert.jpg',
      'name': 'Ford Focus 2018 Mirror',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MyUtility(context).width,
        height: MyUtility(context).height,
        decoration: BoxDecoration(color: Color(0xFFF4F4F4)),
        child: Center(
          child: Container(
            width: MyUtility(context).width * 0.75,
            height: MyUtility(context).height * 0.9,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Advertisement',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.48,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      AdvertButton(
                        text: 'Add Specials',
                        onPressed: () {
                          showDialog(
                            context: context,
                            barrierDismissible: true,
                            barrierColor: Colors.black.withOpacity(0.5),
                            builder: (BuildContext context) {
                              return Dialog(
                                backgroundColor: Colors.transparent,
                                insetPadding: EdgeInsets.all(10),
                                child: AddAdvertPopup(),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MyUtility(context).height * 0.025,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: advertisements.map((ad) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Advertcontainer(
                            memberImage: ad['image']!,
                            memberName: ad['name']!,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
