import 'package:flutter/material.dart';
import 'package:webdirectories/Watif/watif_home.dart';
import 'package:webdirectories/Watif/watif_account.dart';
import 'package:webdirectories/Watif/watif_settings.dart';
import 'package:webdirectories/Watif/watif_help.dart';
import 'package:webdirectories/Watif/watif_contact.dart';
import 'package:webdirectories/Watif/watif_landing.dart';

class WatifNavbar extends StatelessWidget {
  const WatifNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    // Get the current route name to highlight the active menu item
    final String currentRoute = ModalRoute.of(context)?.settings.name ?? '/';

    return Drawer(
      backgroundColor: const Color(0xFF011F33),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'images/watif_logo.png',
                        height: screenSize.height * 0.05,
                        fit: BoxFit.contain,
                        alignment: Alignment.centerLeft,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Drive Smarter',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                _buildNavItem(
                  context,
                  Icons.home,
                  'Home',
                  () => _navigateToPage(context, const WatifHome(), '/home'),
                  isActive: currentRoute == '/home' || currentRoute == '/',
                ),
                _buildNavItem(
                  context,
                  Icons.account_circle,
                  'My Account',
                  () => _navigateToPage(
                      context, const WatifAccount(), '/account'),
                  isActive: currentRoute == '/account',
                ),
                _buildNavItem(
                  context,
                  Icons.settings,
                  'Settings',
                  () => _navigateToPage(
                      context, const WatifSettings(), '/settings'),
                  isActive: currentRoute == '/settings',
                ),
                _buildNavItem(
                  context,
                  Icons.help_outline,
                  'Help',
                  () => _navigateToPage(context, const WatifHelp(), '/help'),
                  isActive: currentRoute == '/help',
                ),
                _buildNavItem(
                  context,
                  Icons.contact_mail,
                  'Contact Us',
                  () => _navigateToPage(
                      context, const WatifContact(), '/contact'),
                  isActive: currentRoute == '/contact',
                ),
              ],
            ),
          ),
          // Logout button at the bottom
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.white.withOpacity(0.2), width: 1),
              ),
            ),
            child: ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.white70,
              ),
              title: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              onTap: () => _showLogoutDialog(context),
              hoverColor: Colors.white.withOpacity(0.1),
            ),
          ),
        ],
      ),
    );
  }

  // Navigation helper method
  void _navigateToPage(BuildContext context, Widget page, String routeName) {
    Navigator.pop(context); // Close the drawer

    // Check if we're already on this page to avoid pushing duplicate routes
    if (ModalRoute.of(context)?.settings.name != routeName) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => page,
          settings: RouteSettings(name: routeName),
        ),
      );
    }
  }

  // Show confirmation dialog for logout
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Close the dialog
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Close the dialog and drawer
                Navigator.of(context).pop();
                Navigator.of(context).pop();

                // Perform logout actions - like clearing tokens/data etc.
                // Then navigate to landing page
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const WatifLanding(),
                  ),
                  (route) => false, // Remove all previous routes
                );
              },
              child: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildNavItem(
      BuildContext context, IconData icon, String title, VoidCallback onTap,
      {bool isActive = false}) {
    return ListTile(
      leading: Icon(
        icon,
        color: isActive ? const Color(0xFF6ECDF8) : Colors.white70,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isActive ? const Color(0xFF6ECDF8) : Colors.white,
          fontSize: 16,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: onTap,
      // Add subtle highlight effect on hover
      hoverColor: Colors.white.withOpacity(0.1),
      // Background highlight when active
      tileColor: isActive ? Colors.white.withOpacity(0.05) : null,
    );
  }
}
