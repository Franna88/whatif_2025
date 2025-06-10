import 'package:flutter/material.dart';
import 'package:webdirectories/Watif/utils/watif_storage.dart';
import 'package:webdirectories/Watif/watif_home.dart';
import 'package:webdirectories/Watif/watif_landing.dart';
import 'package:webdirectories/Watif/watif_routes.dart';

class WatifStartup extends StatefulWidget {
  const WatifStartup({Key? key}) : super(key: key);

  @override
  State<WatifStartup> createState() => _WatifStartupState();
}

class _WatifStartupState extends State<WatifStartup>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Setup animations
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _controller.forward();

    // Check login state after a brief delay for smooth UX
    _checkLoginStateAndNavigate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _checkLoginStateAndNavigate() async {
    // Show splash screen for at least 2 seconds for better UX
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    try {
      final isLoggedIn = await WatifStorage.isLoggedIn();
      final userData = await WatifStorage.getUserData();

      if (isLoggedIn && userData != null) {
        print('User is logged in: ${userData['email']}');

        // Check if it's a new registration
        if (userData['isNewRegistration'] == true) {
          // Navigate to home with biometric prompt for new users
          Navigator.pushReplacementNamed(
              context, WatifRoutes.homeNewRegistration);
        } else {
          // Navigate directly to home for returning users
          Navigator.pushReplacementNamed(context, WatifRoutes.home);
        }
      } else {
        print('User is not logged in, showing landing page');
        // Navigate to landing page for login/register
        Navigator.pushReplacementNamed(context, WatifRoutes.landing);
      }
    } catch (e) {
      print('Error checking login state: $e');
      // On error, default to landing page
      Navigator.pushReplacementNamed(context, WatifRoutes.landing);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

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
            child: AnimatedBuilder(
              animation: _fadeAnimation,
              builder: (context, child) {
                return Opacity(
                  opacity: _fadeAnimation.value,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Watif logo
                      Image.asset(
                        "images/watif_logo_drive_smarter.png",
                        height: screenSize.height * 0.08,
                      ),
                      SizedBox(height: screenSize.height * 0.04),

                      // Loading indicator
                      const CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                      SizedBox(height: screenSize.height * 0.02),

                      // Loading text
                      const Text(
                        'Loading...',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
