import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';
import 'package:webdirectories/Watif/WatifLoginPages/watif_components.dart';
import 'package:webdirectories/Watif/WatifLoginPages/watif_password_reset.dart';
import 'package:webdirectories/Watif/WatifLoginPages/watif_loading.dart';
import 'package:webdirectories/Watif/WatifRegisterPages/watif_register_email.dart';
import 'package:webdirectories/Watif/watif_home.dart';
import 'package:webdirectories/Watif/watif_routes.dart';
import 'package:webdirectories/Watif/utils/watif_storage.dart';

class WatifLogin extends StatefulWidget {
  final VoidCallback? onForgotPassword;
  final VoidCallback? onRegister;

  const WatifLogin({
    Key? key,
    this.onForgotPassword,
    this.onRegister,
  }) : super(key: key);

  @override
  State<WatifLogin> createState() => _WatifLoginState();
}

class _WatifLoginState extends State<WatifLogin> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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

  // Password validation function
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  void _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Simulate a network delay for login authentication
      Future.delayed(const Duration(seconds: 1), () async {
        // Save login state with user email
        await WatifStorage.saveLoginState(
          email: _emailController.text.trim(),
          displayName: _emailController.text
              .trim()
              .split('@')[0], // Use email prefix as display name
        );

        print('Login successful for: ${_emailController.text}');

        // Navigate to loading page using named route
        Navigator.pushReplacementNamed(context, WatifRoutes.loading);
      });
    }
  }

  void _onForgotPasswordPressed() {
    // Use the callback if provided, otherwise show our dialog
    if (widget.onForgotPassword != null) {
      widget.onForgotPassword!();
    } else {
      showPasswordResetDialog(context);
    }
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
                    SizedBox(height: height * 0.02),

                    // Login text
                    const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: height * 0.01),

                    // Login instruction text
                    const Text(
                      "Please login to use your Watif App",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: height * 0.03),

                    // Registration link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Not registered yet? Click",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        WatifTextButton(
                          label: "here",
                          onPressed: () {
                            if (widget.onRegister != null) {
                              widget.onRegister!();
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const WatifRegisterEmail(),
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.04),

                    // Login form
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                          SizedBox(height: height * 0.02),

                          // Password field label
                          const Padding(
                            padding: EdgeInsets.only(left: 4.0, bottom: 8.0),
                            child: Text(
                              "Password*",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          // Password input field
                          WatifTextField(
                            hintText: "Type here",
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            validator: _validatePassword,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                          ),

                          // Forgot password link
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              WatifTextButton(
                                label: "Forgot Password ?",
                                onPressed: _onForgotPasswordPressed,
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.04),

                          // Login button
                          Center(
                            child: _isLoading
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : WatifButton(
                                    label: "Login",
                                    onPressed: _login,
                                    width: width * 0.8,
                                    backgroundColor: const Color(0xFF033452),
                                  ),
                          ),
                        ],
                      ),
                    ),
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
