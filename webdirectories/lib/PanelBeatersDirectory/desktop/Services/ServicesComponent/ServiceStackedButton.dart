import 'package:flutter/material.dart';

class ServicesStackedButton extends StatefulWidget {
  final VoidCallback showFeatured;
  final VoidCallback showOther;
  final bool isComingSoon;
  final bool isFeaturedSelected;

  const ServicesStackedButton({
    Key? key,
    required this.showFeatured,
    required this.showOther,
    this.isComingSoon = false,
    required this.isFeaturedSelected,
  }) : super(key: key);

  @override
  _ServicesStackedButtonState createState() => _ServicesStackedButtonState();
}

class _ServicesStackedButtonState extends State<ServicesStackedButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.isComingSoon
          ? SystemMouseCursors.forbidden
          : SystemMouseCursors.click,
      onEnter: (_) {
        if (widget.isComingSoon) {
          setState(() {
            isHovered = true;
          });
        }
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: Stack(
        children: [
          SizedBox(
            width: 300,
            height: 50,
            child: Stack(
              children: [
                // "Other" button
                Positioned(
                  top: 15,
                  left: 110,
                  child: ElevatedButton(
                    onPressed: widget.isComingSoon
                        ? null
                        : () {
                            widget.showOther();
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: widget.isFeaturedSelected
                          ? Colors.black
                          : const Color(0xFFFF8728),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      fixedSize: const Size(126, 40),
                    ),
                    child: Text(
                      'Other',
                      style: TextStyle(
                        color: widget.isFeaturedSelected
                            ? Colors.white
                            : Colors.black,
                        fontSize: 20.4,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w400,
                        height: 1.0,
                      ),
                    ),
                  ),
                ),
                // "Featured" button
                Positioned(
                  top: 15,
                  left: 0,
                  child: ElevatedButton(
                    onPressed: widget.isComingSoon
                        ? null
                        : () {
                            widget.showFeatured();
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: widget.isFeaturedSelected
                          ? const Color(0xFFFF8728)
                          : Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      fixedSize: const Size(140, 40),
                    ),
                    child: Text(
                      'Featured',
                      style: TextStyle(
                        color: widget.isFeaturedSelected
                            ? Colors.black
                            : Colors.white,
                        fontSize: 20.4,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w400,
                        height: 1.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Tooltip for "Coming Soon"
          if (isHovered && widget.isComingSoon)
            Positioned(
              top: 0,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(
                    "Coming Soon",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontFamily: 'Raleway',
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
