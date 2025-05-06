import 'package:flutter/material.dart';
import 'package:webdirectories/Watif/WatifLoginPages/watif_login.dart';
import 'package:webdirectories/Watif/WatifLoginPages/watif_forgot_password.dart';
import 'package:webdirectories/Watif/WatifLoginPages/watif_loading.dart';
import 'package:webdirectories/Watif/WatifRegisterPages/watif_register_email.dart';

enum LoginScreens {
  login,
  forgotPassword,
  loading,
  register,
}

class WatifLoginWrapper extends StatefulWidget {
  final LoginScreens initialScreen;

  const WatifLoginWrapper({
    Key? key,
    this.initialScreen = LoginScreens.login,
  }) : super(key: key);

  @override
  State<WatifLoginWrapper> createState() => _WatifLoginWrapperState();
}

class _WatifLoginWrapperState extends State<WatifLoginWrapper> {
  late LoginScreens _currentScreen;

  @override
  void initState() {
    super.initState();
    _currentScreen = widget.initialScreen;
  }

  void _navigateTo(LoginScreens screen) {
    setState(() {
      _currentScreen = screen;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_currentScreen) {
      case LoginScreens.login:
        return WatifLogin(
          onForgotPassword: () => _navigateTo(LoginScreens.forgotPassword),
          onRegister: () => _navigateTo(LoginScreens.register),
        );
      case LoginScreens.forgotPassword:
        return WatifForgotPassword(
          onBackToLogin: () => _navigateTo(LoginScreens.login),
        );
      case LoginScreens.loading:
        return const WatifLoading();
      case LoginScreens.register:
        return const WatifRegisterEmail();
    }
  }
}
