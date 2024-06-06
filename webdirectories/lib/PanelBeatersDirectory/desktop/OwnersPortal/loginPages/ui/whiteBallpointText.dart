import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WhiteBallpointText extends StatelessWidget {
  String ballText;
  WhiteBallpointText({super.key, required this.ballText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: SizedBox(
        width: 720,
        child: Row(mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5,left: 12),
                    child: Icon(
                      Icons.circle,
                      color: Colors.white,
                      size: 5,
                    ),
                  ),
                  const SizedBox(width: 5,),
                  Text(
                    ballText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'raleway',
                      
                      height: 1
                    ),
                  ),
                  
                ],
              ),
      ),
    );
  }
}