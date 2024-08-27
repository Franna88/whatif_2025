import 'package:cached_firestorage/lib.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class TeamProfileAlt extends StatefulWidget {
  final String memberImage;
  final String memberName;
  final String memberPosition;

  const TeamProfileAlt(
      {super.key,
      required this.memberImage,
      required this.memberName,
      required this.memberPosition});

  @override
  State<TeamProfileAlt> createState() => _TeamProfileAltState();
}

class _TeamProfileAltState extends State<TeamProfileAlt> {
  @override
  Widget build(BuildContext context) {
    String imageUrl = widget.memberImage.isNotEmpty
        ? "listings/images/team/${widget.memberImage}"
        : "";

    var widthDevice = MediaQuery.of(context).size.width;
    return Container(
      width: MyUtility(context).width * 0.17,
      height: MyUtility(context).height * 0.31,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFF121417),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Color(0xFF121417),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "${widget.memberName} | ${widget.memberPosition}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: widthDevice < 1500 ? 12.614 : 12.614,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.edit,
                      color: Color(0xFFD17226),
                      size: 18.0,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.delete,
                      color: Color(0xFFD17226),
                      size: 18.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          CircleAvatar(
            radius: widthDevice < 1500 ? 45 : 80,
            backgroundColor: Colors.white,
            child: imageUrl.isEmpty
                ? CircleAvatar(
                    radius: widthDevice < 1500 ? 43 : 80,
                    backgroundImage: AssetImage('images/employee.jpg'),
                    backgroundColor: Colors.transparent,
                  )
                : CircleAvatar(
                    radius: widthDevice < 1500 ? 43 : 80,
                    backgroundColor: Colors.transparent,
                    child: RemotePicture(
                      imagePath: imageUrl,
                      mapKey: 'background',
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
