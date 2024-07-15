import 'package:flutter/material.dart';

class ServicesStackedButton extends StatefulWidget {
  final VoidCallback showFeatured;
  final VoidCallback showOther;

  const ServicesStackedButton({
    Key? key,
    required this.showFeatured,
    required this.showOther,
  }) : super(key: key);

  @override
  _ServicesStackedButtonState createState() => _ServicesStackedButtonState();
}

class _ServicesStackedButtonState extends State<ServicesStackedButton> {
  bool isFeaturedSelected = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 50,
      child: Stack(
        children: [
          Positioned(
            top: 15,
            left: 110,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  isFeaturedSelected = false;
                });
                widget.showOther();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    isFeaturedSelected ? Colors.black : Color(0xFFFF8728),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                fixedSize: Size(126, 40),
              ),
              child: Text(
                'Other',
                style: TextStyle(
                  color: isFeaturedSelected ? Colors.white : Colors.black,
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
                setState(() {
                  isFeaturedSelected = true;
                });
                widget.showFeatured();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    isFeaturedSelected ? Color(0xFFFF8728) : Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                fixedSize: Size(140, 40),
              ),
              child: Text(
                'Featured',
                style: TextStyle(
                  color: isFeaturedSelected ? Colors.black : Colors.white,
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
