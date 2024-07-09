import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class YoutubeVideoBlock extends StatefulWidget {
  const YoutubeVideoBlock({super.key});

  @override
  State<YoutubeVideoBlock> createState() => _YoutubeVideoBlockState();
}

class _YoutubeVideoBlockState extends State<YoutubeVideoBlock> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Center(
      child: new ClipRect(
        child: new BackdropFilter(
          filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: new Container(
            width: widthDevice * 0.45,
            height: heightDevice * 0.65,
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.grey.shade200.withOpacity(0.3),
            ),
            child: Column(
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
