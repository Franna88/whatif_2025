import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';

class WatifPasswordResetError extends StatelessWidget {
  final String email;

  const WatifPasswordResetError({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MyUtility(context).width;
    final double height = MyUtility(context).height;

    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        width: width * 0.85,
        padding: EdgeInsets.symmetric(
          vertical: height * 0.03,
          horizontal: width * 0.06,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Back button at top left
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: width * 0.05,
                ),
              ),
            ),
            SizedBox(height: height * 0.01),

            // Error Icon
            Container(
              width: width * 0.15,
              height: width * 0.15,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFA02727),
              ),
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: width * 0.09,
              ),
            ),
            SizedBox(height: height * 0.02),

            // Title
            Text(
              'Oh no!',
              style: TextStyle(
                fontSize: width * 0.06,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: height * 0.02),

            // Message
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontSize: width * 0.04,
                  color: Colors.black87,
                ),
                children: [
                  const TextSpan(text: 'It seems as if\n'),
                  TextSpan(
                    text: email,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF033452),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const TextSpan(
                    text:
                        '\nis not linked to any account on our system. Please try again using a different email address.',
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.02),

            // Divider
            Container(
              height: 1,
              width: width * 0.7,
              color: Colors.grey.withOpacity(0.3),
            ),
            SizedBox(height: height * 0.02),

            // Help text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Unsure what to do? ',
                  style: TextStyle(
                    fontSize: width * 0.035,
                    color: Colors.black54,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Add help functionality here
                    Navigator.of(context).pop(); // Close current dialog
                    // Could navigate to help page or show another dialog
                  },
                  child: Text(
                    'We can help',
                    style: TextStyle(
                      fontSize: width * 0.035,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
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
