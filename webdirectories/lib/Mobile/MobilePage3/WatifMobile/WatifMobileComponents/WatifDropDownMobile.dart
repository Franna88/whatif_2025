import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class WatifDropDownMobile extends StatefulWidget {
  final String dropdownText;
  final String dropdownContent;

  const WatifDropDownMobile({
    Key? key,
    required this.dropdownText,
    required this.dropdownContent,
  }) : super(key: key);

  @override
  _WatifDropDownMobileState createState() => _WatifDropDownMobileState();
}

class _WatifDropDownMobileState extends State<WatifDropDownMobile> {
  bool isDropdownOpen = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isDropdownOpen = !isDropdownOpen;
                  });
                },
                child: SizedBox(
                  width: MyUtility(context).width / 1.2,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.dropdownText,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'raleway',
                              fontSize: 16),
                        ),
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Icon(
                            isDropdownOpen
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (isDropdownOpen) ...[
            SizedBox(height: 8),
            Container(
              width: MyUtility(context).width / 1.1,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      widget.dropdownContent,
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'raleway',
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
