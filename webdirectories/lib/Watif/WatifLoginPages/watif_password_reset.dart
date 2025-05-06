import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';
import 'package:webdirectories/Watif/WatifLoginPages/watif_components.dart';
import 'package:webdirectories/Watif/WatifLoginPages/watif_password_reset_success.dart';
import 'package:webdirectories/Watif/WatifLoginPages/watif_password_reset_error.dart';

class WatifPasswordReset extends StatefulWidget {
  const WatifPasswordReset({Key? key}) : super(key: key);

  @override
  State<WatifPasswordReset> createState() => _WatifPasswordResetState();
}

class _WatifPasswordResetState extends State<WatifPasswordReset> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  // Simulated emails for demonstration
  final List<String> _registeredEmails = [
    'thys@webdirectories.co.za',
    'test@example.com'
  ];

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  // Email validation
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  void _sendResetLink() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Simulate network delay
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _isLoading = false;
        });

        final email = _emailController.text.trim();

        // Check if email exists in our system
        if (_registeredEmails.contains(email)) {
          // Show success popup
          Navigator.of(context).pop(); // Close the current dialog first
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return WatifPasswordResetSuccess(email: email);
            },
          );
        } else {
          // Show error popup
          Navigator.of(context).pop(); // Close the current dialog first
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return WatifPasswordResetError(email: email);
            },
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MyUtility(context).width;
    final double height = MyUtility(context).height;

    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        width: width * 0.85,
        padding: EdgeInsets.symmetric(
          vertical: height * 0.03,
          horizontal: width * 0.06,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button at top left
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: width * 0.05,
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),

              // Title
              Center(
                child: Text(
                  'Password Reset',
                  style: TextStyle(
                    fontSize: width * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),

              // Description
              Center(
                child: Text(
                  'Need to reset your password? No problem! Please enter the email you used to sign up for our service',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: width * 0.04,
                    color: Colors.black87,
                  ),
                ),
              ),
              SizedBox(height: height * 0.03),

              // Email field label
              Row(
                children: [
                  Text(
                    'Email Address',
                    style: TextStyle(
                      fontSize: width * 0.045,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '*',
                    style: TextStyle(
                      fontSize: width * 0.045,
                      fontWeight: FontWeight.w600,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.01),

              // Email input field
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: _validateEmail,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Type here',
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 16.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
              ),
              SizedBox(height: height * 0.03),

              // Send Reset Link button
              SizedBox(
                width: double.infinity,
                height: height * 0.06,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _sendResetLink,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF033452),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    disabledBackgroundColor: Colors.grey,
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2.0,
                          ),
                        )
                      : Text(
                          'Send Reset Link',
                          style: TextStyle(
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Helper method to show the password reset dialog
void showPasswordResetDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return const WatifPasswordReset();
    },
  );
}
