import 'package:flutter/material.dart';

class NotificationDelete extends StatefulWidget {
  final Color iconColor;
  const NotificationDelete({super.key, required this.iconColor});

  @override
  State<NotificationDelete> createState() => _NotificationDeleteState();
}

class _NotificationDeleteState extends State<NotificationDelete> {
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Delete',
      preferBelow: false,
      child: IconButton(
        onPressed: () {
          setState(() {});
        },
        icon: Icon(
          Icons.delete,
          color: widget.iconColor,
          size: 23.0,
        ),
        padding: EdgeInsets.all(0),
      ),
    );
  }
}
