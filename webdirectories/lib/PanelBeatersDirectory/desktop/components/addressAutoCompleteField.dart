import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:webdirectories/myutility.dart';

const kGoogleApiKey = "AIzaSyBFFemx-2r0ZkP7T05pJo2nIjV_RB9R_VE";

class AddressAutoCompleteField extends StatefulWidget {
  const AddressAutoCompleteField({super.key});

  @override
  State<AddressAutoCompleteField> createState() =>
      _AddressAutoCompleteFieldState();
}

class _AddressAutoCompleteFieldState extends State<AddressAutoCompleteField> {
  final _addressController = TextEditingController();
  var uuid = new Uuid();
  String _sessionToken = '';
  List<dynamic> _placeList = [];

  @override
  void initState() {
    super.initState();
  }

  _onChanged() {
    try {
      if (_sessionToken == '') {
        setState(() {
          _sessionToken = uuid.v4();
        });
      }
      getSuggestion(_addressController.text);
    } catch (e) {
      print('error: $e');
    }
  }

  void getSuggestion(String input) async {
    try {
      print('input: $input');
      Map<String, String>? header = {
        'Access-Control-Allow-Origin': '*', // Required for CORS support to work
        "Access-Control-Allow-Credentials":
            "true", // Required for cookies, authorization headers with HTTPS
        "Access-Control-Allow-Headers":
            "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
        "Access-Control-Allow-Methods": "GET,POST, OPTIONS"
      };
      String kPLACES_API_KEY = "AIzaSyDrcaRErNxL1GhUvMj4Cx6f0r9eKDwCgko";
      String type = '(regions)';
      String baseURL =
          'https://cors-anywhere.herokuapp.com/https://maps.googleapis.com/maps/api/place/autocomplete/json';
      String request =
          '$baseURL?input=$input&key=$kPLACES_API_KEY&sessiontoken=$_sessionToken';
      var response = await http.get(Uri.parse(request), headers: header);
      if (response.statusCode == 200) {
        setState(() {
          _placeList = json.decode(response.body)['predictions'];
        });
      } else {
        throw Exception('Failed to load predictions');
      }
    } catch (e) {
      print('error getting suggestions: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: MyUtility(context).width * 0.2,
              height: 38,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 247, 246, 246),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.zero,
                      child: Icon(
                        Icons.keyboard_arrow_right_outlined,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      onChanged: (value) => _onChanged(),
                      controller: _addressController,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: 'Search your address',
                        hintStyle: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'ralewaysemi',
                          color: Color.fromARGB(255, 51, 51, 51),
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.transparent,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _placeList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_placeList[index]["description"]),
              );
            },
          )
        ],
      ),
    );
  }
}
