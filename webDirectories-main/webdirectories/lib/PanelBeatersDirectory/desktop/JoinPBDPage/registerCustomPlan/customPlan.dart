import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/customplanItems/BusinessOperations.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/customplanItems/ClientManagement.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/customplanItems/advancedFeatures.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/customplanItems/clientCommunication.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/customplanItems/letsFindYourCustomPlan.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/customplanItems/onlinePresence.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/customplanItems/weAreDone.dart';

class CustomPlans extends StatefulWidget {
  Function closeDialog;
  CustomPlans({super.key, required this.closeDialog});

  @override
  State<CustomPlans> createState() => _CustomPlansState();
}

class _CustomPlansState extends State<CustomPlans> {
  //var
  int pageIndex = 0;

//changePageIndex
  updateIndex(value) {
    setState(() {
      if (value == "+") {
        pageIndex = pageIndex + 1;
      } else {
        pageIndex = pageIndex - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var pages = [
      LetsFindYourCustomPlan(
          closeDialog: widget.closeDialog, updateIndex: updateIndex),
      ClientCommunication(
          closeDialog: widget.closeDialog, updateIndex: updateIndex),
      OnlinePresence(closeDialog: widget.closeDialog, updateIndex: updateIndex),
      BusinessOperations(
          closeDialog: widget.closeDialog, updateIndex: updateIndex),
      ClientManagement(
          closeDialog: widget.closeDialog, updateIndex: updateIndex),
      AdvancedFeatures(
          closeDialog: widget.closeDialog, updateIndex: updateIndex),
      WeAreDone(closeDialog: widget.closeDialog, updateIndex: updateIndex),
    ];
    return Container(
      width: 650,
      height: 630,
      child: Center(
        child: pages[pageIndex],
      ),
    );
  }
}
