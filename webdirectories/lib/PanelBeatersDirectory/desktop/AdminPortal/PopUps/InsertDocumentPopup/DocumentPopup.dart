import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/AttachmentPopupButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpTextField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpsButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpsDatePicker.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpsDropdown.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopupCheckBox.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

class DocumentPopup extends StatefulWidget {
  const DocumentPopup({super.key});

  @override
  State<DocumentPopup> createState() => _DocumentPopupState();
}

class _DocumentPopupState extends State<DocumentPopup> {
  final _formKey = GlobalKey<FormState>();
  final _firestore = FirebaseFirestore.instance;
  final _firestorage = FirebaseStorage.instance;
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _subCategoryController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _expiryController = TextEditingController();
  List<Map<String, dynamic>> _documentCategoryData = [];
  List<DropdownMenuItem<String>> _documentSubCategoryMenuData = [];
  List<Map<String, dynamic>> _documentSubCategoryData = [];
  Map<String, dynamic> _pickedFiles = {
    'file': null,
    'fileName': '',
  };
  bool emailNotification = false;
  bool _isLoading = false;

  @override
  void initState() {
    _getDocumentCategory();
    super.initState();
  }

  void _getDocumentCategory() async {
    QuerySnapshot<Map<String, dynamic>> docCategorySnapShot =
        await _firestore.collection('document_category').get();
    QuerySnapshot<Map<String, dynamic>> docSubCategorySnapShot =
        await _firestore.collection('document_sub_category').get();

    List<DropdownMenuItem<String>> documentSubCategoryData = [
      const DropdownMenuItem(value: '', child: Text('-- Select --')),
    ];
    List<Map<String, dynamic>> documentCategoryData = [];

    if (docCategorySnapShot.docs.isNotEmpty) {
      for (var doc in docSubCategorySnapShot.docs) {
        String id = doc.data()['documentSubCategoryId'].toString();
        String name = doc.data()['documentSubCategory'];

        documentSubCategoryData.add(DropdownMenuItem(
          value: id,
          child: Text(name),
        ));
      }
    }

    if (docCategorySnapShot.docs.isNotEmpty) {
      documentCategoryData =
          docCategorySnapShot.docs.map((doc) => doc.data()).toList();
    }

    setState(() {
      _documentCategoryData = documentCategoryData;
      _documentSubCategoryData =
          docSubCategorySnapShot.docs.map((doc) => doc.data()).toList();
      _documentSubCategoryMenuData = documentSubCategoryData;
    });
  }

  void _saveForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      // Process form submission
      print('Form is valid');
      try {
        // Upload files and save links to Firestore
        await uploadFilesAndSaveLinks(
            _pickedFiles['file'] as Uint8List, _pickedFiles['fileName']);

        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Document added successfully')),
        );

        Navigator.pop(context);

        setState(() {
          _isLoading = false;
        });
      } catch (e) {
        if (!mounted) return;
        print('Error adding document: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Something went wrong. Please try again')),
        );
        Navigator.pop(context);
      }
    } else {
      print('Form is not valid');
    }
  }

  Future<void> uploadFilesAndSaveLinks(Uint8List file, String fileName) async {
    StoredUser? user = await getUserInfo();

    if (user == null) throw "User not found";

    // Upload file
    try {
      Reference storageRef = _firestorage.ref().child('documents/$fileName');
      UploadTask uploadTask = storageRef.putData(file);

      await uploadTask.whenComplete(() {});
    } catch (e) {
      print('Error uploading file: $e');
    }

    try {
      // Store document in listings_documents collection

      int category = _documentCategoryData
          .where((cat) => cat['documentCategory'] == _categoryController.text)
          .first['documentCategoryId'];
      await _firestore.collection('listings_documents').add({
        'listingsId': int.parse(user.id),
        'membersId': int.parse(user.memberId),
        'documentCategoryId': category,
        'documentSubCategoryId': int.parse(_subCategoryController.text),
        'documentFile': fileName,
        'documentTitle': _titleController.text,
        'expiryDate': _expiryController.text,
        'expEmail': emailNotification,
        'dateAdded': DateTime.now(),
        'dateUpdate': ''
      });

      // Store document in documents collection
      await _firestore.collection('documents').add({
        'documentFile': fileName,
        'documentTitle': _titleController.text,
        'listingsId': int.parse(user.id),
        'membersId': int.parse(user.memberId),
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('Error adding document: $e');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Something went wrong. Please try again')),
      );
    }
  }

  void _pickFiles() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'png', 'jpg', 'jpeg', 'doc', 'docx'],
        allowMultiple: false,
      );

      if (result != null) {
        Uint8List file = result.files.first.bytes!;
        String fileName = result.files.first.name;

        setState(() {
          _pickedFiles = {
            'file': file,
            'fileName': fileName,
          };
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to pick files: $e'),
          ),
        );
      }
    }
  }

  void _onSubCategoryChanged(String subCategoryValue) {
    String newCategoryValue = '';

    _documentSubCategoryData.forEach((subcategory) {
      if (subcategory['documentSubCategoryId'] == int.parse(subCategoryValue)) {
        newCategoryValue = _documentCategoryData
            .where((category) =>
                category['documentCategoryId'] ==
                subcategory['documentCategoryId'])
            .first['documentCategory'];
      }
    });
    setState(() {
      _categoryController.text = newCategoryValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MyUtility(context).width * 0.3,
        height: MyUtility(context).height * 0.85,
        decoration: ShapeDecoration(
          color: Color(0xFF0F253A),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 5,
              color: Color(0xFFEF9040),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Insert Document',
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
                              WidgetStateProperty.all(Colors.white)),
                    ),
                  ],
                ),
                PopUpDropdownField(
                  text: 'Sub Category',
                  controller: _subCategoryController,
                  items: _documentSubCategoryMenuData,
                  initialValue: '',
                  onChanged: _onSubCategoryChanged,
                ),
                PopUpTextField(
                  text: 'Category',
                  controller: _categoryController,
                ),
                PopUpTextField(
                  text: 'Title',
                  controller: _titleController,
                ),
                PopUpDatePicker(
                  text: 'Expiry Date',
                  controller: _expiryController,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Notification Email',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.32,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            PopupCheckBox(
                              value: emailNotification,
                              onChanged: (newValue) {
                                setState(() {
                                  emailNotification = newValue;
                                });
                              },
                              text: 'Yes',
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            PopupCheckBox(
                              value: !emailNotification,
                              onChanged: (newValue) {
                                setState(() {
                                  emailNotification = !newValue;
                                });
                              },
                              text: 'No',
                            ),
                          ],
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: AttachmentPopupButton(
                          text: 'Attach File', onTap: _pickFiles),
                    )
                  ],
                ),
                PopUpsButton(
                  text: 'Save',
                  onTap: _saveForm,
                  waiting: _isLoading,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
