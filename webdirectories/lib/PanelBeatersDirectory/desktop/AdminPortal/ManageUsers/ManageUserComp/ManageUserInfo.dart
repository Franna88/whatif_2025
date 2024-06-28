import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/myutility.dart';

class ManageUserInfo extends StatefulWidget {
  final String year;
  final String month;
  final String day;
  final String email;
  final String fullName;
  final String status;

  const ManageUserInfo(
      {super.key,
      required this.year,
      required this.month,
      required this.day,
      required this.email,
      required this.fullName,
      required this.status});

  @override
  State<ManageUserInfo> createState() => _ManageUserInfoState();
}

class _ManageUserInfoState extends State<ManageUserInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: MyUtility(context).width * 0.72,
        height: MyUtility(context).height * 0.06,
        decoration: ShapeDecoration(
          color: Color(0xFF0F253A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: MyUtility(context).width * 0.15,
                child: Text(
                  '${widget.year}/${widget.month}/${widget.day}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.96,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                width: MyUtility(context).width * 0.15,
                child: Text(
                  widget.email,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.96,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(
                width: MyUtility(context).width * 0.225,
                child: Text(
                  widget.fullName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.96,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                width: MyUtility(context).width * 0.15,
                child: Text(
                  widget.status,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.96,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                child: SvgPicture.asset('images/right.svg'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
