import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Notifications extends StatefulWidget {
  final String notification;
  final String date;

  const Notifications(
      {super.key, required this.notification, required this.date});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7.5),
      child: Container(
        width: 503.88,
        height: 40.8,
        decoration: ShapeDecoration(
          color: Color(0xFF0F253A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.notification,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.88,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              Text(
                widget.date,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.88,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset('images/right.svg'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
