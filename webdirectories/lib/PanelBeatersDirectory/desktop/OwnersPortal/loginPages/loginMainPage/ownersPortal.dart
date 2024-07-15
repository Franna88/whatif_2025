import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Footer/panelFooter.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/loginPageItems/EnterVerificationCode.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/loginPageItems/agreement.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/loginPageItems/completeAgreement.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/loginPageItems/createProfile.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/loginPageItems/membershipOptions.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/loginPageItems/ownersPortalLogin.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/loginPageItems/registerYourBusiness.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/loginPageItems/whatsNext.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/glassContainer.dart';
import 'package:webdirectories/myutility.dart';

class OwnersPortal extends StatefulWidget {
  const OwnersPortal({super.key});

  @override
  State<OwnersPortal> createState() => _OwnersPortalState();
}

class _OwnersPortalState extends State<OwnersPortal> {
  var pageIndex = 0;

  //Update pageIndex value
  changePageIndex() {
    setState(() {
      pageIndex = pageIndex + 1;
    });
  }

  //Open popup register
  Future openAgreementPopup() => showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            child: Agreement(closeDialog: () => Navigator.pop(context)));
      });

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;

    var pages = [
      OwnersPortalLogin(changePageIndex: changePageIndex),
      RegisterYourBusiness(changePageIndex: changePageIndex),
      EnterVerificationCode(changePageIndex: changePageIndex),
      CreateProfile(changePageIndex: changePageIndex),
      MembershipOptions(changePageIndex: changePageIndex),
      CompleteAgreement(
          openAgreementPopup: openAgreementPopup,
          changePageIndex: changePageIndex),
      WhatsNext()
    ];
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: widthDevice,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/effortlessManagement.png'),
                    fit: BoxFit.fill),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 50, top: 15), // Halved the top padding
                    child: Image.asset(
                      'images/logoPanel.png',
                      height: 70,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: heightDevice / 1.3,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Effortless \nManagement',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: widthDevice / 20,
                                    fontFamily: 'ralewaybold',
                                    height: 1),
                              ),
                              Text(
                                '\nMore time for repairs, less time on admin. Customize and \nmanage your online profile anytime, anywhere!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: widthDevice / 80,
                                  fontFamily: 'raleway',
                                  fontWeight: FontWeight.w400,
                                  height: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: widthDevice * 0.15),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: widthDevice < 1500
                                  ? heightDevice * 0.015 // Halved the height
                                  : heightDevice * 0.05), // Halved the height
                          GlassContainer(child: pages[pageIndex]
                              //MembershipOptions()
                              ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height:
                        MyUtility(context).height * 0.05, // Halved the height
                  )
                ],
              ),
            ),
            PanelFooter()
          ],
        ),
      ),
    );
  }
}
