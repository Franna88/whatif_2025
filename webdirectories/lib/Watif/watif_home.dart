import 'package:flutter/material.dart';
import 'package:webdirectories/Watif/watif_navbar.dart';
import 'package:webdirectories/Watif/watif_voice_search.dart';
import 'package:webdirectories/Watif/watif_routes.dart';
import 'package:webdirectories/Watif/watif_profile.dart';
import 'package:webdirectories/Watif/components/fuel_directory_dial.dart';
import 'package:webdirectories/Watif/WatifRegisterPages/watif_biometric_popup.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:ui' as ui;

class WatifHome extends StatefulWidget {
  final bool showBiometricPrompt;
  final bool isNewRegistration;

  const WatifHome({
    Key? key,
    this.showBiometricPrompt = false,
    this.isNewRegistration = false,
  }) : super(key: key);

  @override
  State<WatifHome> createState() => _WatifHomeState();
}

class _WatifHomeState extends State<WatifHome> with TickerProviderStateMixin {
  late AnimationController _blinkController;
  late Animation<Color?> _blinkAnimation;
  int _selectedIndex = 0;
  int _selectedButton = 0; // Track which button is selected

  @override
  void initState() {
    super.initState();

    // Blink animation for emergency text
    _blinkController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _blinkAnimation = ColorTween(
      begin: Colors.white,
      end: Colors.white.withOpacity(0.6),
    ).animate(_blinkController);

    // Check if we should show the biometric prompt
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Only show the biometric prompt if:
      // 1. It's explicitly requested via showBiometricPrompt AND
      // 2. Either this is a new registration OR the user hasn't seen the prompt before
      if (widget.showBiometricPrompt &&
          (widget.isNewRegistration ||
              !BiometricPreference.getHasSeenPrompt())) {
        // Show biometric popup with a short delay to ensure the UI is fully rendered
        Future.delayed(const Duration(milliseconds: 100), () {
          if (mounted) {
            showBiometricLoginPopup(context);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _blinkController.dispose();
    super.dispose();
  }

  void _changeSection(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Add method to handle button selection
  void _selectButton(int index) {
    setState(() {
      _selectedButton = index;
    });

    // Handle button actions
    if (index == 0) {
      // Navigate to directory page
      Navigator.pushNamed(context, WatifRoutes.fuelDirectory);
    } else if (index == 1) {
      // Show voice search popup
      _showVoiceSearchPopup();
    } else if (index == 2) {
      // Navigate to profile page directly
      print("Navigating to profile page");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const WatifProfile(),
        ),
      );
    }
  }

  // Show the voice search popup dialog
  void _showVoiceSearchPopup() {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) => const WatifVoiceSearch(),
    );
  }

  // Handle navigation to different directory sections
  void _handleDirectoryIconTap(int index) {
    print('Tapped icon at index: $index');

    // Handle navigation based on selected directory icon
    switch (index) {
      case 0: // Profile
        Navigator.pushNamed(context, WatifRoutes.profile);
        break;
      case 1: // Fuel
        Navigator.pushNamed(context, WatifRoutes.fuelDirectory);
        break;
      case 2: // Panel
        // Add implementation when available
        print("Panel directory navigation not implemented yet");
        break;
      case 3: // Towing
        // Add implementation when available
        print("Towing directory navigation not implemented yet");
        break;
      case 4: // Repair
        // Add implementation when available
        print("Repair directory navigation not implemented yet");
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double horizontalPadding = screenSize.width * 0.08;
    final double verticalPadding = screenSize.height * 0.02;

    // Calculate font sizes based on screen size
    final double titleFontSize = screenSize.width * 0.07;
    final double subtitleFontSize = screenSize.width * 0.035;
    final double buttonFontSize = screenSize.width * 0.05;
    final double emergencyFontSize = screenSize.width * 0.035;

    // Set the route name for navigation
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (ModalRoute.of(context)?.settings.name == null) {
        Navigator.of(context).pushReplacementNamed(WatifRoutes.home);
      }
    });

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leadingWidth: 0,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'images/watif_logo.png',
                height: screenSize.height * 0.04,
                fit: BoxFit.contain,
                alignment: Alignment.centerLeft,
              ),
              Text(
                'Drive Smarter',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: subtitleFontSize,
                ),
              ),
            ],
          ),
        ),
        titleSpacing: 16,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
                size: screenSize.width * 0.08,
              ),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
      ),
      drawer: null,
      endDrawer: const WatifNavbar(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF01070B),
              Color.fromARGB(255, 1, 37, 61),
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Replace the placeholder with the new FuelDirectoryDial widget
                    FuelDirectoryDial(
                      size: screenSize.width * 0.8,
                      onIconTap: (index) {
                        // Handle icon tap based on index
                        _handleDirectoryIconTap(index);
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Buttons
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: verticalPadding),
              child: Column(
                children: [
                  _buildButton(
                    'Navigate to Directory',
                    _selectedButton == 0
                        ? const Color(0xFF011F33)
                        : Colors.black,
                    Colors.white,
                    buttonFontSize,
                    screenSize,
                    onTap: () => _selectButton(0),
                    isSelected: _selectedButton == 0,
                  ),
                  SizedBox(height: screenSize.height * 0.015),
                  _buildButton(
                    'Voice Search',
                    _selectedButton == 1
                        ? const Color(0xFF011F33)
                        : Colors.black,
                    Colors.white,
                    buttonFontSize,
                    screenSize,
                    onTap: () => _selectButton(1),
                    isSelected: _selectedButton == 1,
                  ),
                  SizedBox(height: screenSize.height * 0.015),
                  _buildButton(
                    'My Profile',
                    _selectedButton == 2
                        ? const Color(0xFF011F33)
                        : Colors.black,
                    Colors.white,
                    buttonFontSize,
                    screenSize,
                    onTap: () => _selectButton(2),
                    isSelected: _selectedButton == 2,
                  ),
                  SizedBox(
                      height: screenSize.height *
                          0.08), // Increased bottom padding to make room for overlapping button
                ],
              ),
            ),

            // Stack to position the emergency button overlapping the sections
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                // Emergency section
                Container(
                  width: double.infinity,
                  color: const Color(0xFF486574),
                  padding: EdgeInsets.only(
                    top: screenSize.height *
                        0.05, // Add extra top padding for the button
                    bottom: screenSize.height * 0.025,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: screenSize.height * 0.01),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                'PRESS ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: emergencyFontSize,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.0,
                                ),
                              ),
                              Text(
                                '3 SECONDS',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: emergencyFontSize * 1.2,
                                  letterSpacing: 1.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 2),
                          Text(
                            'IN CASE OF EMERGENCY',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: emergencyFontSize * 0.9,
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Emergency button positioned to overlap
                Positioned(
                  top: -screenSize.width *
                      0.075, // Half the height of the button to position it overlapping
                  child: Container(
                    width: screenSize.width * 0.15,
                    height: screenSize.width * 0.15,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFA02727),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Container(
                        width: screenSize.width * 0.1,
                        height: screenSize.width * 0.1,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 0,
                              blurRadius: 2,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Center(
                          child: CustomPaint(
                            size: Size(screenSize.width * 0.05,
                                screenSize.width * 0.05),
                            painter: CrossPainter(
                                lineWidth: screenSize.width * 0.02),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text, Color color, Color textColor,
      double fontSize, Size screenSize,
      {Function()? onTap, bool isSelected = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: screenSize.height * 0.045,
        decoration: BoxDecoration(
          border: Border.all(color: textColor, width: 1),
          borderRadius: BorderRadius.circular(30),
          color: color,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class CrossPainter extends CustomPainter {
  final double lineWidth;

  CrossPainter({required this.lineWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFA02727)
      ..strokeWidth = lineWidth
      ..strokeCap = StrokeCap.round;

    // Horizontal line
    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      paint,
    );

    // Vertical line
    canvas.drawLine(
      Offset(size.width / 2, 0),
      Offset(size.width / 2, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldPainter) => false;
}
