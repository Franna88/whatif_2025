import 'package:flutter/material.dart';

import '../../../ServiceQuote.dart/serviceQuoteForm.dart';
import '../ProfileIconContact.dart';

class ProfileSocials extends StatefulWidget {
  final Map<String, String> socialsLinks;
  const ProfileSocials({super.key, required this.socialsLinks});

  @override
  State<ProfileSocials> createState() => _ProfileSocialsState();
}

class _ProfileSocialsState extends State<ProfileSocials> {
  //Dialog for notification popup
  Future openQuoteForm() => showDialog(
      context: context,
      builder: (context) {
        return Dialog(child: ServiceQuoteForm());
      });
  @override
  Widget build(BuildContext context) {
    print(widget.socialsLinks);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        widget.socialsLinks['telephone'] != null
            ? Row(children: [
                ProfileSocialIconContact(
                    profileIcon: 'images/Contact1.svg',
                    socialdescription: 'Call',
                    onPress: () {}),
                SizedBox(
                  width: 4,
                )
              ])
            : SizedBox(),
        widget.socialsLinks['email'] != null
            ? Row(children: [
                ProfileSocialIconContact(
                    profileIcon: 'images/Contact6.svg',
                    socialdescription: 'WhatsApp',
                    onPress: () {}),
                SizedBox(
                  width: 4,
                )
              ])
            : SizedBox(),
        widget.socialsLinks['whatsapp'] != null
            ? Row(children: [
                ProfileSocialIconContact(
                    profileIcon: 'images/Contact7.svg',
                    socialdescription: 'Email',
                    onPress: () {}),
                SizedBox(
                  width: 4,
                ),
              ])
            : SizedBox(),
        ProfileSocialIconContact(
            profileIcon: 'images/GetQuote.svg',
            socialdescription: 'Get Quote',
            onPress: () {
              openQuoteForm();
            }),
        ProfileSocialIconContact(
            profileIcon: 'images/Contact5.svg',
            socialdescription: 'Leave Review',
            onPress: () {}),
      ],
    );
  }
}
