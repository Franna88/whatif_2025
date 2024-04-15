import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class WebsiteDisclaimer extends StatefulWidget {
  const WebsiteDisclaimer({super.key});

  @override
  State<WebsiteDisclaimer> createState() => _WebsiteDisclaimerState();
}

class _WebsiteDisclaimerState extends State<WebsiteDisclaimer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MyUtility(context).width / 1.1,
      height: MyUtility(context).height * 1.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Website Information, Disclaimer and Privacy Policy",
            style: TextStyle(
                fontSize: 48, fontFamily: 'ralewaybold', color: Colors.black),
          ),
          Text(
            "Smashpro Web Directories PTY Ltd ",
            style: TextStyle(
                fontSize: 28, fontFamily: 'ralewaysemi', color: Colors.black),
          ),
          SizedBox(
            height: MyUtility(context).height * 0.025,
          ),
          Text(
            "Last Updated: ",
            style: TextStyle(
                fontSize: 18, fontFamily: 'ralewayit', color: Colors.black),
          ),
        ],
      ),
    );
  }
}
