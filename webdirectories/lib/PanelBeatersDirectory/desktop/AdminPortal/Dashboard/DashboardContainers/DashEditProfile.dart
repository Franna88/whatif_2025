import 'package:cached_firestorage/remote_picture.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';

class DashEditProfile extends StatefulWidget {
  final String userDisplayImageName;
  const DashEditProfile({super.key, required this.userDisplayImageName});

  @override
  State<DashEditProfile> createState() => _DashEditProfileState();
}

class _DashEditProfileState extends State<DashEditProfile> {
  @override
  Widget build(BuildContext context) {
    final double widthDevice = MediaQuery.of(context).size.width;
    final double heightDevice = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MyUtility(context).width * 0.28,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Quick\n',
                  style: const TextStyle(
                      fontSize: 11.8184,
                      color: Colors.white,
                      fontFamily: 'ralewaybold'),
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' Navigation',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 11.8184,
                          fontFamily: 'ralewaybold'),
                    ),
                  ],
                ),
                textAlign: TextAlign.right,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: MyUtility(context).width * 0.063,
                  decoration: ShapeDecoration(
                    color: Color(0xFF2C2C2C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.7556),
                    ),
                  ),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(14, 10, 14, 10),
                      child: Text(
                        'Latest\nCustomer\nReviews',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.234,
                            height: 1.2,
                            fontFamily: 'raleway'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: MyUtility(context).width * 0.063,
                  decoration: ShapeDecoration(
                    color: Color(0xFF2C2C2C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.7556),
                    ),
                  ),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(14, 10, 14, 10),
                      child: Text(
                        'Latest\nIndustry\nNews',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.234,
                            height: 1.2,
                            fontFamily: 'raleway'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: MyUtility(context).width * 0.063,
                  decoration: ShapeDecoration(
                    color: Color(0xFF2C2C2C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.7556),
                    ),
                  ),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 12, 10),
                      child: Text(
                        'Update My\nSpecial &\nPromotions',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.234,
                            height: 1.2,
                            fontFamily: 'raleway'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
          /*height: widthDevice < 1500 ? 225.8 : heightDevice * 0.28,
          width: widthDevice < 1500 ? 558.28 : widthDevice * 0.34,*/
          /*width: 476.68,
          height: 208.08,*/
          width: MyUtility(context).width * 0.33,
          height: MyUtility(context).height * 0.3,
          decoration: ShapeDecoration(
            color: Color(0xFF2C2C2C),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(27.19),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Edit my Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.61,
                        fontFamily: 'ralewaybold',
                        fontWeight: FontWeight.w700,
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'Update My DisplayImage',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.2,
                              fontFamily: 'raleway',
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          width: (widthDevice < 1500
                                  ? 558.28
                                  : widthDevice * 0.37) /
                              2.7,
                          height: MyUtility(context).height * 0.18,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: RemotePicture(
                            imagePath:
                                'images/your_image.png', // Static logo path
                            mapKey: 'logo',
                            useAvatarView: false,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Update My Logo',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.2,
                              fontFamily: 'raleway',
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          width: (widthDevice < 1500
                                  ? 558.28
                                  : widthDevice * 0.37) /
                              2.7,
                          height: MyUtility(context).height * 0.18,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: RemotePicture(
                            imagePath:
                                'images/your_image.png', // Static logo path
                            mapKey: 'logo',
                            useAvatarView: false,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
