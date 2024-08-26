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
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

class GalleryAlt extends StatefulWidget {
  const GalleryAlt({super.key});

  @override
  State<GalleryAlt> createState() => _GalleryAltState();
}

class _GalleryAltState extends State<GalleryAlt> {
  late List<Map<String, String>> galleryItems;
  final _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> _fetchGalleryData() async {
    StoredUser? user = await getUserInfo();

    if (user == null) {
      return [{}];
    }

    try {
      QuerySnapshot gallerySnapshot = await _firestore
          .collection('gallery')
          .where('listingsId', isEqualTo: int.parse(user.id))
          .get();

      if (gallerySnapshot.docs.isNotEmpty) {
        for (var doc in gallerySnapshot.docs) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          String fileName = data['immageFile'];
          data['immageFile'] = 'listings/$fileName';
        }
        return gallerySnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
      } else {
        return [
          {'immageFile': 'images/gallery.jpg', 'immageTitle': 'Car wash'},
          {'immageFile': 'images/gallery.jpg', 'immageTitle': 'Car wash'},
          {'immageFile': 'images/gallery.jpg', 'immageTitle': 'Car wash'},
        ];
      }
    } catch (e) {
      print('error fetching gallery data: $e');
      return [{}];
    }
  }

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    return Center(
      child: SizedBox(
        height: heightDevice,
        width: MyUtility(context).width * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MyUtility(context).height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Galery',
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
                    PageChangeButton(text: 'Split equipments', onPressed: () {})
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              height: MyUtility(context).height * 0.7,
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: _fetchGalleryData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
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
                        horizontal: 100.0, vertical: 20.0),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, // Number of items per row
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 8.0,
                        childAspectRatio:
                            3 / 3.5, // Adjust the aspect ratio as needed
                      ),
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> image = images[index];
                        // return RemotePicture(
                        //   imagePath: 'listings/${image['immageFile']}',
                        //   mapKey: image['immageTitle'],
                        // );
                        return GalaryAltContainer(
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
    );
  }
}
