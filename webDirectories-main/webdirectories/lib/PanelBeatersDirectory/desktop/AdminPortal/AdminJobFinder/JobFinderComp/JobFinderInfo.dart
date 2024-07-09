import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/myutility.dart';

class JobFinderInfo extends StatefulWidget {
  final String year;
  final String month;
  final String day;
  final String occupation;
  final String contact;
  final String name;
  final String location;

  const JobFinderInfo(
      {super.key,
      required this.year,
      required this.month,
      required this.day,
      required this.occupation,
      required this.contact,
      required this.name,
      required this.location});

  @override
  State<JobFinderInfo> createState() => _JobFinderInfoState();
}

class _JobFinderInfoState extends State<JobFinderInfo> {
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: MyUtility(context).width * 0.72,
        height: MyUtility(context).height * 0.06,
        decoration: ShapeDecoration(
          color: Color(0xFFA1A1A1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right:  10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: MyUtility(context).width * 0.1,
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
                width: MyUtility(context).width * 0.17,
                child: Text(
                  widget.occupation,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.96,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                width: MyUtility(context).width * 0.12,
                child: Text(
                  widget.contact,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.96,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                width: MyUtility(context).width * 0.12,
                child: Text(
                  widget.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.96,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                width: MyUtility(context).width * 0.17,
                child: Text(
                  widget.location,
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
                child: SvgPicture.asset('images/dashboard.svg'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
