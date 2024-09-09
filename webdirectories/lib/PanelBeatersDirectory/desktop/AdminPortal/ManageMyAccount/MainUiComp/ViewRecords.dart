import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/ManageMyAccount/ManageComponents/AccountDatePicker.dart';
import 'package:webdirectories/myutility.dart';

import '../ManageComponents/AccountLongTextField.dart';

class ViewRecords extends StatefulWidget {
  const ViewRecords({super.key});

  @override
  State<ViewRecords> createState() => _ViewRecordsState();
}

class _ViewRecordsState extends State<ViewRecords> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MyUtility(context).height * 0.42,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white,
            width: 0.5,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'View Records',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.6064,
              fontFamily: 'ralewaybold',
            ),
          ),
          Text(
            'View and download your payment history and invoices',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.73,
              fontFamily: 'raleway',
            ),
          ),
          AccountLongTextField(
              descriptionText: 'Panel Beater Directory Membership Number',
              length: 0.37),
          AccountDatePicker(
            descriptionText: 'Invoices',
            length: 0.8,
            hintText: 'Please select date to view or download your invoices',
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: AccountDatePicker(
              descriptionText: 'Statements',
              length: 0.8,
              hintText:
                  'Please select date to view or download your statements',
            ),
          )
        ],
      ),
    );
  }
}
