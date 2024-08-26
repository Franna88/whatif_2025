import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/AttachmentPopupButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/BiggerPopupTextField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpTextField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpsButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/loginMainPage/ownersPortal.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/advertisement.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/firebaseImageUtils.dart';
import 'package:webdirectories/myutility.dart';

class AddAdvertPopup extends StatefulWidget {
  final Function(AdvertisementModel) onAdvertAdded;
  final StoredUser? user;
  final int adCount;
  const AddAdvertPopup(
      {super.key,
      required this.onAdvertAdded,
      this.user,
      required this.adCount});

  @override
  State<AddAdvertPopup> createState() => _AddAdvertPopupState();
}

class _AddAdvertPopupState extends State<AddAdvertPopup> {
  final _formKey = GlobalKey<FormState>();
  final _firestore = FirebaseFirestore.instance;
  final _firestorage = FirebaseStorage.instance;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  bool _isLoading = false;
  XFile? _selectedImage;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = image;
      });
    }
  }

  void _saveForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      if (_selectedImage != null) {
        try {
          Uint8List data = await _selectedImage!.readAsBytes();
          final storageRef =
              _firestorage.ref().child('listings/${_selectedImage!.name}');
          final uploadTask = storageRef.putData(data);
          await uploadTask;

          if (widget.user == null) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('User not logged in'),
            ));
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      OwnersPortal(), // Replace with your destination screen
                ));
          }
          AdvertisementModel newAddData = AdvertisementModel(
            dateAdded: DateTime.now().toIso8601String(),
            dateUpdated: '',
            immageDescription: _descriptionController.text,
            immageFile: _selectedImage!.name,
            immageTitle: _titleController.text,
            listingsId: int.parse(widget.user!.id),
            membersId: int.parse(widget.user!.memberId),
            specialsOrder: widget.adCount + 1,
          );
          await _firestore.collection('specials').add(newAddData.toMap());
          if (!mounted) return;
          String? url = await getImageUrl('listings/${newAddData.immageFile}');
          newAddData.immageFile = url;
          widget.onAdvertAdded(newAddData);
          Navigator.pop(context);
          setState(() {
            _isLoading = false;
          });
        } catch (e) {
          print('error adding advert: $e');
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MyUtility(context).width * 0.295,
        height: MyUtility(context).height * 0.6,
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
                  const Text(
                    'Add Advert',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21.76,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  CloseButton(
                      style: ButtonStyle(
                    foregroundColor:
                        WidgetStateProperty.all<Color>(Colors.white),
                  )),
                ],
              ),
              Form(
                  key: _formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PopUpTextField(
                          text: 'Title',
                          controller: _titleController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        BiggerPopupTextField(
                          text: 'Description',
                          controller: _descriptionController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _selectedImage == null
                                ? AttachmentPopupButton(
                                    text: 'Attach File', onTap: _pickImage)
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                        AttachmentPopupButton(
                                            text: 'Change File',
                                            onTap: _pickImage),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          _selectedImage!.name,
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ]),
                            const SizedBox(
                              height: 15,
                            ),
                            PopUpsButton(
                              text: 'save',
                              onTap: _saveForm,
                              waiting: _isLoading,
                            ),
                          ],
                        )
                      ])),
            ],
          ),
        ),
      ),
    );
  }
}
