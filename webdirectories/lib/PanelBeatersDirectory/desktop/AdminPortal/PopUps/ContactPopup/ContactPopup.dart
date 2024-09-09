import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpTextField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpsButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

import '../PopUpsCommon/PopUpsCancel.dart';

class ContactPopup extends StatefulWidget {
  final Function(Map<String, dynamic> newContact) onAddContact;
  const ContactPopup({super.key, required this.onAddContact});

  @override
  State<ContactPopup> createState() => _ContactPopupState();
}

class _ContactPopupState extends State<ContactPopup> {
  final _formKey = GlobalKey<FormState>();
  final _firestore = FirebaseFirestore.instance;
  final TextEditingController _contactPersonController =
      TextEditingController();
  final TextEditingController _designationController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool displayOnBusinessProfile = false;
  bool _isLoading = false;
  void _onsaveform() async {
    if (_formKey.currentState!.validate()) {
      {
        setState(() {
          _isLoading = true;
        });
        try {
          StoredUser? user = await getUserInfo();

          if (user == null) throw "User not found";

          Map<String, dynamic> addData = {
            'contactPerson': _contactPersonController.text,
            'contactPersonCell': _phoneController.text,
            'contactPersonEmail': _emailController.text,
            'contactPersonDesignation': _designationController.text,
            'listingsId': int.parse(user.id),
          };

          await _firestore.collection('contact_person').add(addData);

          addData.remove('listingsId');

          if (!mounted) return;

          setState(() {
            _isLoading = false;
          });

          widget.onAddContact(addData);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Contact Person added successfully')),
          );
        } catch (e) {
          print('Error adding contact person: $e');

          if (!mounted) return;

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Something went wrong. Please try again')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MyUtility(context).width * 0.3,
        height: MyUtility(context).height * 0.565,
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
                      'Insert Registration',
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
                        foregroundColor: WidgetStateProperty.all(Colors.white)),
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
                      text: 'Contact Person',
                      controller: _contactPersonController,
                    ),
                    SizedBox(
                      height: MyUtility(context).height * 0.02,
                    ),
                    PopUpTextField(
                      text: 'Designation',
                      controller: _designationController,
                    ),
                    SizedBox(
                      height: MyUtility(context).height * 0.02,
                    ),
                    PopUpTextField(
                      text: 'Phone',
                      controller: _phoneController,
                    ),
                    SizedBox(
                      height: MyUtility(context).height * 0.02,
                    ),
                    PopUpTextField(
                      text: 'Email',
                      controller: _emailController,
                    ),
                    SizedBox(
                      height: MyUtility(context).height * 0.02,
                    ),
                    Row(
                      children: [
                        PopUpsButton(
                          text: 'Save',
                          onTap: _onsaveform,
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
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
