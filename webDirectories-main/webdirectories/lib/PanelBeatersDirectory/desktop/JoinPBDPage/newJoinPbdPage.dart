import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class NewJointPbdPage extends StatefulWidget {
  const NewJointPbdPage({super.key});

  @override
  State<NewJointPbdPage> createState() => _NewJointPbdPageState();
}

class _NewJointPbdPageState extends State<NewJointPbdPage> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Material(
      child: Container(
        height: MyUtility(context).height,
        width: MyUtility(context).width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/effortlessManagement.png'),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2),
              BlendMode.darken,
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50, top: 50),
                child: Image.asset(
                  'images/logoPanel.png',
                  height: 70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
