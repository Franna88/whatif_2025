import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webdirectories/myutility.dart';

class ProfileSocialIconContact extends StatefulWidget {
  final String profileIcon;
  final String socialdescription;
  final VoidCallback onPress;

  const ProfileSocialIconContact(
      {Key? key,
      required this.profileIcon,
      required this.socialdescription,
      required this.onPress});

  @override
  State<ProfileSocialIconContact> createState() =>
      _ProfileSocialIconContactState();
}

class _ProfileSocialIconContactState extends State<ProfileSocialIconContact> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Column(
        children: [
          GestureDetector(
            onTap: widget.onPress,
            child: Container(
              width: MyUtility(context).width * 0.05,
              height: MyUtility(context).height * 0.085,
              child: SvgPicture.asset(widget.profileIcon),
            ),
          ),
          SizedBox(
            height: MyUtility(context).height * 0.04,
            child: Text(
              widget.socialdescription,
              style: TextStyle(
                color: Colors.white,
                fontSize: 13.6,
                fontFamily: 'raleway',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
