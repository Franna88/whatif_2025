import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/TeamProfile.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/AddButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/AddmemberPopup/AddmemberPopup.dart';
import 'package:webdirectories/myutility.dart';

class AddMember extends StatefulWidget {
  const AddMember({super.key});

  @override
  State<AddMember> createState() => _AddMemberState();
}

class _AddMemberState extends State<AddMember> {
  final List<Map<String, String>> teamProfiles = [
    {
      'image': 'images/employee.jpg',
      'name': 'Johan Pretorius',
      'position': 'Manager',
    },
    {
      'image': 'images/employee.jpg',
      'name': 'Jane Doe',
      'position': 'Developer',
    },
    {
      'image': 'images/employee.jpg',
      'name': 'John Smith',
      'position': 'Designer',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MyUtility(context).width,
        decoration: BoxDecoration(color: Color(0xFFF4F4F4)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MyUtility(context).width * 0.10,
                  ),
                  Text(
                    'Team',
                    style: TextStyle(
                      color: Color(0xFF0F253A),
                      fontSize: 20.4,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                  ),
                  AddButton(
                    text: 'Add Member',
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        barrierColor: Colors.black.withOpacity(0.5),
                        builder: (BuildContext context) {
                          return Dialog(
                            backgroundColor: Colors.transparent,
                            insetPadding: EdgeInsets.all(10),
                            child: AddMemberPopup(),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: teamProfiles.map((profile) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TeamProfile(
                        memberImage: profile['image']!,
                        memberName: profile['name']!,
                        memberPosition: profile['position']!,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, bottom: 30 ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: MyUtility(context).width ,
                    height: 1,
                    color: Color(0xFF0F253A),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
