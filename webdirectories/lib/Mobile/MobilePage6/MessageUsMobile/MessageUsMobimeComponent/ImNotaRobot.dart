import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class NotARobotContainer extends StatefulWidget {
  const NotARobotContainer({Key? key}) : super(key: key);

  @override
  _NotARobotContainerState createState() => _NotARobotContainerState();
}

class _NotARobotContainerState extends State<NotARobotContainer> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width / 1.3,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(
                value: _isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    _isChecked = value ?? false;
                  });
                },
              ),
              Text(
                "I'm not a robot",
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ],
          ),
          Image.asset(
            'images/notarobot.png',
            width: 80.0,
            height: 40.0,
          ),
        ],
      ),
    );
  }
}
