import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AttachmentPopupButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const AttachmentPopupButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  State<AttachmentPopupButton> createState() => _AttachmentPopupButtonState();
}

class _AttachmentPopupButtonState extends State<AttachmentPopupButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, top: 5),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          decoration: ShapeDecoration(
            color: Color(0xFFEF9040),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                child: SvgPicture.asset('images/attachment.svg'),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Text(
                  widget.text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.32,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
