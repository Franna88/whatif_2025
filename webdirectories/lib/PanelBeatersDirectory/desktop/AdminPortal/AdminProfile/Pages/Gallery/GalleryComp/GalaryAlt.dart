import 'package:cached_firestorage/lib.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/Gallery/GalleryComp/GalaryAltContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/Gallery/GalleryComp/GalleryContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/Gallery/GalleryComp/PageChangeButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/AddButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/CommonReuseable/IconSearchBoxB.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/AddImagePopup/AddImagepopup.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/firebaseImageUtils.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

class GalleryAlt extends StatefulWidget {
  const GalleryAlt({super.key});

  @override
  State<GalleryAlt> createState() => _GalleryAltState();
}

class _GalleryAltState extends State<GalleryAlt> {
  List<Map<String, dynamic>> galleryItems = [];
  final _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> _fetchGalleryData() async {
    StoredUser? user = await getUserInfo();

    if (user == null) {
      return [];
    }

    try {
      QuerySnapshot gallerySnapshot = await _firestore
          .collection('gallery')
          .where('listingsId', isEqualTo: int.parse(user.id))
          .get();

      if (gallerySnapshot.docs.isNotEmpty) {
        List<Map<String, dynamic>> processedData = [];
        for (var doc in gallerySnapshot.docs) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          String fileName = data['immageFile'];
          String? url = await getImageUrl('listings/$fileName');

          if (url != null) {
            data['immageFile'] = url;
          }

          processedData.add(data);
        }
        return processedData;
      } else {
        return [];
      }
    } catch (e) {
      print('error fetching gallery data: $e');
      return [];
    }
  }

  void _onImageUpload(Map<String, dynamic> newImageData) {
    List<Map<String, dynamic>> images = galleryItems;
    images.add(newImageData);
    setState(() {
      galleryItems = images;
    });
  }

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 12.5, top: 12.5),
              child: Text(
                'Image limit: 12 images, max 2 Megabytes each. Prefer landscape format. Accepted file types: JPG, JPEG, PNG, GIF.',
                style: TextStyle(
                  color: Color(0xFFD17226),
                  fontSize: 13.7364,
                  fontFamily: 'ralewaysemi',
                ),
              ),
            ),
          ],
        ),
        Center(
          child: Container(
            width: MyUtility(context).width * 0.8,
            height: MyUtility(context).height,
            decoration: ShapeDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.57, -0.82),
                end: Alignment(-0.57, 0.82),
                colors: [
                  Color(0x19777777),
                  Colors.white.withOpacity(0.4000000059604645)
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0xBF000000),
                  blurRadius: 24,
                  offset: Offset(0, 4),
                  spreadRadius: -1,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MyUtility(context).height * 0.05,
                  ),
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
                            child: AddImagePopup(
                              onImageUpload: (Map<String, dynamic> newImage) {},
                            ),
                          );
                        },
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Drag and drop to reorder list!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.6064,
                          fontFamily: 'raleway',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconSearchBoxB(),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    height: MyUtility(context).height * 0.7,
                    child: FutureBuilder<List<Map<String, dynamic>>>(
                      future: _fetchGalleryData(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (snapshot.hasError) {
                          return Center(
                            child: Text('Something went wrong.',
                                style: const TextStyle(color: Colors.black)),
                          );
                        }
                        if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return const Center(
                            child: Text(
                              'No images found',
                              style: TextStyle(color: Colors.black),
                            ),
                          );
                        }
                        List<Map<String, dynamic>> images = snapshot.data!;
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50.0, vertical: 20.0),
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  4, // Increased from 3 to 4 for smaller containers
                              mainAxisSpacing: 8.0,
                              crossAxisSpacing: 8.0,
                              childAspectRatio: 4 /
                                  3.5, // Adjusted aspect ratio for a better fit
                            ),
                            itemCount: images.length,
                            itemBuilder: (context, index) {
                              Map<String, dynamic> image = images[index];
                              return GalleryAltContainer(
                                galleryImage: image['immageFile'],
                                description: image['immageTitle'],
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
