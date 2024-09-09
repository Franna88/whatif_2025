import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/BiggerPopupTextField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpTextField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpsButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

import '../PopUpsCommon/PopUpsCancel.dart';

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
        width: MyUtility(context).width * 0.3,
        height: MyUtility(context).height * 0.55,
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
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Add Member',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.65,
                        fontFamily: 'raleway',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    CloseButton(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      PopUpTextField(
                        text: 'First Name',
                        controller: _firstNameController,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      PopUpTextField(
                        text: 'Last Name',
                        controller: _surname,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      BiggerPopupTextField(
                        text: 'Description',
                        controller: _descriptionController,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PopUpsButton(
                              text: 'save',
                              onTap: handleAddNewMemberSubmit,
                              waiting: _isLoading),
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
