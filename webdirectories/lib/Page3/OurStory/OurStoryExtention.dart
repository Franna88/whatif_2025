import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class OurStoryExtention extends StatefulWidget {
  const OurStoryExtention({super.key});

  @override
  State<OurStoryExtention> createState() => _OurStoryExtentionState();
}

class _OurStoryExtentionState extends State<OurStoryExtention> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: MyUtility(context).width * 0.17,
          child: Column(
            children: [
              Text(
                'Google Rankings',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'ralewaybold',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 4),
              Text(
                'We offer niche-specific directories with first-page Google rankings and targeted advertising, ensuring you reach potential customers actively seeking your services and driving more qualified leads to your business.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontFamily: 'raleway',
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        SizedBox(
          width: MyUtility(context).width * 0.17,
          child: Column(
            children: [
              Text(
                'Collaboration',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'ralewaybold',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 4),
              Text(
                'We believe that collaboration is key to success. We encourage our employees to share ideas, work together on projects, and support each other’s growth. Our collaborative company culture allows us to provide customers with the best possible service.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontFamily: 'raleway',
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        SizedBox(
          width: MyUtility(context).width * 0.170,
          child: Column(
            children: [
              Text(
                'Innovation',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'ralewaybold',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 4),
              Text(
                'We are always looking for new ways to improve our offering that is why we are continuously design, develop and evaluate our data driven products and services. We always focus on new ways to enhance user centric experiences.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontFamily: 'raleway',
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        )
      ],
    );
  }
}
