import 'package:flutter/material.dart';

class CustomMenuScrollDropdown extends StatefulWidget {
  final void Function(String)? onSelection; // Callback for selection
  final List<Map<String, dynamic>> dropdownItems;
  const CustomMenuScrollDropdown(
      {Key? key, this.onSelection, required this.dropdownItems})
      : super(key: key);

  @override
  _CustomMenuScrollDropdownState createState() =>
      _CustomMenuScrollDropdownState();
}

class _CustomMenuScrollDropdownState extends State<CustomMenuScrollDropdown> {
  String? selectedValue; // Holds the current selection
  final List<String> options = [
    "Air Conditioning Repair",
    "Airbag Repair",
    "All Vehicles Outside Factory Warranty",
    "Assessments"
  ]; // Dropdown items

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.grey[800], // Dropdown background color
              borderRadius: BorderRadius.circular(12.0), // Rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedValue,
                hint: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.white),
                    const SizedBox(width: 10),
                    const Text(
                      "Select",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                dropdownColor: Colors.grey[700], // Dropdown list background
                icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                items: widget.dropdownItems.map((Map<String, dynamic> item) {
                  String option = item['name'];
                  String value = item['value'];
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      option,
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                  if (widget.onSelection != null && value != null) {
                    widget.onSelection!(value); // Notify parent of selection
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// void main() => runApp(MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.grey[900],
//         body: CustomMenuScrollDropdown(),
//       ),
//     ));
