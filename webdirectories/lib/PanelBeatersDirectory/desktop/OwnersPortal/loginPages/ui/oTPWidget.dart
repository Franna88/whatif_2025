import 'package:flutter/material.dart';

class OTPWidget extends StatefulWidget {
  const OTPWidget({super.key});

  @override
  State<OTPWidget> createState() => _OTPWidgetState();
}

class _OTPWidgetState extends State<OTPWidget> {
  TextEditingController text1 = TextEditingController();
  TextEditingController text2 = TextEditingController();
  TextEditingController text3 = TextEditingController();
  TextEditingController text4 = TextEditingController();
  TextEditingController text5 = TextEditingController();
  TextEditingController text6 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        myInputBox(context, text1),
        SizedBox(width: 15,),
        myInputBox(context, text2),
        SizedBox(width: 15,),
        myInputBox(context, text3),
        SizedBox(width: 15,),
        myInputBox(context, text4),
        SizedBox(width: 15,),
        myInputBox(context, text5),
        SizedBox(width: 15,),
        myInputBox(context, text6),
      ],
    );
  }
}

Widget myInputBox(BuildContext context, TextEditingController controller) {
  var widthDevice = MediaQuery.of(context).size.width;
  return Container(
    height: widthDevice <1500 ? 60 : 70,
    width: widthDevice <1500 ? 50 : 60,
    decoration: ShapeDecoration(
      color: Color(0xFFD9D9D9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    child: Center(
      child: TextField(
        cursorColor: Colors.black,
        cursorHeight: widthDevice <1500 ? 25 : 30,
        //showCursor: false,
        controller: controller,
        keyboardType: TextInputType.number,
        style: TextStyle(
                  color:  Colors.black,
                  fontSize: widthDevice <1500 ? 25 : 30,
                  fontFamily: 'raleway',
                  
                ),
        
        maxLength: 1,
        decoration: InputDecoration(
          
          border: InputBorder.none,
          counterText: '',
          contentPadding: EdgeInsets.only(left: 20)
        ),
        
        onChanged: (value) {
          if (value.length ==1){
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    ),
  );
}
