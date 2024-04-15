import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class AiCoDriverButton extends StatefulWidget {
  final String image;
  final VoidCallback onpress;

  const AiCoDriverButton(
      {super.key, required this.image, required this.onpress});

  @override
  State<AiCoDriverButton> createState() => _AiCoDriverButtonState();
}

class _AiCoDriverButtonState extends State<AiCoDriverButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onpress,
      child: Image.asset(
        widget.image,
        width: MyUtility(context).width * 0.1,
        height: 40,
        fit: BoxFit.contain,
      ),
    );
  }
}
