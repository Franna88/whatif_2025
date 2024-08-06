import 'dart:typed_data';
import 'package:cached_firestorage/lib.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/firebaseImageUtils.dart';
import 'package:webdirectories/myutility.dart';

class ProfileImage extends StatefulWidget {
  final String imageText;
  final String imageName;

  const ProfileImage(
      {super.key, required this.imageName, required this.imageText});

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  String? _imageUrl;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    // String? url = await getImageData(
    //     "listings/images/listings/${widget.imageName}"); // Change to your image path
    // if (url != null) {
    //   setState(() {
    //     print(url);
    //     _imageUrl = url;
    //   });
    // }
    setState(() {
      _imageUrl = widget.imageName == ''
          ? ''
          : "listings/images/listings/${widget.imageName}";
    });
  }

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(
        right: 30,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 5,
            ),
            child: Text(
              widget.imageText,
              style: TextStyle(
                color: Color(0xFF0F253A),
                fontSize: 20.4,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 1,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            width: widthDevice < 1500
                ? MyUtility(context).width * 0.12
                : MyUtility(context).width * 0.08,
            height: MyUtility(context).height * 0.14,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
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
            child: Center(
                child: Padding(
              padding: const EdgeInsets.only(left: 4.0, right: 4.0),
              child: widget.imageName == ''
                  ? Text('No Image')
                  : RemotePicture(
                      imagePath: _imageUrl!,
                      mapKey: widget.imageName,
                      useAvatarView: true,
                      avatarViewRadius: 50,
                      fit: BoxFit.cover,
                    ),
            )),
          )
        ],
      ),
    );
  }
}
