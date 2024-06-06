import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/LightStone/LightStone/LightStone.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/Reviews.dart';
import 'package:webdirectories/myutility.dart';

class ReviewsNAvButton extends StatefulWidget {
  const ReviewsNAvButton({super.key});

  @override
  State<ReviewsNAvButton> createState() => _ReviewsNAvButtonState();
}

class _ReviewsNAvButtonState extends State<ReviewsNAvButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MyUtility(context).width * 0.4,
      height: MyUtility(context).height * 0.052,
      child: Stack(
        children: [
          Positioned(
            top: 07,
            left: 40,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LightStone()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0x3FFC40D0D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(15.0),
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                  ),
                ),
                fixedSize: Size(MyUtility(context).width * 0.345,
                    MyUtility(context).height * 0.055),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 130),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 7),
                  child: Text(
                    'Lightstone EchoMBR Reviews',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MyUtility(context).width * 0.015,
                      fontFamily: 'raleway',
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 07,
            left: 0,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Reviews()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFF8828),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                  ),
                ),
                fixedSize: Size(MyUtility(context).width * 0.125,
                    MyUtility(context).height * 0.055),
                padding: EdgeInsets.only(right: -10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 7),
                child: Text(
                  'Shop Reviews',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: MyUtility(context).width * 0.015,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
