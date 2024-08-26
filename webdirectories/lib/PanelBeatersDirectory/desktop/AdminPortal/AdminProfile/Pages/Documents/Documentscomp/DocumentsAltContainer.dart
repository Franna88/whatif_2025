import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/myutility.dart';

class DocumentAlitContainer extends StatelessWidget {
  final String title;
  final String category;
  final String subCategory;
  final VoidCallback pressEdit;
  final VoidCallback pressDelete;
  final bool isEven;

  const DocumentAlitContainer({
    super.key,
    required this.title,
    required this.category,
    required this.subCategory,
    required this.pressEdit,
    required this.pressDelete,
    required this.isEven,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isEven ? Color(0xFF0E1013) : Color(0x7F292E31),
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      alignment: Alignment.centerLeft,
      height: MyUtility(context).height * 0.065,
      child: Row(
        children: [
          // Title
          Expanded(
            flex: 2,
            child: Text(
              title,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.64,
                fontFamily: 'raleway',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          // Vertical Divider
          Container(
            width: 0.5,
            color: Colors.white,
          ),
          SizedBox(width: 10),
          // Category
          Expanded(
            flex: 2,
            child: Text(
              category,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.64,
                fontFamily: 'raleway',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          // Vertical Divider
          Container(
            width: 0.5,
            color: Colors.white,
          ),
          SizedBox(width: 10),
          // SubCategory
          Expanded(
            flex: 2,
            child: Text(
              subCategory,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.64,
                fontFamily: 'raleway',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          // Vertical Divider
          Container(
            width: 0.5,
            color: Colors.white,
          ),
          SizedBox(width: 10),
          // Edit/Delete Buttons
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: pressEdit,
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: pressDelete,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
