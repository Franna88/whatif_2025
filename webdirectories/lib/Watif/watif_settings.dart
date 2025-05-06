import 'package:flutter/material.dart';
import 'package:webdirectories/Watif/watif_navbar.dart';
import 'package:webdirectories/Watif/WatifRegisterPages/watif_biometric_popup.dart';

class WatifSettings extends StatefulWidget {
  const WatifSettings({Key? key}) : super(key: key);

  @override
  State<WatifSettings> createState() => _WatifSettingsState();
}

class _WatifSettingsState extends State<WatifSettings> {
  // Track biometric state in the widget
  bool _biometricEnabled = false;

  @override
  void initState() {
    super.initState();
    // Get current biometric status
    _biometricEnabled = BiometricPreference.getIsEnabled();
  }

  void _toggleBiometric(bool value) async {
    await BiometricPreference.setEnabled(value);
    setState(() {
      _biometricEnabled = value;
    });

    // Show confirmation
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Biometric login ${value ? 'enabled' : 'disabled'}'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double horizontalPadding = screenSize.width * 0.08;
    final double verticalPadding = screenSize.height * 0.02;

    // Calculate responsive sizes
    final double titleFontSize = screenSize.width * 0.07;
    final double subtitleFontSize = screenSize.width * 0.035;
    final double labelFontSize = screenSize.width * 0.04;
    final double categoryFontSize = screenSize.width * 0.045;

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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: verticalPadding * 2),
                  Center(
                    child: Text(
                      'My Settings',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: verticalPadding),
                  Center(
                    child: Text(
                      'Manage how your app works for you.\nAdjust your preferences to suit your\nneeds and ensure a more\npersonalized experience.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: subtitleFontSize,
                      ),
                    ),
                  ),
                  SizedBox(height: verticalPadding * 2),

                  // Security Settings Section
                  _buildSectionHeader('Security Settings', categoryFontSize),
                  SizedBox(height: verticalPadding),

                  // Add biometric login option
                  _buildToggleOption(
                    'Biometric Login',
                    'Use your fingerprint or face recognition for quick access',
                    _biometricEnabled,
                    screenSize,
                    labelFontSize,
                    subtitleFontSize,
                    _toggleBiometric,
                  ),

                  _buildSettingOption(
                    'Passwords',
                    'Add/Update your login credentials to keep your account secure.',
                    Icons.arrow_forward_ios,
                    screenSize,
                    labelFontSize,
                    subtitleFontSize,
                    () {},
                  ),

                  SizedBox(height: verticalPadding * 2),

                  // Language & Region Section
                  _buildSectionHeader('Language & Region', categoryFontSize),
                  SizedBox(height: verticalPadding),

                  _buildSettingOption(
                    'Preferred Language',
                    'Please select your preferred language (e.g., English, Afrikaans)',
                    Icons.arrow_forward_ios,
                    screenSize,
                    labelFontSize,
                    subtitleFontSize,
                    () {},
                  ),

                  _buildSettingOption(
                    'Time Zone',
                    'Adjust your time zone for appointment accuracy and reminders.',
                    Icons.arrow_forward_ios,
                    screenSize,
                    labelFontSize,
                    subtitleFontSize,
                    () {},
                  ),

                  SizedBox(height: verticalPadding * 2),

                  // Notifications Section
                  _buildSectionHeader('Notifications', categoryFontSize),
                  SizedBox(height: verticalPadding),

                  _buildSettingOption(
                    'Service Reminders',
                    'Enable or disable notifications for upcoming renewals',
                    Icons.arrow_forward_ios,
                    screenSize,
                    labelFontSize,
                    subtitleFontSize,
                    () {},
                  ),

                  _buildSettingOption(
                    'News & Updates',
                    'Opt in for updates or app improvements, or partnered services.',
                    Icons.arrow_forward_ios,
                    screenSize,
                    labelFontSize,
                    subtitleFontSize,
                    () {},
                  ),

                  SizedBox(height: verticalPadding * 3),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, double fontSize) {
    return Center(
      child: Text(
        title,
        style: TextStyle(
          color: const Color(0xFF6ECDF8),
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSettingOption(
    String title,
    String subtitle,
    IconData icon,
    Size screenSize,
    double titleFontSize,
    double subtitleFontSize,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.white.withOpacity(0.1),
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: subtitleFontSize,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              icon,
              color: Colors.white,
              size: screenSize.width * 0.05,
            ),
          ],
        ),
      ),
    );
  }

  // Add a new helper method for toggle options
  Widget _buildToggleOption(
    String title,
    String subtitle,
    bool value,
    Size screenSize,
    double titleFontSize,
    double subtitleFontSize,
    Function(bool) onChanged,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withOpacity(0.1),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: subtitleFontSize,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: const Color(0xFF033452),
            activeTrackColor: Colors.white70,
          ),
        ],
      ),
    );
  }
}
