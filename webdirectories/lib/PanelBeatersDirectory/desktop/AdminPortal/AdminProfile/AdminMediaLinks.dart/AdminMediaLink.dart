import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/AdminMediaLinks.dart/MediaLinkContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/CommonReuseable/IconSearchBoxB.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/AddMediaPopUp/AddMediaPopup.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

import '../ProfileComp/buttons/AddButton.dart';

class MediaLink {
  final String linkTitle;
  final String linkUrl;
  final int linksOrder;

  MediaLink({
    required this.linkTitle,
    required this.linkUrl,
    required this.linksOrder,
  });

  factory MediaLink.fromMap(Map<String, dynamic> map) {
    return MediaLink(
      linkTitle: map['linkTitle'],
      linkUrl: map['urlLink'],
      linksOrder: map['linksOrder'],
    );
  }
}

class AdminMediaLink extends StatefulWidget {
  const AdminMediaLink({super.key});

  @override
  State<AdminMediaLink> createState() => _AdminMediaLinkState();
}

class _AdminMediaLinkState extends State<AdminMediaLink> {
  final _firestore = FirebaseFirestore.instance;
  List<MediaLink> _mediaList = [];

  @override
  void initState() {
    _fetchMediaData();
    super.initState();
  }

  Future<void> _fetchMediaData() async {
    StoredUser? user = await getUserInfo();
    if (user != null) {
      int listingId = int.parse(user.id);
      try {
        QuerySnapshot mediaDoc = await _firestore
            .collection('listings_links')
            .where('listingsId', isEqualTo: listingId)
            .get();

        if (mediaDoc.docs.isNotEmpty) {
          setState(() {
            _mediaList = mediaDoc.docs
                .map((docs) =>
                    MediaLink.fromMap(docs.data() as Map<String, dynamic>))
                .toList();
          });
          print('Fetched Media Data: $_mediaList'); // Debugging print
        } else {
          print('No media found'); // Debugging print
        }
      } catch (e) {
        print('Error fetching media data: $e'); // Debugging print
      }
    } else {
      print('User not found'); // Debugging print
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 20),
      child: Center(
        child: SizedBox(
          width: MyUtility(context).width * 0.9,
          height: MyUtility(context).height * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AddButton(
                    text: 'Insert New Record',
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        barrierColor: Colors.black.withOpacity(0.5),
                        builder: (BuildContext context) {
                          return Dialog(
                            backgroundColor: Colors.transparent,
                            insetPadding: EdgeInsets.all(10),
                            child: AddMediaPopup(
                              onMediaAdded:
                                  _fetchMediaData, // Refresh the list after adding new media
                            ),
                          );
                        },
                      );
                    },
                  ),
                  IconSearchBoxB(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 15),
                child: Container(
                  width: MyUtility(context).width * 0.9,
                  height: MyUtility(context).height * 0.065,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: MyUtility(context).width * 0.26,
                          child: Text(
                            'Media Type',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.6064,
                              fontFamily: 'ralewaybold',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MyUtility(context).width * 0.46,
                          child: Text(
                            'Media Link',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.6064,
                              fontFamily: 'ralewaybold',
                            ),
                          ),
                        ),
                        Text(
                          'Edit',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.6064,
                            fontFamily: 'ralewaybold',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _mediaList.length,
                  itemBuilder: (context, index) {
                    final media = _mediaList[index];
                    return MediaLinkContainer(
                      mediaType: media.linkTitle,
                      mediaLink: media.linkUrl,
                      pressEdit: () {
                        // Edit action
                      },
                      isEven: index % 2 == 0,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
