import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';

class WatifBiometricSuccess extends StatelessWidget {
  final VoidCallback onContinue;

  const WatifBiometricSuccess({
    Key? key,
    required this.onContinue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MyUtility(context).width;
    final double height = MyUtility(context).height;

    // Responsive sizing
    final double dialogWidth = width * 0.8;
    final double buttonHeight = height * 0.045;
    final double titleFontSize = width * 0.045;
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
              'Biometric Login Enabled',
              style: TextStyle(
                fontSize: titleFontSize,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: height * 0.02),

            // Instruction text
            Text(
              'Turn it off at anytime in My Settings > Security Settings',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: subtitleFontSize,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: height * 0.03),

            // Continue button
            SizedBox(
              width: double.infinity,
              height: buttonHeight,
              child: ElevatedButton(
                onPressed: onContinue,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF033452),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Shows the biometric success popup dialog
void showBiometricSuccessPopup(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // User must tap button to close dialog
    builder: (BuildContext context) {
      return WatifBiometricSuccess(
        onContinue: () {
          // Close the dialog and continue with the app
          Navigator.of(context).pop();

          // You could navigate to a specific page here if needed
          // For example, to go back to the home page:
          // Navigator.of(context).pushReplacementNamed(WatifRoutes.home);
        },
      );
    },
  );
}
