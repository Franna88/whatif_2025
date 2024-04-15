import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class CommentsMobile extends StatefulWidget {
  final String profileimage;
  final String comment;
  final String username;

  const CommentsMobile(
      {Key? key,
      required this.profileimage,
      required this.comment,
      required this.username})
      : super(key: key);

  @override
  State<CommentsMobile> createState() => _CommentsMobileState();
}

class _CommentsMobileState extends State<CommentsMobile> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          SizedBox(
            height: MyUtility(context).height * 0.05,
          ),
          Container(
            width: MyUtility(context).width,
            height: MyUtility(context).height / 2,
            color: Colors.white,
          ),
          Positioned(
            top: MyUtility(context).height * 0.1,
            left: MyUtility(context).width * 0.1,
            right: MyUtility(context).width * 0.1,
            child: Container(
              width: MyUtility(context).width / 1.2,
              decoration: BoxDecoration(
                color: Color(0xFF0E1013),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: MyUtility(context).height * 0.05,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.comment,
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'raleway',
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: MyUtility(context).height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.username,
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'ralewaysemi',
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MyUtility(context).height * 0.05,
            left: MyUtility(context).width * 0.4,
            child: CircleAvatar(
              radius: 45,
              backgroundImage: AssetImage(
                widget.profileimage,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
