import 'package:flutter/material.dart';
import 'package:webdirectories/Watif/watif_navbar.dart';

class WatifHelp extends StatefulWidget {
  const WatifHelp({Key? key}) : super(key: key);

  @override
  State<WatifHelp> createState() => _WatifHelpState();
}

class _WatifHelpState extends State<WatifHelp> {
  // Track which FAQ items are expanded
  Map<int, bool> _expandedItems = {
    0: true, // First item expanded by default
    1: false,
    2: false,
    3: false,
  };

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double horizontalPadding = screenSize.width * 0.05;
    final double verticalPadding = screenSize.height * 0.02;

    // Calculate responsive sizes
    final double titleFontSize = screenSize.width * 0.07;
    final double subtitleFontSize = screenSize.width * 0.035;
    final double faqTitleFontSize = screenSize.width * 0.04;
    final double faqContentFontSize = screenSize.width * 0.035;
    final double highlightedTextFontSize = screenSize.width * 0.038;

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
      endDrawer: const WatifNavbar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ),
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: verticalPadding),
              decoration: BoxDecoration(
                // color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(horizontalPadding),
                child: Column(
                  children: [
                    SizedBox(height: verticalPadding),
                    Text(
                      'Need help?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: verticalPadding),
                    Text(
                      'Browse our most frequently asked\nquestions or walk through the app\nfeatures step by step.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: subtitleFontSize,
                      ),
                    ),
                    SizedBox(height: verticalPadding * 2),

                    // FAQ Items
                    _buildFaqItem(
                      index: 0,
                      question: 'How do I update my profile?',
                      answer: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: faqContentFontSize,
                          ),
                          children: [
                            const TextSpan(text: 'Go to the '),
                            TextSpan(
                              text: 'My Profile',
                              style: TextStyle(
                                color: const Color(0xFF6ECDF8),
                                fontSize: highlightedTextFontSize,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const TextSpan(
                                text: ' tab on the homepage, click on the '),
                            TextSpan(
                              text: 'Personal Information',
                              style: TextStyle(
                                color: const Color(0xFF6ECDF8),
                                fontSize: highlightedTextFontSize,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const TextSpan(
                                text: ' tab to edit the relevant fields'),
                          ],
                        ),
                      ),
                      titleFontSize: faqTitleFontSize,
                      isExpanded: _expandedItems[0] ?? false,
                      onToggle: () {
                        setState(() {
                          _expandedItems[0] = !(_expandedItems[0] ?? false);
                        });
                      },
                    ),

                    _buildFaqItem(
                      index: 1,
                      question: 'Where do I upload vehicle documents?',
                      answer: Text(
                        'This functionality will be available in a future update of the app.',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: faqContentFontSize,
                        ),
                      ),
                      titleFontSize: faqTitleFontSize,
                      isExpanded: _expandedItems[1] ?? false,
                      onToggle: () {
                        setState(() {
                          _expandedItems[1] = !(_expandedItems[1] ?? false);
                        });
                      },
                    ),

                    _buildFaqItem(
                      index: 2,
                      question: 'I need a step-by-step walkthrough',
                      answer: Text(
                        'Our guided walkthrough feature is coming soon. In the meantime, you can browse these FAQ items or contact support for assistance.',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: faqContentFontSize,
                        ),
                      ),
                      titleFontSize: faqTitleFontSize,
                      isExpanded: _expandedItems[2] ?? false,
                      onToggle: () {
                        setState(() {
                          _expandedItems[2] = !(_expandedItems[2] ?? false);
                        });
                      },
                    ),

                    _buildFaqItem(
                      index: 3,
                      question: 'I need a step-by-step walkthrough',
                      answer: Text(
                        'This is a duplicate question that will be replaced with actual content before release.',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: faqContentFontSize,
                        ),
                      ),
                      titleFontSize: faqTitleFontSize,
                      isExpanded: _expandedItems[3] ?? false,
                      onToggle: () {
                        setState(() {
                          _expandedItems[3] = !(_expandedItems[3] ?? false);
                        });
                      },
                      isLastItem: true,
                    ),
                    SizedBox(height: verticalPadding),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFaqItem({
    required int index,
    required String question,
    required Widget answer,
    required double titleFontSize,
    required bool isExpanded,
    required VoidCallback onToggle,
    bool isLastItem = false,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: onToggle,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: isLastItem && !isExpanded
                      ? Colors.transparent
                      : Colors.white.withOpacity(0.1),
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    question,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Colors.white,
                  size: titleFontSize * 1.5,
                ),
              ],
            ),
          ),
        ),
        if (isExpanded)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 16, bottom: 20),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.white.withOpacity(0.1),
                  width: 1,
                ),
              ),
            ),
            child: answer,
          ),
      ],
    );
  }
}
