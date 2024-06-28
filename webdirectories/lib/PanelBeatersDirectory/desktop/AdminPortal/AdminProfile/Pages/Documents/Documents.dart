import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/Documents/Documentscomp/DocumentsContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/AddButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/CommonReuseable/IconSearchBoxB.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/InsertDocumentPopup/DocumentPopup.dart';
import 'package:webdirectories/myutility.dart';

class Documents extends StatefulWidget {
  const Documents({super.key});

  @override
  State<Documents> createState() => _DocumentsState();
}

class _DocumentsState extends State<Documents> {
  final List<Map<String, String>> registrationInfo = [
    {
      'title': 'Tata Approval',
      'category': 'OEM Approval Certificate',
      'subCategory': 'Tata Approval',
    },
    {
      'title': 'Tata Approval',
      'category': 'OEM Approval Certificate',
      'subCategory': 'Tata Approval',
    },
    {
      'title': 'Tata Approval',
      'category': 'OEM Approval Certificate',
      'subCategory': 'Tata Approval',
    },
    {
      'title': 'Tata Approval',
      'category': 'OEM Approval Certificate',
      'subCategory': 'Tata Approval',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MyUtility(context).width * 0.9,
          child: Column(
            children: [
              SizedBox(
                height: MyUtility(context).height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Documents',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.48,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconSearchBoxB(),
                  AddButton(
                    text: 'Insert Document',
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        barrierColor: Colors.black.withOpacity(0.5),
                        builder: (BuildContext context) {
                          return Dialog(
                            backgroundColor: Colors.transparent,
                            insetPadding: EdgeInsets.all(10),
                            child: DocumentPopup(),
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
                          width: MyUtility(context).width * 0.26,
                          child: Text(
                            'Title',
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
                          width: MyUtility(context).width * 0.26,
                          child: Text(
                            'Category',
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
                          width: MyUtility(context).width * 0.26,
                          child: Text(
                            'Sub Category',
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
              Expanded(
                child: ListView.builder(
                  itemCount: registrationInfo.length,
                  itemBuilder: (context, index) {
                    final registration = registrationInfo[index];
                    return DocumentsContainer(
                      title: registration['title']!,
                      category: registration['category']!,
                      subCategory: registration['subCategory']!,
                      pressEdit: () {},
                      PressDelete: () {},
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
