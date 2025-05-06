import 'package:flutter/material.dart';
import 'package:webdirectories/Watif/watif_navbar.dart';
import 'package:webdirectories/Watif/watif_routes.dart';
import 'package:webdirectories/Watif/watif_home.dart';
import 'package:webdirectories/Watif/watif_personal_info.dart';
import 'package:webdirectories/Watif/watif_vehicle_info.dart';
import 'package:webdirectories/Watif/watif_documents.dart';

class WatifProfile extends StatefulWidget {
  const WatifProfile({Key? key}) : super(key: key);

  @override
  State<WatifProfile> createState() => _WatifProfileState();
}

class _WatifProfileState extends State<WatifProfile> {
  int _selectedButtonIndex = -1; // Track the selected button

  @override
  void initState() {
    super.initState();
    // Print debug information when the page is created
    print("WatifProfile page initialized");
  }

  void _selectButton(int index) {
    print("_selectButton called with index: $index");
    setState(() {
      _selectedButtonIndex = index;
    });

    // Handle navigation for specific buttons
    if (index == 0) {
      print("Personal Information button selected, preparing to navigate");
      // The navigation to personal info happens in the button's onTap
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double horizontalPadding = screenSize.width * 0.05;
    final double verticalPadding = screenSize.height * 0.02;
    final double titleFontSize = screenSize.width * 0.06;
    final double subtitleFontSize = screenSize.width * 0.035;
    final double buttonFontSize = screenSize.width * 0.05;

    // Set the route name for navigation
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (ModalRoute.of(context)?.settings.name == null) {
        print("Setting route name to ${WatifRoutes.profile}");
        Navigator.of(context).pushReplacementNamed(WatifRoutes.profile);
      }
    });

    print("Building WatifProfile page");

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
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenSize.height * 0.02),
                // Main container with white border
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.white, width: 0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: screenSize.height * 0.025,
                        horizontal: screenSize.width * 0.04,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Update my Profile",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Please ensure all information are complete\nand up-to-date",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: subtitleFontSize,
                            ),
                          ),
                          SizedBox(height: screenSize.height * 0.03),
                          Expanded(
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                children: [
                                  _buildProfileButton(
                                    "Personal Information",
                                    buttonFontSize,
                                    screenSize,
                                    index: 0,
                                    isSelected: _selectedButtonIndex == 0,
                                    onTap: () {
                                      _selectButton(0);
                                      print("Navigating to Personal Info page");
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const WatifPersonalInfo(),
                                        ),
                                      );
                                    },
                                  ),
                                  SizedBox(height: screenSize.height * 0.015),
                                  _buildProfileButton(
                                    "Vehicle Information",
                                    buttonFontSize,
                                    screenSize,
                                    index: 1,
                                    isSelected: _selectedButtonIndex == 1,
                                    onTap: () {
                                      _selectButton(1);
                                      print("Navigating to Vehicle Info page");
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const WatifVehicleInfo(),
                                        ),
                                      );
                                    },
                                  ),
                                  SizedBox(height: screenSize.height * 0.015),
                                  _buildProfileButton(
                                    "Documents & Records",
                                    buttonFontSize,
                                    screenSize,
                                    index: 2,
                                    isSelected: _selectedButtonIndex == 2,
                                    onTap: () {
                                      _selectButton(2);
                                      print(
                                          "Navigating to Documents & Records page");
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const WatifDocuments(),
                                        ),
                                      );
                                    },
                                  ),
                                  SizedBox(height: screenSize.height * 0.015),
                                  _buildProfileButton(
                                    "Repair & Maintenance Log",
                                    buttonFontSize,
                                    screenSize,
                                    index: 3,
                                    isSelected: _selectedButtonIndex == 3,
                                    onTap: () => _selectButton(3),
                                  ),
                                  SizedBox(height: screenSize.height * 0.015),
                                  _buildProfileButton(
                                    "Fuel Usage & Logs",
                                    buttonFontSize,
                                    screenSize,
                                    index: 4,
                                    isSelected: _selectedButtonIndex == 4,
                                    onTap: () => _selectButton(4),
                                  ),
                                  SizedBox(height: screenSize.height * 0.015),
                                  _buildProfileButton(
                                    "Emergency & Safety Info",
                                    buttonFontSize,
                                    screenSize,
                                    index: 5,
                                    isSelected: _selectedButtonIndex == 5,
                                    onTap: () => _selectButton(5),
                                  ),
                                  SizedBox(height: screenSize.height * 0.015),
                                  _buildProfileButton(
                                    "Reminders & Schedules",
                                    buttonFontSize,
                                    screenSize,
                                    index: 6,
                                    isSelected: _selectedButtonIndex == 6,
                                    onTap: () => _selectButton(6),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileButton(String text, double fontSize, Size screenSize,
      {required int index,
      required bool isSelected,
      required Function() onTap}) {
    return GestureDetector(
      onTap: () {
        print("Button tapped: $text");
        onTap();
      },
      child: Container(
        width: double.infinity,
        height: screenSize.height * 0.045,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(30),
          color:
              isSelected ? const Color.fromARGB(255, 1, 37, 61) : Colors.black,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
