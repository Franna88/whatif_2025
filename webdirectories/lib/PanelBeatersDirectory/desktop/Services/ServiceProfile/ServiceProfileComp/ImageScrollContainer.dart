import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class ImageScrollContainer extends StatefulWidget {
  const ImageScrollContainer({Key? key}) : super(key: key);

  @override
  _ImageScrollContainerState createState() => _ImageScrollContainerState();
}

class _ImageScrollContainerState extends State<ImageScrollContainer> {
  int _currentPage = 0;
  final List<String> _imagePaths = [
    "images/imagescroll.png",
    "images/williespannal.png",
    "images/imagescroll.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.395,
      height: MyUtility(context).height * 0.565,
      decoration: ShapeDecoration(
        image: DecorationImage(
          image: AssetImage(_imagePaths[_currentPage]),
          fit: BoxFit.fill,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (_currentPage > 0) {
                        _currentPage--;
                      }
                    });
                  },
                  icon: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.8),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (_currentPage < _imagePaths.length - 1) {
                        _currentPage++;
                      }
                    });
                  },
                  icon: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.8),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.black,
                      ),
                    ),
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
