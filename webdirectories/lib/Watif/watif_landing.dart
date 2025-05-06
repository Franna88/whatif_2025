import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';
import 'package:webdirectories/Watif/WatifRegisterPages/watif_register_email.dart';
import 'package:webdirectories/Watif/WatifLoginPages/watif_login.dart';
import 'package:webdirectories/Watif/watif_routes.dart';

class WatifLanding extends StatelessWidget {
  const WatifLanding({Key? key}) : super(key: key);

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
                    SizedBox(height: height * 0.06),

                    // Horizontal divider
                    Container(
                      height: 1,
                      width: width * 0.8,
                      color: Colors.white.withOpacity(0.5),
                    ),
                    SizedBox(height: height * 0.03),

                    // Welcome section with logo
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "images/watif_logo_drive_smarter.png",
                          height: height * 0.07,
                        ),
                        SizedBox(width: width * 0.03),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Welcome to the",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Text(
                                "Watif App,",
                                style: TextStyle(
                                  color: Color(0xFF00B0FF),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                "brought to you by",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Text(
                                "Web Directories.",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.03),

                    // Horizontal divider
                    Container(
                      height: 1,
                      width: width * 0.8,
                      color: Colors.white.withOpacity(0.5),
                    ),
                    SizedBox(height: height * 0.05),

                    // Information text
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
                    const Text(
                      "If you are already a Watif App user,\nplease click Login below.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: height * 0.05),

                    // Register button
                    _buildButton(
                      context: context,
                      label: "Register",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WatifRegisterEmail(),
                          ),
                        );
                      },
                      width: width * 0.8,
                      backgroundColor: const Color(0xFF033452),
                    ),
                    SizedBox(height: height * 0.02),

                    // Login button
                    _buildButton(
                      context: context,
                      label: "Login",
                      onPressed: () {
                        Navigator.pushNamed(context, WatifRoutes.login);
                      },
                      width: width * 0.8,
                      backgroundColor: Colors.white,
                      textColor: Colors.black87,
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

  // Reusable button widget
  Widget _buildButton({
    required BuildContext context,
    required String label,
    required VoidCallback onPressed,
    required double width,
    Color backgroundColor = const Color(0xFF1E88E5),
    Color textColor = Colors.white,
  }) {
    return SizedBox(
      width: width,
      height: MyUtility(context).height * 0.045,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
