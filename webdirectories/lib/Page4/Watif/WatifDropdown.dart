import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class WatifDropdown extends StatefulWidget {
  final String dropdownText;
  final String dropdownContent;

  const WatifDropdown({
    Key? key,
    required this.dropdownText,
    required this.dropdownContent,
  }) : super(key: key);

  @override
  _WatifDropdownState createState() => _WatifDropdownState();
}

class _WatifDropdownState extends State<WatifDropdown> {
  bool isDropdownOpen = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isDropdownOpen = !isDropdownOpen;
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.22,
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
                        style: TextStyle(color: Colors.white),
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
              SizedBox(
                width: MyUtility(context).width * 0.2,
              )
            ],
          ),
          if (isDropdownOpen) ...[
            SizedBox(height: 8),
            Container(
              width: MyUtility(context).width * 0.4,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
