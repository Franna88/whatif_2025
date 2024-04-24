import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LearnMoreButton extends StatefulWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const LearnMoreButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<LearnMoreButton> createState() => _LearnMoreButtonState();
}

class _LearnMoreButtonState extends State<LearnMoreButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.085,
      height: MediaQuery.of(context).size.height * 0.045,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'images/arroww.svg',
              width: 23.5,
              height: 23.5,
            ),
            const SizedBox(width: 8),
            Text(
              widget.buttonText,
              style: TextStyle(
                color: Color(0xFFFFFFFF).withOpacity(0.9),
                fontSize: 14,
                fontFamily: 'Raleway',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
