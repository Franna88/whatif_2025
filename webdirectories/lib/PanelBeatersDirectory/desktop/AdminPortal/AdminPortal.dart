import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/SideNavBar/SideNavBar.dart';

class AdminPortal extends StatefulWidget {
  bool normalUser;
  AdminPortal({super.key, required this.normalUser});

  @override
  State<AdminPortal> createState() => _AdminPortalState();
}

class _AdminPortalState extends State<AdminPortal> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SideNavBar(normalUser: widget.normalUser),
    );
  }
}
