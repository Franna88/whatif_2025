import 'package:flutter/material.dart';
import 'package:webdirectories/Watif/watif_navbar.dart';
import 'package:webdirectories/Watif/watif_routes.dart';

class WatifPersonalInfo extends StatefulWidget {
  const WatifPersonalInfo({Key? key}) : super(key: key);

  @override
  State<WatifPersonalInfo> createState() => _WatifPersonalInfoState();
}

class _WatifPersonalInfoState extends State<WatifPersonalInfo> {
  // Controllers for text fields
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _idNumberController =
      TextEditingController(text: '9908060176083');
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emergencyNameController =
      TextEditingController();
  final TextEditingController _emergencyRelationshipController =
      TextEditingController();
  final TextEditingController _emergencyMobileController =
      TextEditingController();
  final TextEditingController _emergencyWhatsappController =
      TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _idNumberController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _addressController.dispose();
    _emergencyNameController.dispose();
    _emergencyRelationshipController.dispose();
    _emergencyMobileController.dispose();
    _emergencyWhatsappController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double horizontalPadding = screenSize.width * 0.05;
    final double verticalPadding = screenSize.height * 0.015;
    final double titleFontSize = screenSize.width * 0.06;
    final double subtitleFontSize = screenSize.width * 0.035;
    final double sectionTitleFontSize = screenSize.width * 0.045;
    final double labelFontSize = screenSize.width * 0.04;

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: screenSize.width * 0.06,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
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
                SizedBox(height: screenSize.height * 0.01),
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
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "My Personal Information",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: titleFontSize,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Easily manage and update your personal information to ensure your profile stays accurate",
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: subtitleFontSize,
                              ),
                            ),
                            SizedBox(height: screenSize.height * 0.02),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: screenSize.width * 0.15,
                                  height: screenSize.width * 0.15,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white.withOpacity(0.1),
                                    border: Border.all(
                                        color: Colors.white.withOpacity(0.3)),
                                  ),
                                  child: Icon(
                                    Icons.person_outline,
                                    color: Colors.white,
                                    size: screenSize.width * 0.08,
                                  ),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Full Name & Surname",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: labelFontSize,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      _buildTextField(_fullNameController,
                                          "Please enter", screenSize),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: verticalPadding * 1.5),

                            // ID Number with upload button
                            Text(
                              "ID Number",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: labelFontSize,
                              ),
                            ),
                            SizedBox(height: 4),

                            Row(
                              children: [
                                Expanded(
                                  child: _buildTextField(
                                      _idNumberController, "", screenSize),
                                ),
                                SizedBox(width: 8),
                                Container(
                                  height: screenSize.height * 0.045,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 1, 37, 61),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    child: Center(
                                      child: Text(
                                        "Upload",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: subtitleFontSize,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            // Filename display
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  "MJCronje01704202.jpg",
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.7),
                                    fontSize: subtitleFontSize * 0.8,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: verticalPadding * 1.5),

                            // Email Address
                            Text(
                              "Email Address",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: labelFontSize,
                              ),
                            ),
                            SizedBox(height: 4),
                            _buildTextField(
                                _emailController, "Please enter", screenSize),

                            SizedBox(height: verticalPadding * 1.5),

                            // Mobile Number
                            Text(
                              "Mobile Number",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: labelFontSize,
                              ),
                            ),
                            SizedBox(height: 4),
                            _buildTextField(
                                _mobileController, "Please enter", screenSize),

                            SizedBox(height: verticalPadding * 1.5),

                            // Home Address
                            Text(
                              "Home Address",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: labelFontSize,
                              ),
                            ),
                            SizedBox(height: 4),
                            _buildTextField(
                                _addressController, "Please enter", screenSize,
                                multiline: true,
                                height: screenSize.height * 0.12),

                            SizedBox(height: verticalPadding * 2),

                            // Emergency Contact section
                            Text(
                              "Emergency Contact (ICE)",
                              style: TextStyle(
                                color: Colors.blue.shade300,
                                fontSize: sectionTitleFontSize,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: verticalPadding * 1.5),

                            // Emergency Contact Name
                            Text(
                              "Name",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: labelFontSize,
                              ),
                            ),
                            SizedBox(height: 4),
                            _buildTextField(_emergencyNameController,
                                "Please enter", screenSize),

                            SizedBox(height: verticalPadding * 1.5),

                            // Emergency Contact Relationship
                            Text(
                              "Relationship",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: labelFontSize,
                              ),
                            ),
                            SizedBox(height: 4),
                            _buildTextField(_emergencyRelationshipController,
                                "Please enter", screenSize),

                            SizedBox(height: verticalPadding * 1.5),

                            // Emergency Contact Mobile
                            Text(
                              "Mobile Number",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: labelFontSize,
                              ),
                            ),
                            SizedBox(height: 4),
                            _buildTextField(_emergencyMobileController,
                                "Please enter", screenSize),

                            SizedBox(height: verticalPadding * 1.5),

                            // Emergency Contact WhatsApp
                            Text(
                              "WhatsApp Number",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: labelFontSize,
                              ),
                            ),
                            SizedBox(height: 4),
                            _buildTextField(_emergencyWhatsappController,
                                "Please enter", screenSize),

                            SizedBox(height: verticalPadding * 2),

                            // Save button
                            Center(
                              child: Container(
                                width: screenSize.width * 0.3,
                                height: screenSize.height * 0.05,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF5B9B3D),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: Text(
                                    "Save",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: labelFontSize,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: verticalPadding),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.01),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String placeholder,
    Size screenSize, {
    bool multiline = false,
    double? height,
  }) {
    return Container(
      height: height ?? screenSize.height * 0.045,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.black),
        maxLines: multiline ? null : 1,
        expands: multiline,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          hintText: placeholder,
          hintStyle: TextStyle(color: Colors.grey),
          contentPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
