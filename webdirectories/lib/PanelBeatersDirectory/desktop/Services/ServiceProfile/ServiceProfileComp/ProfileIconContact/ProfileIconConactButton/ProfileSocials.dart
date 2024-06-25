import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServiceProfile/ServiceProfileComp/ProfileIconContact/ProfileIconContact.dart';

class ProfileSocials extends StatefulWidget {
  const ProfileSocials({super.key});

  @override
  State<ProfileSocials> createState() => _ProfileSocialsState();
}

class _ProfileSocialsState extends State<ProfileSocials> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileSocialIconContact(
            profileIcon: 'images/Contact1.svg',
            socialdescription: 'Call',
            onPress: () {}),
        ProfileSocialIconContact(
            profileIcon: 'images/Contact6.svg',
            socialdescription: 'WhatsApp',
            onPress: () {}),
        ProfileSocialIconContact(
            profileIcon: 'images/Contact7.svg',
            socialdescription: 'Email',
            onPress: () {}),
        ProfileSocialIconContact(
            profileIcon: 'images/GetQuote.svg',
            socialdescription: 'Get Quote',
            onPress: () {}),
        ProfileSocialIconContact(
            profileIcon: 'images/Contact5.svg',
            socialdescription: 'Leave Review',
            onPress: () {}),
      ],
    );
  }
}
