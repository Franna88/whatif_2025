import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminPortal.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/longOrangeButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/mediumTextBox.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/passwordTextField.dart';

class OwnersPortalLoginForm extends StatefulWidget {
  const OwnersPortalLoginForm({super.key});

  @override
  State<OwnersPortalLoginForm> createState() => _OwnersPortalLoginFormState();
}

class _OwnersPortalLoginFormState extends State<OwnersPortalLoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = false;
  Future<void> _login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        setState(() {
          _isLoading = true;
        });

        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        print("User signed in: ${userCredential.user?.email}");

        if (!mounted) return; // Ensure the widget is still mounted
        setState(() {
          _isLoading = false;
        });
        // Navigate to the next screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  AdminPortal()), // Replace with your destination screen
        );
      } on FirebaseAuthException catch (e) {
        print('Incorrect credentials. Please try again.');
      } catch (e) {
        print(e);
      }
    }
  }

  Future<void> _forgotPassword(BuildContext context) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    String email = _emailController.text.trim();

    if (!mounted) return;

    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter your email")),
      );
      return;
    }

    try {
      await _auth.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                "Password reset email sent. If you used a valid email address, you will receive an email shortly.")),
      );
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Error: Unable to send password reset email")),
      );
    }
  }

  String? customEmailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? customPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          MediumTextBox(
            keyText: 'Email',
            hintText: 'e.g.,admin@actionpanel.co.za',
            controller: _emailController,
            validator: (value) => customEmailValidator(value),
          ),
          PasswordField(
            hintText: 'Enter Password',
            keyText: 'Password',
            controller: _passwordController,
            validator: (value) => customPasswordValidator(value),
            widthContainer:
                widthDevice < 1500 ? widthDevice * 0.30 : widthDevice * 0.24,
          ),
          TextButton(
            onPressed: () => _forgotPassword(context),
            child: SizedBox(
              //width: 450,
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: widthDevice * 0.03),
                  child: Text(
                    'Forgot Password?',
                    textAlign: TextAlign.right,
                    style: widthDevice < 1500
                        ? const TextStyle(
                            color: Color(0xFFEF9040),
                            fontSize: 14,
                            fontFamily: 'ralewaymedium',
                          )
                        : const TextStyle(
                            color: Color(0xFFEF9040),
                            fontSize: 16,
                            fontFamily: 'ralewaymedium',
                          ),
                  ),
                ),
              ),
            ),
          ),
          LongOrangeButton(
              onPressed: () => _login(context),
              buttonText: _isLoading
                  ? const SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.0,
                        color: Colors.white,
                      ),
                    )
                  : 'Login'),
          SizedBox(
            height: heightDevice < 710 ? 15 : 30,
          ),
        ],
      ),
    );
  }
}
