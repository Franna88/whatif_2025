import 'package:flutter/material.dart';
import 'package:flutter_google_places_web/flutter_google_places_web.dart';

const kGoogleApiKey = "AIzaSyBFFemx-2r0ZkP7T05pJo2nIjV_RB9R_VE";

class AddressAutoCompleteField extends StatelessWidget {
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FlutterGooglePlacesWeb(
        apiKey: kGoogleApiKey,
        proxyURL: 'https://cors-anywhere.herokuapp.com/',
        required: true,
      ),
    );
  }
}
