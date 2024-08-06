import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminPortal.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/longOrangeButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/mediumTextBox.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/passwordTextField.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';

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
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool _isLoading = false;

  final storage = FlutterSecureStorage();

  Future<void> storeUserInfo(StoredUser user) async {
    await storage.write(
        key: 'user',
        value: jsonEncode(
            {'id': user.id, 'title': user.title, 'email': user.email}));
  }

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

        User? user = userCredential.user;

        if (user != null) {
          print("User signed in: ${user.email} ${user.uid}");

          // Fetch user details from Firestore
          QuerySnapshot<Map<String, dynamic>> userDoc = await _firestore
              .collection('listings')
              .where('auth_id', isEqualTo: user.uid.toString())
              .get();
          if (userDoc.docs.isNotEmpty) {
            Map<String, dynamic> userData = userDoc.docs.first.data();
            // Store user information locally
            await storeUserInfo(StoredUser(
                id: userData['listingsId'].toString(),
                title: userData['title'],
                email: user.email!));

            if (!mounted) return; // Ensure the widget is still mounted

            setState(() {
              _isLoading = false;
            });
            // Navigate to the next screen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    AdminPortal(), // Replace with your destination screen
              ),
            );
          } else {
            setState(() {
              _isLoading = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('User data not found.')),
            );
          }
        } else {
          setState(() {
            _isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('User data not found.')),
          );
        }
      } on FirebaseAuthException catch (e) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Incorrect credentials. Please try again.')),
        );
      } catch (e) {
        setState(() {
          _isLoading = false;
        });
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
