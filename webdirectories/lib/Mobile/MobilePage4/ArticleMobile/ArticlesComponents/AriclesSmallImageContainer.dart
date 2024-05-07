import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class ArticlesSmallImageContainer extends StatefulWidget {
  final String image;
  final String catagory;
  final String headline;
  final String writer;
  final String discription;
  final VoidCallback onpress;

  const ArticlesSmallImageContainer(
      {super.key,
      required this.image,
      required this.catagory,
      required this.headline,
      required this.writer,
      required this.discription,
      required this.onpress});

  @override
  State<ArticlesSmallImageContainer> createState() =>
      _ArticlesSmallImageContainerState();
}

class _ArticlesSmallImageContainerState
    extends State<ArticlesSmallImageContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MyUtility(context).height * 0.02,
        ),
        Container(
          width: MyUtility(context).width / 1.1,
          height: 285,
          decoration: BoxDecoration(
            color: Color(0xFFF4F4F4),
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MyUtility(context).width * 0.3,
                height: MyUtility(context).height * 0.125,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    widget.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: MyUtility(context).width / 1.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.catagory,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'ralewaybold',
                        color: Color(0xFF65DAFF),
                      ),
                    ),
                    Text(
                      widget.headline,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'ralewaybold',
                          color: Colors.black),
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 13.0,
                          color: Color(0xFF616161),
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'By ',
                            style: TextStyle(
                              fontFamily: 'ralewaybold',
                            ),
                          ),
                          TextSpan(
                            text: widget.writer,
                            style: TextStyle(
                              fontFamily: 'raleway',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      widget.discription,
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'raleway',
                          color: Colors.black),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: widget.onpress,
                        icon: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                          padding: EdgeInsets.all(4),
                          child: Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: MyUtility(context).height * 0.02,
        )
      ],
    );
  }
}
