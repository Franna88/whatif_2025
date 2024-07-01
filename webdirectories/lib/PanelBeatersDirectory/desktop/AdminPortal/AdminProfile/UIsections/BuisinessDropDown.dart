import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/ProfileDropDown.dart';
import 'package:webdirectories/myutility.dart';

class BusinessDropDown extends StatefulWidget {
  const BusinessDropDown({super.key});

  @override
  State<BusinessDropDown> createState() => _BusinessDropDownState();
}

class _BusinessDropDownState extends State<BusinessDropDown> {
  String? dropdownValue;
  List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Text(
            'Approvals',
            style: TextStyle(
              color: Color(0xFF0F253A),
              fontSize: 20.4,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(
          width: MyUtility(context).width * 0.75,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProfileDropDown(
                headline: 'Select a Category',
                items: items,
                value: dropdownValue,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
              ),
              ProfileDropDown(
                headline: 'Specialist Service',
                items: items,
                value: dropdownValue,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: MyUtility(context).width * 0.775,
                height: 1,
                decoration: BoxDecoration(color: Color(0xFF0F253A)),
              )
            ],
          ),
        ),
      ],
    );
  }
}
