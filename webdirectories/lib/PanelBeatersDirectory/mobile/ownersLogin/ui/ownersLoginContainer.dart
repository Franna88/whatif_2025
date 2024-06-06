import 'dart:ui';

import 'package:flutter/material.dart';

class OwnersLoginContainer extends StatefulWidget {
  Widget child;
  OwnersLoginContainer({super.key, required this.child});

  @override
  State<OwnersLoginContainer> createState() => _OwnersLoginContainerState();
}

class _OwnersLoginContainerState extends State<OwnersLoginContainer> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Stack(children: <Widget>[
      Center(
        child: new ClipRect(
          child: new BackdropFilter(
            filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: new Container(
              width: widthDevice * 0.85,
              height: heightDevice * 0.60,
              
              
              
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.grey.shade200.withOpacity(0.3)),
              child: new Center(child: widget.child),
            ),
          ),
        ),
      ),
    ]);
  }
}