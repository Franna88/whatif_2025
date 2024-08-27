import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpTextField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpsButton.dart';
import 'package:webdirectories/myutility.dart';

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
        width: MyUtility(context).width * 0.295,
        height: MyUtility(context).height * 0.45,
        decoration: ShapeDecoration(
          color: Color(0xFF0F253A),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 3,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: Color(0xFFEF9040),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Add Media',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21.76,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  CloseButton(),
                ],
              ),
              PopUpTextField(
                text: 'Title',
                controller: _titleController,
              ),
              PopUpTextField(
                text: 'Link',
                controller: _linkController,
              ),
              PopUpsButton(
                text: 'Save',
                onTap: _saveMedia, // Save media on button tap
              ),
            ],
          ),
        ),
      ),
    );
  }
}
