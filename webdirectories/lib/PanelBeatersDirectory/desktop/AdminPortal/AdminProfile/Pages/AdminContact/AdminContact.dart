import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/AdminContact/AdminContactComp/AdminContactContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/AddButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/CommonReuseable/IconSearchBoxB.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/ContactPopup/ContactPopup.dart';
import 'package:webdirectories/myutility.dart';

class AdminContact extends StatefulWidget {
  const AdminContact({super.key});

  @override
  State<AdminContact> createState() => _AdminContactState();
}

class _AdminContactState extends State<AdminContact> {
  final List<Map<String, String>> registrationInfo = [
    {
      'type': 'Administrator',
      'contactPerson': 'Samantha Sheingold',
      'phone': '0123464690',
      'email': 'samantha@webdirectories.co.za',
    },
    {
      'type': 'Administrator',
      'contactPerson': 'Samantha Sheingold',
      'phone': '0123464690',
      'email': 'samantha@webdirectories.co.za',
    },
    {
      'type': 'Administrator',
      'contactPerson': 'Samantha Sheingold',
      'phone': '0123464690',
      'email': 'samantha@webdirectories.co.za',
    },
    {
      'type': 'Administrator',
      'contactPerson': 'Samantha Sheingold',
      'phone': '0123464690',
      'email': 'samantha@webdirectories.co.za',
    },
  ];
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return 
       Column(crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           SizedBox(
             height: MyUtility(context).height * 0.05,
           ),
           Text(
             'Contacts',
             style: TextStyle(
               color: Colors.black,
               fontSize: 24.48,
               fontFamily: 'Inter',
               fontWeight: FontWeight.w400,
             ),
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               IconSearchBoxB(),
               AddButton(
                 text: 'Insert Contact',
                 onPressed: () {
                   showDialog(
                     context: context,
                     barrierDismissible: true,
                     barrierColor: Colors.black.withOpacity(0.5),
                     builder: (BuildContext context) {
                       return Dialog(
                         backgroundColor: Colors.transparent,
                         insetPadding: EdgeInsets.all(10),
                         child: ContactPopup(),
                       );
                     },
                   );
                 },
               ),
             ],
           ),
           Padding(
             padding: const EdgeInsets.only(top: 20, bottom: 15),
             child: Container(
               width: MyUtility(context).width * 0.9,
               height: MyUtility(context).height * 0.065,
               decoration: ShapeDecoration(
                 color: Color(0xFF0F253A),
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(10),
                 ),
               ),
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Row(
                   children: [
                     SizedBox(
                       width: MyUtility(context).width * 0.195,
                       child: Text(
                         'Type',
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 17.68,
                           fontFamily: 'Inter',
                           fontWeight: FontWeight.w700,
                           height: 0,
                         ),
                       ),
                     ),
                     SizedBox(
                       width: MyUtility(context).width * 0.195,
                       child: Text(
                         'Contact Person',
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 17.68,
                           fontFamily: 'Inter',
                           fontWeight: FontWeight.w700,
                           height: 0,
                         ),
                       ),
                     ),
                     SizedBox(
                       width: MyUtility(context).width * 0.195,
                       child: Text(
                         'Phone',
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 17.68,
                           fontFamily: 'Inter',
                           fontWeight: FontWeight.w700,
                           height: 0,
                         ),
                       ),
                     ),
                     SizedBox(
                       width: MyUtility(context).width * 0.195,
                       child: Text(
                         'Email',
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 17.68,
                           fontFamily: 'Inter',
                           fontWeight: FontWeight.w700,
                           height: 0,
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
             ),
           ),
           SizedBox(
            height: heightDevice,
             child: ListView.builder(
               itemCount: registrationInfo.length,
               itemBuilder: (context, index) {
                 final registration = registrationInfo[index];
                 return AdminContactContainer(
                   type: registration['type']!,
                   contactPerson: registration['contactPerson']!,
                   phone: registration['phone']!,
                   email: registration['email']!,
                   pressEdit: () {},
                   PressDelete: () {},
                 );
               },
             ),
           ),
         ],
       );
  }
}
