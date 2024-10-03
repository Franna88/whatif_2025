import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpTextField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpsButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopupCheckBox.dart';
import 'package:webdirectories/myutility.dart';

class NewUserPopup extends StatefulWidget {
  final Function(Map<String, String>) onSubmit; // Callback function
  final Map<String, String>? initialData; // Optional initial data for editing

  const NewUserPopup({super.key, required this.onSubmit, this.initialData});

  @override
  State<NewUserPopup> createState() => _NewUserPopupState();
}

class _NewUserPopupState extends State<NewUserPopup> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  bool displayOnProfile = false; // Checkbox value

  @override
  void initState() {
    super.initState();
    if (widget.initialData != null) {
      // Pre-fill data if initialData is provided
      _fullNameController.text = widget.initialData!['fullName'] ?? '';
      _emailController.text = widget.initialData!['email'] ?? '';
      _mobileController.text = widget.initialData!['mobile'] ?? '';
      displayOnProfile =
          widget.initialData!['displayOnProfile']?.toLowerCase() == 'true';
    }
  }

  // Handle the "Send" button press
  void _submitForm() {
    final fullName = _fullNameController.text;
    final email = _emailController.text;
    final mobile = _mobileController.text;

    // Check if the fields are filled
    if (fullName.isNotEmpty && email.isNotEmpty && mobile.isNotEmpty) {
      widget.onSubmit({
        'fullName': fullName,
        'email': email,
        'mobile': mobile,
        'displayOnProfile': displayOnProfile.toString(),
      });
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all the fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MyUtility(context).width * 0.3,
        height: MyUtility(context).height * 0.5,
        decoration: ShapeDecoration(
          color: const Color(0xFFD9D9D9), // Light grey background
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Colors.grey, // Optional border color
            ),
            borderRadius: BorderRadius.circular(15), // Rounded corners
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Top header with title and close button
            Container(
              width: MyUtility(context).width,
              height: MyUtility(context).height * 0.06,
              decoration: const ShapeDecoration(
                color: Color(0xFFD17226), // Orange color for header
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
                  const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      'Request New User',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize:
                            14.61, // Matching the previous title font size
                        fontFamily: 'Raleway', // Consistent font family
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context); // Close popup on press
                    },
                  ),
                ],
              ),
            ),

            // Main form content
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PopUpTextField(
                    text: 'Full Name',
                    controller: _fullNameController,
                  ),
                  const SizedBox(height: 20),
                  PopUpTextField(
                    text: 'Email',
                    controller: _emailController,
                  ),
                  const SizedBox(height: 20),
                  PopUpTextField(
                    text: 'Mobile Phone',
                    controller: _mobileController,
                  ),
                  const SizedBox(height: 20),
                  PopupCheckBox(
                    value: displayOnProfile,
                    onChanged: (newValue) {
                      setState(() {
                        displayOnProfile = newValue ?? false;
                      });
                    },
                    text: 'Active User',
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: PopUpsButton(
                          text: 'Send',
                          onTap: _submitForm, // Button action
                        ),
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
