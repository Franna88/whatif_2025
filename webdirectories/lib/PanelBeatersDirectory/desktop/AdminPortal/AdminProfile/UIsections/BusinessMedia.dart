import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/SocialsReuseable.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/AddButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/AddMediaPopUp/AddMediaPopUp.dart';
import 'package:webdirectories/myutility.dart';

class Businessmedia extends StatefulWidget {
  const Businessmedia({super.key});

  @override
  State<Businessmedia> createState() => _BusinessmediaState();
}

class _BusinessmediaState extends State<Businessmedia> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(
            'Media',
            style: TextStyle(
              color: Color(0xFF0F253A),
              fontSize: 20.4,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: SizedBox(
            width: MyUtility(context).width * 0.335,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MyUtility(context).width * 0.28,
                  height: MyUtility(context).height * 0.065,
                  decoration: ShapeDecoration(
                    color: Color(0xFF0F253A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Title',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21.76,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                AddButton(
                  text: 'Add',
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      barrierColor: Colors.black.withOpacity(0.5),
                      builder: (BuildContext context) {
                        return Dialog(
                          backgroundColor: Colors.transparent,
                          insetPadding: EdgeInsets.all(10),
                          child: AddMediaPopup(),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        SocialsReuseable(
          socials: 'Facebook',
        ),
        SocialsReuseable(
          socials: 'Instagram',
        ),
      ],
    );
  }
}
