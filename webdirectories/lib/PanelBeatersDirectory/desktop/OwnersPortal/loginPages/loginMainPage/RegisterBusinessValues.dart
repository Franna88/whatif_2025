import 'package:flutter/material.dart';

class RegisterBusinessValues {
  late TextEditingController tradingName;
  late TextEditingController registeredBussinessName;
  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController phone;
  late TextEditingController email;
  late TextEditingController country;
  late TextEditingController suburb;
  late TextEditingController province;
  late TextEditingController streetAddress;
  late TextEditingController city;
  late TextEditingController postal;

  late TextEditingController ip;
  late TextEditingController date;

  RegisterBusinessValues() {
    tradingName = TextEditingController();
    registeredBussinessName = TextEditingController();
    firstName = TextEditingController();
    lastName = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();

    country = TextEditingController();
    suburb = TextEditingController();
    province = TextEditingController();
    streetAddress = TextEditingController();
    city = TextEditingController();
    postal = TextEditingController();

    ip = TextEditingController();
    date = TextEditingController();
  }

  void dispose() {
    tradingName.dispose();
    registeredBussinessName.dispose();
    firstName.dispose();
    lastName.dispose();
    phone.dispose();
    email.dispose();

    country.dispose();
    suburb.dispose();
    province.dispose();
    city.dispose();
    postal.dispose();

    ip.dispose();
    date.dispose();
  }

  void setValues(Map<String, dynamic> userData) {
    tradingName.text = userData['title'] ?? '';
    firstName.text = userData['firstName'] ?? '';
    lastName.text = userData['lastName'] ?? '';
    phone.text = userData['phone'] ?? '';
    email.text = userData['email'] ?? '';
  }

  getValues() {
    return {
      "title": tradingName.text,
    };
  }
}
