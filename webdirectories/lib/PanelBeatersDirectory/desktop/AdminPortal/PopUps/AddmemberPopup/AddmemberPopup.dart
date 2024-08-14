import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/BiggerPopupTextField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpTextField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpsButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

class AddMemberPopup extends StatefulWidget {
  final List<Map<String, dynamic>> teamProfiles;
  final Function(Map<String, dynamic>) add;
  const AddMemberPopup(
      {super.key, required this.teamProfiles, required this.add});

  @override
  State<AddMemberPopup> createState() => _AddMemberPopupState();
}

class _AddMemberPopupState extends State<AddMemberPopup> {
  final _firestore = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _surname = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  bool _isLoading = false;

  void handleAddNewMemberSubmit() async {
    if (_formKey.currentState!.validate()) {
      try {
        setState(() {
          _isLoading = true;
        });

        StoredUser? user = await getUserInfo();

        if (user == null) throw "User not found";
        var addData = {
          'firstName': _firstNameController.text,
          'surname': _surname.text,
          'shortDescription': _descriptionController.text,
          'membersId': int.parse(user.memberId),
          'listingsId': int.parse(user.id),
          'teamOrder': widget.teamProfiles.length + 1,
          'personPhoto': '',
          'dateAdded': DateTime.now(),
          'dateUpdated': '',
        };
        await _firestore.collection('listings_team').add(addData);

        setState(() {
          _isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('New member added successfully')),
        );

        widget.add(addData);

        Navigator.pop(context);
      } catch (e) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Something went wrong. Please try again.')),
        );
        print('Error adding new member: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MyUtility(context).width * 0.295,
        height: MyUtility(context).height * 0.65,
        decoration: ShapeDecoration(
          color: Color(0xFF0F253A),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 3,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: Color(0xFFEF9040),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Add Member',
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
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      PopUpTextField(
                        text: 'First Name',
                        controller: _firstNameController,
                      ),
                      PopUpTextField(
                        text: 'Last Name',
                        controller: _surname,
                      ),
                      BiggerPopupTextField(
                        text: 'Description',
                        controller: _descriptionController,
                      ),
                      PopUpsButton(
                          text: 'save',
                          onTap: handleAddNewMemberSubmit,
                          waiting: _isLoading)
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
