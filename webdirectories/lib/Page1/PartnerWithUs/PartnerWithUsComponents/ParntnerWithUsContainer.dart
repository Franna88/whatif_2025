import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PartnerWithUsContainer extends StatefulWidget {
  final String icon;
  final String header;
  final String paragraph;

  const PartnerWithUsContainer(
      {super.key,
      required this.icon,
      required this.header,
      required this.paragraph});

  @override
  State<PartnerWithUsContainer> createState() => _PartnerWithUsContainerState();
}

class _PartnerWithUsContainerState extends State<PartnerWithUsContainer> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 4.2,
        height: MediaQuery.of(context).size.height / 2.8,
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Color(0xFFF1F3F4),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? Colors.white : Colors.black,
                ),
                child: Center(
                  child: ColorFiltered(
                    colorFilter: isSelected
                        ? ColorFilter.mode(
                            Colors.black,
                            BlendMode.srcATop,
                          )
                        : ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcATop,
                          ),
                    child: SvgPicture.asset(
                      widget.icon,
                      width: 60,
                      height: 60,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                widget.header,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : Colors.black,
                  fontFamily: 'ralewaybold',
                ),
              ),
              SizedBox(height: 4),
              Text(
                widget.paragraph,
                style: TextStyle(
                  fontSize: 14,
                  color: isSelected ? Colors.white : Colors.black,
                  fontFamily: 'raleway',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
