import 'package:flutter/material.dart';

class PricingBenefitsText extends StatelessWidget {
  Color circleColor;
  
  Color textColor;
  String text;
  PricingBenefitsText(
      {super.key,
      required this.circleColor,
      
      required this.text,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Row(
        children: [
          
          Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              color: circleColor,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.zero,
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 10,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: widthDevice * 0.009,
              fontFamily: 'raleway',
              fontWeight: FontWeight.w400,
              
            ),
            
          )
        ],
      ),
    );
  }
}
