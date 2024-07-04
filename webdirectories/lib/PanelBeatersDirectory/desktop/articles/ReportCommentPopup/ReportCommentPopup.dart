import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';

class ReportCommentPopup extends StatefulWidget {
  const ReportCommentPopup({super.key});

  @override
  State<ReportCommentPopup> createState() => _ReportCommentPopupState();
}

class _ReportCommentPopupState extends State<ReportCommentPopup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: Container(
          width: MyUtility(context).width * 0.38,
          height: MyUtility(context).height * 0.37,
          decoration: ShapeDecoration(
            color: Color(0xFFD9D9D9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Report Comment',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 34,
                  fontFamily: 'ralewaybold',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  'Thank you for creating a safe digital space. Your contribution will stay anonymous. You can report a post after selecting an option.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.64,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: [
                  'Nudity',
                  'Violence',
                  'Harassment',
                  'Suicide or Self-injury',
                  'Spam',
                  'Unauthorized Sales',
                  'Hate Speech',
                  'Terrorism',
                  'Something Else'
                ].map((label) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      label,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.6,
                        fontFamily: 'raleway',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Report Comment',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.64,
                    fontFamily: 'ralewaymedium',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
