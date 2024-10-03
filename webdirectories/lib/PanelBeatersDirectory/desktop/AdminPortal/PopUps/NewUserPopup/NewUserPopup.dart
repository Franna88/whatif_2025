import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpTextField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpsButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopupCheckBox.dart';
import 'package:webdirectories/myutility.dart';

class NewUserPopup extends StatefulWidget {
  final Function(Map<String, String>) onSubmit; // Callback function

  const NewUserPopup({super.key, required this.onSubmit});

  @override
  State<NewUserPopup> createState() => _NewUserPopupState();
}

class _NewUserPopupState extends State<NewUserPopup> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  bool displayOnProfile = false; // Checkbox value

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
      Navigator.pop(context); // Close the popup
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
          color: Color(0xFFD9D9D9), // Light grey background
          shape: RoundedRectangleBorder(
            side: BorderSide(
              strokeAlign: BorderSide.strokeAlignOutside,
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
              decoration: ShapeDecoration(
                color: Color(0xFFD17226), // Orange color for header
                shape: const RoundedRectangleBorder(
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
                      'Request New User',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize:
                            14.61, // Matching the previous title font size
                        fontFamily: 'Raleway', // Consistent font family
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  CloseButton(
                    style: ButtonStyle(
                      foregroundColor: WidgetStateProperty.all(
                          Colors.white), // Updated to WidgetStateProperty
                    ),
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
                    text: 'Display on Profile',
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
