import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DasboardComp/Notifications.dart';

class Notificationscontainer extends StatefulWidget {
  const Notificationscontainer({super.key});

  @override
  State<Notificationscontainer> createState() => _NotificationscontainerState();
}

class _NotificationscontainerState extends State<Notificationscontainer> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Container(
      width: widthDevice < 1500 ? 516.12 : widthDevice * 0.33,
      height: widthDevice < 1500 ?  314.84 : heightDevice * 0.35,
      
      decoration: ShapeDecoration(
        color:  Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  'Notification',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: widthDevice < 1500 ?  13.6 : 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 8),
                child: Text(
                  'Overview of latest Notification',
                  style: TextStyle(
                    color: Color(0xFFAEAEAE),
                    fontSize: widthDevice < 1500 ?  10.88 : 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  width: widthDevice,
                  height: 40.8,
                  decoration: ShapeDecoration(
                    color: Color(0xFF00437B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 32, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Notification Title',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: widthDevice < 1500 ?  10.88 : 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'Read\nMore',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: widthDevice < 1500 ?  10.88 : 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Notifications(
                  notification:
                      'Festive Season Greetings from the Panel Beater Directory!',
                  date: '2024/02/02'),
              Notifications(
                  notification:
                      'Festive Season Greetings from the Panel Beater Directory!',
                  date: '2024/02/02'),
              Notifications(
                  notification:
                      'Festive Season Greetings from the Panel Beater Directory!',
                  date: '2024/02/02')
            ],
          ),
        ),
      ),
    );
  }
}
