import 'package:flutter/material.dart';

import '../ProfileSocialIconContactMobile.dart';

class ProfileSocialsMobile extends StatefulWidget {
  const ProfileSocialsMobile({super.key});

  @override
  State<ProfileSocialsMobile> createState() => _ProfileSocialsMobileState();
}

class _ProfileSocialsMobileState extends State<ProfileSocialsMobile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProfileSocialIconContactMobile(
            profileIcon: 'images/Contact1.svg',
            socialdescription: 'Call',
            onPress: () {}),
        ProfileSocialIconContactMobile(
            profileIcon: 'images/Contact6.svg',
            socialdescription: 'WhatsApp',
            onPress: () {}),
        ProfileSocialIconContactMobile(
            profileIcon: 'images/Contact7.svg',
            socialdescription: 'Email',
            onPress: () {}),
        ProfileSocialIconContactMobile(
            profileIcon: 'images/GetQuote.svg',
            socialdescription: 'Get\nQuote',
            onPress: () {}),
        ProfileSocialIconContactMobile(
            profileIcon: 'images/Contact5.svg',
            socialdescription: 'Leave\nReview',
            onPress: () {}),
      ],
    );
  }
}
