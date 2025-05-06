import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';
import 'package:webdirectories/Watif/WatifRegisterPages/watif_register_password.dart';

class WatifRegisterEmail extends StatefulWidget {
  const WatifRegisterEmail({Key? key}) : super(key: key);

  @override
  State<WatifRegisterEmail> createState() => _WatifRegisterEmailState();
}

class _WatifRegisterEmailState extends State<WatifRegisterEmail> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _sendVerificationCode() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Simulate sending verification code
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _isLoading = false;
        });

        // Navigate to verification code screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WatifRegisterVerification(
              email: _emailController.text,
            ),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MyUtility(context).height;
    final width = MyUtility(context).width;

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
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Top logo
                      Image.asset(
                        "images/watif_login_logo.png",
                        width: width * 0.4,
                        height: width * 0.4,
                      ),
                      SizedBox(height: height * 0.03),

                      // Horizontal divider
                      Container(
                        height: 1,
                        width: width * 0.8,
                        color: Colors.white.withOpacity(0.5),
                      ),
                      SizedBox(height: height * 0.05),

                      // Title
                      const Text(
                        "First time using our app?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        "Please register first",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: height * 0.02),

                      // Instructions
                      const Text(
                        "Please enter your detail below",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: height * 0.04),

                      // Email field
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Email Address*",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: height * 0.01),
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Please enter",
                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 16.0,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email address';
                              }
                              if (!RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$")
                                  .hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.06),

                      // Horizontal divider
                      Container(
                        height: 1,
                        width: width * 0.8,
                        color: Colors.white.withOpacity(0.5),
                      ),
                      SizedBox(height: height * 0.05),

                      // Send Verification Code button
                      SizedBox(
                        width: double.infinity,
                        height: height * 0.045,
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _sendVerificationCode,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF033452),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                            disabledBackgroundColor: Colors.grey,
                          ),
                          child: _isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2.0,
                                )
                              : const Text(
                                  "Send Verification Code",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Verification code screen
class WatifRegisterVerification extends StatefulWidget {
  final String email;

  const WatifRegisterVerification({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  State<WatifRegisterVerification> createState() =>
      _WatifRegisterVerificationState();
}

class _WatifRegisterVerificationState extends State<WatifRegisterVerification> {
  final TextEditingController _codeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _isResending = false;

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  void _verifyCode() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Simulate verification process
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _isLoading = false;
        });

        // Navigate to create password screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WatifRegisterPassword(
              email: widget.email,
            ),
          ),
        );
      });
    }
  }

  void _resendCode() {
    setState(() {
      _isResending = true;
    });

    // Simulate resending code
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isResending = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Verification code has been resent'),
          duration: Duration(seconds: 3),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MyUtility(context).height;
    final width = MyUtility(context).width;

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
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Top logo
                      Image.asset(
                        "images/watif_login_logo.png",
                        width: width * 0.4,
                        height: width * 0.4,
                      ),
                      SizedBox(height: height * 0.03),

                      // Horizontal divider
                      Container(
                        height: 1,
                        width: width * 0.8,
                        color: Colors.white.withOpacity(0.5),
                      ),
                      SizedBox(height: height * 0.05),

                      // Title
                      const Text(
                        "Verify your identity",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: height * 0.02),

                      // Instructions
                      const Text(
                        "Please check your email and enter\nthe verification code that was sent to you",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: height * 0.04),

                      // Email field (readonly)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Email Address*",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: height * 0.01),
                          TextFormField(
                            initialValue: widget.email,
                            readOnly: true,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 16.0,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.03),

                      // Verification code field
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Verification Code*",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: height * 0.01),
                          TextFormField(
                            controller: _codeController,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Type here",
                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 16.0,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter verification code';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.06),

                      // Verify code button
                      SizedBox(
                        width: double.infinity,
                        height: height * 0.045,
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _verifyCode,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF033452),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                            disabledBackgroundColor: Colors.grey,
                          ),
                          child: _isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2.0,
                                )
                              : const Text(
                                  "Verify Code",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        ),
                      ),
                      SizedBox(height: height * 0.02),

                      // Resend code link
                      TextButton(
                        onPressed: _isResending ? null : _resendCode,
                        child: Text(
                          "Resend code",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                          ),
                        ),
                      ),

                      SizedBox(height: height * 0.02),

                      // Information message
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.info_outline,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(width: width * 0.02),
                          Flexible(
                            child: const Text(
                              "Please note that receiving your verification code may take a few minutes.",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
