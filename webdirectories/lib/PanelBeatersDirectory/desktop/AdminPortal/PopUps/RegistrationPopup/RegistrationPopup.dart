import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpTextField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpsButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpsDropdown.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopupCheckBox.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';

class RegistrationPopup extends StatefulWidget {
  final Function(Map<String, dynamic>) onAddRegistration;
  const RegistrationPopup({super.key, required this.onAddRegistration});

  @override
  State<RegistrationPopup> createState() => _RegistrationPopupState();
}

class _RegistrationPopupState extends State<RegistrationPopup> {
  List<DropdownMenuItem<String>> registrationTypeData = [];
  var formKey = GlobalKey<FormState>();
  final _firestore = FirebaseFirestore.instance;
  final TextEditingController _registrationType = TextEditingController();
  final TextEditingController _registrationNumber = TextEditingController();
  bool displayOnBusinessProfile = false;
  bool _isLoading = true;

  @override
  void initState() {
    _getRegistrationTypes();
    setState(() {
      _registrationType.text = '0';
    });
    super.initState();
  }

  void _getRegistrationTypes() async {
    try {
      QuerySnapshot<Map<String, dynamic>> registrationSnapshot =
          await _firestore.collection('registration_type').get();
      List<DropdownMenuItem<String>> registrationTypes = [
        const DropdownMenuItem(
          value: '',
          child: Text('-- Select --'),
        )
      ];
      for (var doc in registrationSnapshot.docs) {
        String id = doc.data()['registrationTypeId'].toString();
        String name = doc.data()['registrationType'];
        registrationTypes.add(DropdownMenuItem<String>(
          value: id,
          child: Text(name),
        ));
      }

      setState(() {
        registrationTypeData = registrationTypes;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Couldn\'t fetch registration types.'),
          ),
        );
      }
    }
  }

  void onSubmit() async {
    if (formKey.currentState!.validate()) {
      try {
        setState(() {
          _isLoading = true;
        });

        StoredUser? user = await getUserInfo();

        if (user == null) throw "User not found";

        var addData = {
          'registrationTypeId': int.parse(_registrationType.text),
          'registrationNumbers': int.parse(_registrationNumber.text),
          'registrationDisplay': displayOnBusinessProfile == true ? 1 : 0,
          'listingsId': int.parse(user.id),
          'dateAdded': DateTime.now(),
        };
        await _firestore.collection('registration_numbers').add(addData);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Registration number added successfully'),
            ),
          );
          widget.onAddRegistration(addData);

          setState(() {
            _isLoading = false;
          });
          Navigator.pop(context);
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  'Something went wrong. Add registration number unsuccessful, $e'),
            ),
          );
          Navigator.pop(context);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _isLoading == true
          ? const CircularProgressIndicator()
          : Container(
              width: MyUtility(context).width * 0.3,
              height: MyUtility(context).height * 0.5,
              decoration: ShapeDecoration(
                color: Color(0xFF0F253A),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 5,
                    strokeAlign: BorderSide.strokeAlignOutside,
                    color: Color(0xFFEF9040),
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Insert Registration',
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
                    Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PopUpDropdownField(
                              text: 'Registration Type',
                              controller: _registrationType,
                              items: registrationTypeData,
                              initialValue: '',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            PopUpTextField(
                              text: 'Registration Number',
                              controller: _registrationNumber,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            PopupCheckBox(
                              value: displayOnBusinessProfile,
                              onChanged: (newValue) {
                                setState(() {
                                  displayOnBusinessProfile = newValue;
                                });
                              },
                              text: 'Display on Business Profile',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            PopUpsButton(
                                text: 'Save',
                                onTap: onSubmit,
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
