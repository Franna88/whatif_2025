import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';
import 'package:webdirectories/Watif/watif_routes.dart';
import 'package:webdirectories/Watif/WatifRegisterPages/watif_biometric_popup.dart';

class WatifRegisterWelcome extends StatefulWidget {
  final String displayName;

  const WatifRegisterWelcome({
    Key? key,
    required this.displayName,
  }) : super(key: key);

  @override
  State<WatifRegisterWelcome> createState() => _WatifRegisterWelcomeState();
}

class _WatifRegisterWelcomeState extends State<WatifRegisterWelcome>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeInAnimation;

  @override
  void initState() {
    super.initState();

    // Setup animations
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _controller.forward();

    // Auto-navigate to home after a delay
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        // Navigate to home page with biometric prompt and new registration flag
        Navigator.pushNamedAndRemoveUntil(
          context,
          WatifRoutes.homeNewRegistration, // Use the new route
          (route) => false, // Clear all previous routes
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Opacity(
                  opacity: _fadeInAnimation.value,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Watif logo
                      Image.asset(
                        "images/watif_logo_drive_smarter.png",
                        height: height * 0.06,
                      ),
                      SizedBox(height: height * 0.08),

                      // Welcome text
                      Text(
                        'Welcome, ${widget.displayName}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: height * 0.04),

                      // Optional subtext
                      const Text(
                        'Your account is ready',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: height * 0.08),

                      // Loading indicator
                      SizedBox(
                        width: width * 0.15,
                        height: width * 0.15,
                        child: const CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Color(0xFF033452)),
                          backgroundColor: Colors.white24,
                          strokeWidth: 3,
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
