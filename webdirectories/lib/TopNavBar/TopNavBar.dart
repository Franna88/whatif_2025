import 'package:flutter/material.dart';
import 'package:webdirectories/Page3/OurStory/OurSotryComponents/OurStoryTextButton.dart';
import 'package:webdirectories/Page3/OurStory/OurSotryComponents/OvalTextButton.dart';
import 'package:webdirectories/myutility.dart';

class TopNavBar extends StatefulWidget {
  const TopNavBar({Key? key}) : super(key: key);

  @override
  State<TopNavBar> createState() => _TopNavBarState();
}

class _TopNavBarState extends State<TopNavBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset(
            'images/logow.png',
            width: 200,
            height: 120,
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: SizedBox(
            width: MyUtility(context).width * 0.3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OurStoryTextButton(onpress: () {}, text: 'Home'),
                OurStoryTextButton(onpress: () {}, text: 'Our Story'),
                OurStoryTextButton(onpress: () {}, text: 'Watif'),
                OurStoryTextButton(onpress: () {}, text: 'Articles'),
                Spacer(),
                OvalTextButton(text: 'Get in Touch', onPressed: () {})
              ],
            ),
          ),
        ),
      ],
    );
  }
}
