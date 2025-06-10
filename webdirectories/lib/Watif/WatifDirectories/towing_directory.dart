import 'package:flutter/material.dart';
import 'package:webdirectories/Watif/WatifDirectories/TowingServices/find_tow_trucks.dart';
import 'package:webdirectories/Watif/WatifDirectories/TowingServices/set_location.dart';

class TowingDirectory extends StatelessWidget {
  const TowingDirectory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF01070B),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Towing Directory',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
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
              horizontal: screenSize.width * 0.05,
              vertical: screenSize.height * 0.02,
            ),
            child: Column(
              children: [
                // Header section
                SizedBox(height: screenSize.height * 0.02),

                // Tow truck icon
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    Icons.local_shipping,
                    size: screenSize.width * 0.15,
                    color: const Color(0xFF6ECDF8),
                  ),
                ),

                SizedBox(height: screenSize.height * 0.03),

                // Title
                const Text(
                  'Tow Tracker',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: screenSize.height * 0.02),

                // Subtitle
                Text(
                  'Connect drivers and customers for fast,\nreliable towing services',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: screenSize.height * 0.06),

                // Menu options
                Expanded(
                  child: Column(
                    children: [
                      // Option 1: Find Tow Trucks Near Me
                      _buildMenuOption(
                        context: context,
                        icon: Icons.search_rounded,
                        title: 'Find Tow Trucks Near Me',
                        subtitle: 'I need a tow truck to help me',
                        description:
                            'Find available tow trucks in your area and request assistance',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FindTowTrucks(),
                            ),
                          );
                        },
                        screenSize: screenSize,
                        primaryColor: const Color(0xFF6ECDF8),
                      ),

                      SizedBox(height: screenSize.height * 0.03),

                      // Option 2: Set Location (For Drivers)
                      _buildMenuOption(
                        context: context,
                        icon: Icons.location_on,
                        title: 'Set Location',
                        subtitle: 'I am a tow truck driver',
                        description:
                            'Share your location to help customers find your services',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SetLocation(),
                            ),
                          );
                        },
                        screenSize: screenSize,
                        primaryColor: const Color(0xFFFF8728),
                      ),

                      Spacer(),

                      // Information section
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.1),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.info_outline,
                              color: const Color(0xFF6ECDF8),
                              size: 24,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                'Real-time tracking powered by Google Maps ensures accurate location sharing and fast response times.',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: screenSize.height * 0.02),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuOption({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required String description,
    required VoidCallback onTap,
    required Size screenSize,
    required Color primaryColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              primaryColor.withOpacity(0.1),
              primaryColor.withOpacity(0.05),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: primaryColor.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            // Icon container
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: primaryColor,
                size: 32,
              ),
            ),

            const SizedBox(width: 16),

            // Text content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            // Arrow icon
            Icon(
              Icons.arrow_forward_ios,
              color: primaryColor,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
