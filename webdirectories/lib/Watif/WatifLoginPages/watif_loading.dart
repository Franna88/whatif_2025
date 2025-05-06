import 'package:flutter/material.dart';
import 'dart:async';
import 'package:webdirectories/Watif/watif_routes.dart';

class WatifLoading extends StatefulWidget {
  const WatifLoading({Key? key}) : super(key: key);

  @override
  State<WatifLoading> createState() => _WatifLoadingState();
}

class _WatifLoadingState extends State<WatifLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat();

    // Simulate loading process with shorter time
    _timer = Timer(const Duration(seconds: 1), _navigateToHome);
  }

  void _navigateToHome() {
    Navigator.pushReplacementNamed(context, WatifRoutes.home);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsive design
    final screenSize = MediaQuery.of(context).size;
    final height = screenSize.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Container(
              margin: EdgeInsets.only(bottom: height * 0.02),
              child: Image.asset(
                "images/watif_logo_drive_smarter.png",
                height: height * 0.10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
