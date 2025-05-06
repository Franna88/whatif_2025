import 'package:flutter/material.dart';
import 'package:webdirectories/Watif/watif_navbar.dart';
import 'package:webdirectories/Watif/watif_routes.dart';

class WatifDocuments extends StatefulWidget {
  const WatifDocuments({Key? key}) : super(key: key);

  @override
  State<WatifDocuments> createState() => _WatifDocumentsState();
}

class _WatifDocumentsState extends State<WatifDocuments> {
  @override
  void initState() {
    super.initState();
    print("WatifDocuments page initialized");
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double horizontalPadding = screenSize.width * 0.05;
    final double titleFontSize = screenSize.width * 0.06;
    final double subtitleFontSize = screenSize.width * 0.035;
    final double buttonFontSize = screenSize.width * 0.04;

    // Set the route name for navigation
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (ModalRoute.of(context)?.settings.name == null) {
        print("Setting route name to ${WatifRoutes.documents}");
        Navigator.of(context).pushReplacementNamed(WatifRoutes.documents);
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
                            "My Documents",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Upload or photograph important docs for\nsafekeeping and easy access.",
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
                                  _buildDocumentButton(
                                    "Drivers License",
                                    buttonFontSize,
                                    screenSize,
                                  ),
                                  SizedBox(height: screenSize.height * 0.015),
                                  _buildDocumentButton(
                                    "Vehicle Documents",
                                    buttonFontSize,
                                    screenSize,
                                  ),
                                  SizedBox(height: screenSize.height * 0.015),
                                  _buildDocumentButton(
                                    "Insurance Policy",
                                    buttonFontSize,
                                    screenSize,
                                  ),
                                  SizedBox(height: screenSize.height * 0.015),
                                  _buildDocumentButton(
                                    "",
                                    buttonFontSize,
                                    screenSize,
                                    isEmpty: true,
                                  ),
                                  // We can add more empty buttons as needed
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

  Widget _buildDocumentButton(String text, double fontSize, Size screenSize,
      {bool isEmpty = false}) {
    return GestureDetector(
      onTap: () {
        if (!isEmpty) {
          print("Document button tapped: $text");
          // Add navigation or action logic here
        } else {
          print("Empty document button tapped");
          // Handle tapping on an empty button - maybe show dialog to create a new document category
        }
      },
      child: Container(
        width: double.infinity,
        height: screenSize.height * 0.06,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(30),
          color: Colors.black,
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
