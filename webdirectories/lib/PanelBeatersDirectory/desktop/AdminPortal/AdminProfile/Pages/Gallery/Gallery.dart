import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/Gallery/GalleryComp/GalleryContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/Gallery/GalleryComp/PageChangeButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/AddButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/CommonReuseable/IconSearchBoxB.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/AddImagePopup/AddImagepopup.dart';
import 'package:webdirectories/myutility.dart';

class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  final List<Map<String, String>> galleryItems = [
    {'image': 'images/gallery.jpg', 'description': 'Car wash'},
    {'image': 'images/gallery.jpg', 'description': 'Service 1'},
    {'image': 'images/gallery.jpg', 'description': 'Service 2'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MyUtility(context).width * 0.9,
          child: Column(
            children: [
              SizedBox(
                height: MyUtility(context).height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Documents',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.48,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconSearchBoxB(),
                      AddButton(
                        text: 'Add Image',
                        onPressed: () {
                          showDialog(
                            context: context,
                            barrierDismissible: true,
                            barrierColor: Colors.black.withOpacity(0.5),
                            builder: (BuildContext context) {
                              return Dialog(
                                backgroundColor: Colors.transparent,
                                insetPadding: EdgeInsets.all(10),
                                child: AddImagePopup(),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  width: MyUtility(context).width * 0.9,
                  height: MyUtility(context).height * 0.07,
                  decoration: ShapeDecoration(
                    color: Color(0xFF0F253A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      PageChangeButton(text: 'General', onPressed: () {}),
                      PageChangeButton(text: 'Services', onPressed: () {}),
                      PageChangeButton(
                          text: 'Split equipments', onPressed: () {})
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MyUtility(context).height * 0.1,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: galleryItems.map((item) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: GalleryContainer(
                        galleryImage: item['image']!,
                        description: item['description']!,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
