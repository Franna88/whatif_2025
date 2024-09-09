import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/AttachmentPopupButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpTextField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpsButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpsDropdown.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

import '../PopUpsCommon/PopUpsCancel.dart';

class AddImagePopup extends StatefulWidget {
  final Function(Map<String, dynamic> newImage) onImageUpload;
  const AddImagePopup({super.key, required this.onImageUpload});

  @override
  State<AddImagePopup> createState() => _AddImagePopupState();
}

class _AddImagePopupState extends State<AddImagePopup> {
  final _formKey = GlobalKey<FormState>();
  final _firestore = FirebaseFirestore.instance;
  final _firestorage = FirebaseStorage.instance;
  bool displayOnBusinessProfile = false;
  final TextEditingController _imageTitleTypeController =
      TextEditingController();
  // final List<DropdownMenuItem<String>> registrationTypeData = [
  //   const DropdownMenuItem<String>(
  //     value: '',
  //     child: Text('-- Select --'),
  //   ),
  //   const DropdownMenuItem<String>(
  //     value: 'General',
  //     child: Text('General'),
  //   ),
  //   const DropdownMenuItem<String>(
  //     value: 'Services',
  //     child: Text('Services'),
  //   ),
  //   const DropdownMenuItem<String>(
  //     value: 'Split Equipment',
  //     child: Text('Split Equipment'),
  //   ),
  // ];

  XFile? _selectedImage;
  bool _isLoading = false;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _selectedImage = image;
    });
  }

  void _saveForm() async {
    if (_formKey.currentState!.validate()) {
      try {
        setState(() {
          _isLoading = true;
        });

        StoredUser? user = await getUserInfo();
        if (user == null) {
          if (!mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('User not found'),
            ),
          );

          setState(() {
            _isLoading = false;
          });
          return;
        }

        XFile? image = _selectedImage;
        if (image == null) {
          if (!mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Please select an image'),
            ),
          );
          setState(() {
            _isLoading = false;
          });
          return;
        } else {
          Uint8List data = await image.readAsBytes();
          final storageRef = _firestorage.ref().child('listings/${image.name}');
          final uploadTask = storageRef.putData(data);
          await uploadTask;
          print(
            'Image uploaded successfully: ${image.name}',
          );
          Map<String, dynamic> imageData = {
            'dateAdded': DateTime.now().toIso8601String(),
            'dateUpdated': '',
            'immageTitle': _imageTitleTypeController.text,
            'immageFile': image.name,
            'listingsId': int.parse(user.id),
          };

          await _firestore.collection('gallery').add(imageData);

          if (!mounted) return;
          setState(() {
            _isLoading = false;
          });

          widget.onImageUpload(imageData);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Image added successfully'),
            ),
          );
          Navigator.of(context).pop();
        }
      } catch (e) {
        print('Error adding image: $e');
        if (!mounted) return;
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Something went wrong. Please try again')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MyUtility(context).width * 0.3,
        height: MyUtility(context).height * 0.4,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      'Add Image',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.65,
                        fontFamily: 'raleway',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  CloseButton(
                    style: ButtonStyle(
                      foregroundColor: WidgetStateProperty.all(Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PopUpTextField(
                        text: 'Image Title',
                        controller: _imageTitleTypeController,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _selectedImage == null
                          ? AttachmentPopupButton(
                              text: 'Attach File', onTap: _pickImage)
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  _selectedImage!.path,
                                  width: 100,
                                  height: 100,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                AttachmentPopupButton(
                                    text: 'Change File', onTap: _pickImage),
                              ],
                            ),
                      SizedBox(
                        height: MyUtility(context).height * 0.02,
                      ),
                      SizedBox(
                        width: MyUtility(context).width * 0.17,
                        child: Text(
                          'Note: Image may not be larger than 2 megabytes. Preferable landscape images. Image format: .jpg, jpeg, .png and .gif',
                          style: TextStyle(
                            color: Color(0xFFD17226),
                            fontSize: 10,
                            fontFamily: 'ralewaymedium',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MyUtility(context).height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PopUpsButton(
                            text: 'Save',
                            onTap: _saveForm,
                            waiting: _isLoading,
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
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
