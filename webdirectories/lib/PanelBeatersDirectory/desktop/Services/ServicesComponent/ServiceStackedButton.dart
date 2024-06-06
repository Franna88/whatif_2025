import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesOther.dart';

class ServicesStackedButton extends StatefulWidget {
  const ServicesStackedButton({super.key});

  @override
  State<ServicesStackedButton> createState() => _ServicesStackedButtonState();
}

class _ServicesStackedButtonState extends State<ServicesStackedButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 50,
      child: Stack(
        children: [
          Positioned(
            top: 15,
            left: 100,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ServicesOther()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                fixedSize: Size(126, 40),
              ),
              child: Text(
                'Other',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.4,
                  fontFamily: 'raleway',
                  fontWeight: FontWeight.w400,
                  height: 1.0,
                ),
              ),
            ),
          ),
          Positioned(
            top: 15,
            left: 0,
            child: ElevatedButton(
              onPressed: () {
                /*   Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ServicesFeatured()),
                );*/
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFF8728),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                fixedSize: Size(126, 40),
                padding: EdgeInsets.only(right: -10),
              ),
              child: Text(
                'Featured',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.4,
                  fontFamily: 'raleway',
                  fontWeight: FontWeight.w400,
                  height: 1.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
