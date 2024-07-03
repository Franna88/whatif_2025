import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/myutility.dart';

class ProfileDropDown extends StatefulWidget {
  final List<String> items;
  final String? value;
  final String headline;
  final Function(String?) onChanged;

  const ProfileDropDown({
    super.key,
    required this.headline,
    required this.items,
    required this.value,
    required this.onChanged,
  });

  @override
  State<ProfileDropDown> createState() => _ProfileDropDownState();
}

class _ProfileDropDownState extends State<ProfileDropDown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.headline,
          style: TextStyle(
            color: Color(0xFF0F253A),
            fontSize: 20.4,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            height: 1,
          ),
        ),
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Container(
            width: MyUtility(context).width * 0.32,
            height: MyUtility(context).height * 0.075,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Center(
              child: DropdownButtonFormField<String>(
                iconSize: 50,
                icon: Icon(Icons.keyboard_arrow_down, color: Color(0xFF0F253A),) ,
                value: widget.value,
                onChanged: widget.onChanged,
                items: widget.items.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Row(
                      children: [
                        Text(
                          item,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  );
                }).toList(),
               decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20, 15, 15, 15),
                  border: InputBorder.none,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
