import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../../myutility.dart';
import '../../../../models/advertisement.dart';
import '../../../../models/storedUser.dart';
import '../../../../utils/firebaseImageUtils.dart';
import '../../../OwnersPortal/loginPages/loginMainPage/ownersPortal.dart';
import '../PopUpsCommon/AttachmentPopupButton.dart';
import '../PopUpsCommon/PopUpsCancel.dart';
import '../PopUpsCommon/PopUpsButton.dart';
import '../PopUpsCommon/PopUpTextField.dart';
import 'AddEditor.dart';

class AddAdvertPopup extends StatefulWidget {
  final Function(AdvertisementModel) onAdvertAdded;
  final StoredUser? user;
  final int adCount;

  const AddAdvertPopup({
    super.key,
    required this.onAdvertAdded,
    this.user,
    required this.adCount,
  });

  @override
  State<AddAdvertPopup> createState() => _AddAdvertPopupState();
}

class _AddAdvertPopupState extends State<AddAdvertPopup> {
  final _formKey = GlobalKey<FormState>();
  final _firestore = FirebaseFirestore.instance;
  final _firestorage = FirebaseStorage.instance;
  final TextEditingController _titleController = TextEditingController();
  final QuillController _descriptionController =
      QuillController.basic(); // Initialize QuillController here
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

  Future<String> _getDescriptionAsPlainText() async {
    final doc = _descriptionController.document;
    return jsonEncode(doc.toDelta().toJson());
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
                  builder: (context) => OwnersPortal(),
                ));
            return;
          }

          String descriptionText = await _getDescriptionAsPlainText();

          AdvertisementModel newAddData = AdvertisementModel(
            dateAdded: DateTime.now().toIso8601String(),
            dateUpdated: '',
            immageDescription: descriptionText, // Save description as JSON
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
          print('Error adding advert: $e');
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
        width: MyUtility(context).width * 0.3,
        height: MyUtility(context).height * 0.9,
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
                    child: const Text(
                      'Add Advert',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.73,
                        fontFamily: 'raleway',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  CloseButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
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
                      text: 'Title',
                      controller: _titleController,
                    ),
                    const SizedBox(height: 20),
                    // Pass the controller to AddEditor
                    AddEditor(controller: _descriptionController),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Edit/Add Image:',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.61,
                            fontFamily: 'raleway',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        _selectedImage == null
                            ? Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: AttachmentPopupButton(
                                    text: 'Attach File', onTap: _pickImage),
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AttachmentPopupButton(
                                      text: 'Change File', onTap: _pickImage),
                                  const SizedBox(height: 10),
                                  Text(
                                    _selectedImage!.name,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                        SizedBox(
                          width: MyUtility(context).width * 0.17,
                          child: Text(
                            'Note: Image may not be larger than 2 megabytes. Preferable landscape images.\nImage format: .jpg, jpeg, .png and .gif',
                            style: TextStyle(
                              color: Color(0xFFD17226),
                              fontSize: 10,
                              fontFamily: 'ralewaymedium',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PopUpsButton(
                              text: 'Save',
                              onTap: _saveForm,
                              waiting: _isLoading,
                            ),
                            SizedBox(width: 8),
                            PopUpsCancel(
                              text: 'Cancel',
                              onTap: () {},
                              buttonColor: Color(0xFF3C4043),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
