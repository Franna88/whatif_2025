import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/RegistrationNumbers/RegistrationNumbersComp/Registrationcontainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/AddButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/CommonReuseable/IconSearchBoxB.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/RegistrationPopup/RegistrationPopup.dart';
import 'package:webdirectories/myutility.dart';

class RegistrationNumbers extends StatefulWidget {
  const RegistrationNumbers({super.key});

  @override
  State<RegistrationNumbers> createState() => _RegistrationNumbersState();
}

class _RegistrationNumbersState extends State<RegistrationNumbers> {
  final List<Map<String, String>> registrationInfo = [
    {
      'registrationType': 'CRA Membership',
      'registrationNumber': '2068',
      'displayProfile': 'Yes',
    },
    {
      'registrationType': 'CRA Membership',
      'registrationNumber': '2068',
      'displayProfile': 'Yes',
    },
    {
      'registrationType': 'CRA Membership',
      'registrationNumber': '2068',
      'displayProfile': 'yes',
    },
    {
      'registrationType': 'CRA Membership',
      'registrationNumber': '2068',
      'displayProfile': 'yes',
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
                    'Registration Numbers',
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
                    text: 'Insert Record',
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        barrierColor: Colors.black.withOpacity(0.5),
                        builder: (BuildContext context) {
                          return Dialog(
                            backgroundColor: Colors.transparent,
                            insetPadding: EdgeInsets.all(10),
                            child: RegistrationPopup(),
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
                            'Registration Type',
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
                            'Registration Number',
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
                            'Display on Profile',
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
                    return RegistrationContainer(
                      registrationType: registration['registrationType']!,
                      registrationNumber: registration['registrationNumber']!,
                      displayProfile: registration['displayProfile']!,
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
