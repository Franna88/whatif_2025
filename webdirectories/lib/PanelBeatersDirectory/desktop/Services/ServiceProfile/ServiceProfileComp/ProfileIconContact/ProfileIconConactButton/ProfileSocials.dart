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
            profileIcon: 'images/call1.svg',
            socialdescription: 'Call',
            onPress: () {}),
        ProfileSocialIconContact(
            profileIcon: 'images/call1.svg',
            socialdescription: 'WhatsApp',
            onPress: () {}),
        ProfileSocialIconContact(
            profileIcon: 'images/call1.svg',
            socialdescription: 'Email',
            onPress: () {}),
        ProfileSocialIconContact(
            profileIcon: 'images/call1.svg',
            socialdescription: 'Get Quote',
            onPress: () {}),
        ProfileSocialIconContact(
            profileIcon: 'images/call1.svg',
            socialdescription: 'Leave Review',
            onPress: () {}),
      ],
    );
  }
}
