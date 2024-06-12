import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/mobileLandingPage.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileJobFinder/mobileJobFinder.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileQuestionPages/mobileQuestionLanding.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileRecentArticles/mobileRecentArticles.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ownersLogin/mainPageItems/ownersLoginMain.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ownersLogin/ownersLoginMobile.dart';
import 'package:webdirectories/myutility.dart';

class MobileTopNavBarhome extends StatefulWidget {
  const MobileTopNavBarhome({Key? key}) : super(key: key);

  @override
  State<MobileTopNavBarhome> createState() => _MobileTopNavBarhomeState();
}

class _MobileTopNavBarhomeState extends State<MobileTopNavBarhome> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, right: 20),
          child: Container(
            width: 200,
            height: 100,
            child: Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                'images/logoPanel.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        PopupMenuButton(
          icon: Icon(
            Icons.menu,
            size: 40,
            color: Colors.white,
          ),
          itemBuilder: (BuildContext context) {
            return [
              buildPopupMenuItem('Home', 'option1', Mobilelandingpage()),
              buildPopupMenuItem('Job Finder', 'option2', MobileJobFinder()),
              buildPopupMenuItem(
                  'More Service', 'option3', Mobilelandingpage()),
              buildPopupMenuItem(
                  'News & Articles', 'option4', MobileRecentArticles()),
              buildPopupMenuItem(
                  'Get Listed Today', 'option5', MobileQuestionLanding()),
              buildPopupMenuItem('Owners Portal', 'option6', OwnersloginMain()),
            ];
          },
          onSelected: (value) {
            setState(() {
              selectedOption = value as String?;
            });
          },
        ),
      ],
    );
  }

  PopupMenuItem<String> buildPopupMenuItem(
      String text, String value, Widget route) {
    final isSelected = selectedOption == value;
    return PopupMenuItem(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Material(
                      child: route,
                    )));
      },
      value: value,
      child: Container(
        width: MyUtility(context).width,
        color: isSelected
            ? Color(0xFFebebeb).withOpacity(0.05)
            : Color(0xFFebebeb).withOpacity(0.05),
        child: ListTile(
          title: Text(
            text,
            style: TextStyle(
                color: Colors.black, fontFamily: 'raleway', fontSize: 18),
          ),
        ),
      ),
    );
  }
}
