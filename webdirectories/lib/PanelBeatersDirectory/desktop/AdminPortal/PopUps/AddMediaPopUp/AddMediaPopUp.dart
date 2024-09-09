import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpTextField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpsButton.dart';
import 'package:webdirectories/myutility.dart';

import '../PopUpsCommon/PopUpsCancel.dart';

class AddMediaPopup extends StatefulWidget {
  final VoidCallback onMediaAdded;

  const AddMediaPopup({super.key, required this.onMediaAdded});

  @override
  State<AddMediaPopup> createState() => _AddMediaPopupState();
}

class _AddMediaPopupState extends State<AddMediaPopup> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();

  Future<void> _saveMedia() async {
    String title = _titleController.text.trim();
    String link = _linkController.text.trim();

    if (title.isNotEmpty && link.isNotEmpty) {
      StoredUser? user = await getUserInfo();
      if (user != null) {
        int listingId = int.parse(user.id);
        try {
          await FirebaseFirestore.instance.collection('listings_links').add({
            'linkTitle': title,
            'urlLink': link,
            'listingsId': listingId,
            'linksOrder': 0, // Adjust as necessary
          });
          widget.onMediaAdded(); // Notify parent to update UI
          Navigator.of(context).pop(); // Close the popup
          print('Media saved: Title = $title, Link = $link'); // Debugging print
        } catch (e) {
          print('Failed to add media: $e'); // Debugging print
        }
      } else {
        print('User not found'); // Debugging print
      }
    } else {
      print('Title and link cannot be empty'); // Debugging print
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MyUtility(context).width * 0.3,
        height: MyUtility(context).height * 0.35,
        decoration: ShapeDecoration(
          color: Color(0xFFD9D9D9),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              strokeAlign: BorderSide.strokeAlignOutside,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MyUtility(context).width,
              height: MyUtility(context).height * 0.06,
              decoration: ShapeDecoration(
                color: Color(0xFFD17226),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.09),
                    topRight: Radius.circular(8.09),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      'Add Media',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.65,
                        fontFamily: 'raleway',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  CloseButton(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  PopUpTextField(
                    text: 'Link Title',
                    controller: _titleController,
                  ),
                  SizedBox(
                    height: MyUtility(context).height * 0.02,
                  ),
                  PopUpTextField(
                    text: 'URL Link',
                    controller: _linkController,
                  ),
                  SizedBox(
                    height: MyUtility(context).height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PopUpsButton(
                        text: 'Save',
                        onTap: _saveMedia, // Save media on button tap
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      PopUpsCancel(
                        text: 'Cancel',
                        onTap: () {},
                        buttonColor: Color(0xFF3C4043),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
