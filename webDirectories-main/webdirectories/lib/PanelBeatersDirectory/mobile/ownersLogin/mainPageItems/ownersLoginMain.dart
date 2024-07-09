import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/dividers.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/FooterMobile/PanFooterMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/MobileTopNavBar/MobileTopNavBarhome.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ownersLogin/ui/longOrangeMobileButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ownersLogin/ui/mobileTextFields.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ownersLogin/ui/ownersLoginContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ownersLogin/ui/passwordTextFieldMobile.dart';
import 'package:webdirectories/myutility.dart';

class OwnersloginMain extends StatelessWidget {
  const OwnersloginMain({super.key});

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: heightDevice,
              width: widthDevice,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/effortlessManagement.png'),
                    fit: BoxFit.cover),
              ),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MobileTopNavBarhome(),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'Effortless Management',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 54.4,
                            fontFamily: 'ralewaybold',
                            height: 0.96),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: heightDevice * 0.01,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                      child: Text(
                        'More time for repairs, less time on admin. Customize and manage your online profile anytime, anywhere!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.64,
                          fontFamily: 'raleway',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: heightDevice * 0.02,
                    ),
                    OwnersLoginContainer(
                      child: Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MyUtility(context).width * 0.75,
                                height: MyUtility(context).height * 0.2,
                                child: Image.asset("images/OpLogin.png"),
                              ),
                              Text(
                                'Owners Portal Login',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 34,
                                  fontFamily: 'ralewaybold',
                                  height: 1,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              MobileTextFields(
                                  hintText: 'e.g., admin@actionpanel.co.za',
                                  keyText: 'Email',
                                  widthContainer: widthDevice * 0.70),
                              const SizedBox(
                                height: 15,
                              ),
                              PasswordTextFieldMobile(
                                  hintText: 'Enter Password',
                                  keyText: 'Password',
                                  widthContainer: widthDevice * 0.70),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    'Forgot Password ?',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Color(0xFFEF9040),
                                      fontSize: 14,
                                      fontFamily: 'raleway',
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              LongOrangeMobileButton(
                                  onPressed: () {},
                                  buttonText: 'Login',
                                  widthButton: widthDevice * 0.70),
                              const SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Dividers(),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 5),
                                    child: Text(
                                      'or',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.64,
                                        fontFamily: 'raleway',
                                      ),
                                    ),
                                  ),
                                  Dividers()
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image:
                                                AssetImage('images/googleicon.png'))),
                                  ),
                                  Text(
                                    'Sign in with Google',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.64,
                                      fontFamily: 'raleway',
            
                                      //height: 0.05,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Not Registered Yet? ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'raleway',
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      //ADD LOGIC HERE
                                    },
                                    child: Text(
                                      'Click here',
                                      style: TextStyle(
                                        color: Color(0xFFEF9040),
                                        fontSize: 14,
                                        fontFamily: 'ralewaymedium',
                                        decoration: TextDecoration.underline,
                                        decorationColor: Color(0xFFEF9040),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            PanFooterMobile()
          ],
        ),
      ),
    );
  }
}
