import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';
import 'package:webdirectories/Watif/WatifRegisterPages/watif_biometric_success.dart';

class WatifBiometricPopup extends StatelessWidget {
  final Function(bool) onResponse;

  const WatifBiometricPopup({
    Key? key,
    required this.onResponse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MyUtility(context).width;
    final double height = MyUtility(context).height;

    // Responsive sizing
    final double dialogWidth = width * 0.8;
    final double buttonHeight = height * 0.045;
    final double fontSize = width * 0.045;
    final double subtitleFontSize = width * 0.035;

    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        width: dialogWidth,
        padding: EdgeInsets.symmetric(
          vertical: height * 0.03,
          horizontal: width * 0.06,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title
            Text(
              'Biometric Login',
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: height * 0.015),

            // Description
            Text(
              'For easier access do you want to enable biometric login?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: subtitleFontSize,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: height * 0.025),

            // Buttons row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // No button
                Expanded(
                  child: SizedBox(
                    height: buttonHeight,
                    child: ElevatedButton(
                      onPressed: () => onResponse(false),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF5A5A5A),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                      ),
                      child: const Text(
                        'No',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: width * 0.04),

                // Yes button
                Expanded(
                  child: SizedBox(
                    height: buttonHeight,
                    child: ElevatedButton(
                      onPressed: () => onResponse(true),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF033452),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Yes',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: width * 0.01),
                          const Icon(Icons.arrow_forward, size: 18)
                        ],
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
}

/// Stores biometric authentication preference
class BiometricPreference {
  static bool isEnabled = false;
  static bool hasSeenPrompt = false;

  static Future<void> setEnabled(bool value) async {
    // In a real app, you would use shared_preferences or another storage mechanism
    isEnabled = value;
    hasSeenPrompt = true; // Mark that the user has seen the prompt
    print('Biometric login ${value ? 'enabled' : 'disabled'}');

    // Here you would integrate with the platform's biometric authentication
    if (value) {
      // You would normally register biometric credentials here
      // e.g., using packages like local_auth, flutter_secure_storage, etc.
    }
  }

  static bool getIsEnabled() {
    return isEnabled;
  }

  static bool getHasSeenPrompt() {
    return hasSeenPrompt;
  }
}

/// Shows the biometric login popup dialog and handles the response
void showBiometricLoginPopup(BuildContext context) {
  // Mark that we've shown the prompt
  BiometricPreference.hasSeenPrompt = true;

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return WatifBiometricPopup(
        onResponse: (enableBiometric) async {
          // Close the initial popup
          Navigator.of(context).pop();

          // Handle the user's choice
          if (enableBiometric) {
            try {
              // This is where you would do the actual biometric setup in a real app
              // For demonstration, we'll just simulate success

              // Save the user's preference
              await BiometricPreference.setEnabled(true);

              // Show the success popup
              if (context.mounted) {
                showBiometricSuccessPopup(context);
              }
            } catch (e) {
              // Handle any potential errors during biometric setup
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:
                        Text('Error enabling biometric login: ${e.toString()}'),
                    duration: const Duration(seconds: 3),
                  ),
                );
              }
            }
          } else {
            // User declined biometric login
            await BiometricPreference.setEnabled(false);

            // Optional: Show a confirmation message
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Biometric login not enabled'),
                  duration: Duration(seconds: 2),
                ),
              );
            }
          }
        },
      );
    },
  );
}
