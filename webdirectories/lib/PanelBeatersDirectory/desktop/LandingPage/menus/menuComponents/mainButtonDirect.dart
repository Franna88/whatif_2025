import 'package:flutter/material.dart';

class MainButtonDirect extends StatelessWidget {
  final String buttonTitle;
  const MainButtonDirect({super.key, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            // add logic here
          },
          child: Container(
            width: 600,
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.only(
              top: 5,
              left: 20,
              right: 8,
              bottom: 5,
            ),
            decoration: ShapeDecoration(
              gradient: const LinearGradient(
                begin: Alignment(-1, 0.00),
                end: Alignment(1, 0),
                colors: [Color(0xFFE2822B), Color(0xFFD87121)],
              ),
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 2, color: Colors.white),
                borderRadius: BorderRadius.circular(37.99),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  buttonTitle,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                    height: 0,
                  ),
                ),
                Container(
                  width: 35,
                  height: 35,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.zero,
                  child: const Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
              ],
            ),
          ),
        ),],);
  }
}