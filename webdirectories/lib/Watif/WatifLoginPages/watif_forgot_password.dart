import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';
import 'package:webdirectories/Watif/WatifLoginPages/watif_components.dart';
import 'package:webdirectories/Watif/WatifLoginPages/watif_login.dart';

class WatifForgotPassword extends StatefulWidget {
  final VoidCallback? onBackToLogin;

  const WatifForgotPassword({
    Key? key,
    this.onBackToLogin,
  }) : super(key: key);

  @override
  State<WatifForgotPassword> createState() => _WatifForgotPasswordState();
}

class _WatifForgotPasswordState extends State<WatifForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  bool _emailSent = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  // Email validation function
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

  void _resetPassword() {
    if (_formKey.currentState!.validate()) {
      // Perform password reset logic here
      setState(() {
        _emailSent = true;
      });
    }
  }

  void _navigateBack() {
    if (widget.onBackToLogin != null) {
      widget.onBackToLogin!();
    } else {
      Navigator.pop(context);
    }
  }

  Widget _buildResetForm() {
    final screenSize = MediaQuery.of(context).size;
    final height = screenSize.height;
    final width = screenSize.width;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Forgot Password?",
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: height * 0.01),
          const Text(
            "Enter your email address and we'll send you a link to reset your password.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          SizedBox(height: height * 0.04),

          // Email field label
          const Padding(
            padding: EdgeInsets.only(left: 4.0, bottom: 8.0),
            child: Text(
              "Email Address*",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          // Email input field
          WatifTextField(
            hintText: "Type here",
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            validator: _validateEmail,
          ),
          SizedBox(height: height * 0.04),

          // Submit button
          Center(
            child: WatifButton(
              label: "Reset Password",
              onPressed: _resetPassword,
              width: width * 0.8,
              backgroundColor: const Color(0xFF1E88E5),
            ),
          ),
          SizedBox(height: height * 0.03),

          // Back to login link
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Remember your password?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                WatifTextButton(
                  label: "Login here",
                  onPressed: _navigateBack,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessMessage() {
    final screenSize = MediaQuery.of(context).size;
    final height = screenSize.height;
    final width = screenSize.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.check_circle_outline,
          color: Colors.white,
          size: 80,
        ),
        SizedBox(height: height * 0.03),
        const Text(
          "Email Sent!",
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: height * 0.02),
        const Text(
          "We've sent a password reset link to:",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: height * 0.01),
        Text(
          _emailController.text,
          style: const TextStyle(
            color: Color(0xFF00B0FF),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: height * 0.04),
        const Text(
          "Please check your email and follow the instructions to reset your password.",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: height * 0.04),

        // Return to login button
        WatifButton(
          label: "Return to Login",
          onPressed: _navigateBack,
          width: width * 0.8,
          backgroundColor: const Color(0xFF1E88E5),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsive design
    final screenSize = MediaQuery.of(context).size;
    final height = screenSize.height;
    final width = screenSize.width;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.08, vertical: height * 0.03),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Top logo
                    Image.asset(
                      "images/watif_login_logo.png",
                      width: width * 0.4,
                      height: width * 0.4,
                    ),
                    SizedBox(height: height * 0.02),

                    // Divider
                    WatifDivider(width: width * 0.8),
                    SizedBox(height: height * 0.03),

                    // Show either the form or success message based on state
                    _emailSent ? _buildSuccessMessage() : _buildResetForm(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
