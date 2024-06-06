import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/widgets.dart';

class AboutUSTextContainer extends StatefulWidget {
  const AboutUSTextContainer({super.key});

  @override
  State<AboutUSTextContainer> createState() => _AboutUSTextContainerState();
}

class _AboutUSTextContainerState extends State<AboutUSTextContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 553.92,
      height: 487.2,
      decoration: ShapeDecoration(
        color: Color(0xFF181B1D),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  'About Us:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.4,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: 482.52,
                  child: Text(
                    'N4 Autocraft Panelbeaters was established in 1983 and is based in George, Western Cape. With our 38 years of experience, N4 Autocraft Panelbeaters is a trusted collision repair specialist, specializing in panel beating, spray painting, and major structural repairs. We provide a full-service offering to repair all motor vehicle types and are RMI and insurance approved. Throughout our history, a key aspect ofN4 Autocraft philosophy has been to acquire and maintain a reputation for high-quality customer service. Honesty, integrity, and quality are the 3 pillars on which the company is built and will remain the pillars as the company continues to grow.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.64,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
            DraggableScrollableActuator(
              child: Container(
                width: 21.76,
                height: 495.72,
                decoration: ShapeDecoration(
                  color: Color(0xFF565858),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(34.17),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                        width: 23.35,
                        height: 23.35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.keyboard_arrow_up,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 17,
                      height: 57.12,
                      decoration: ShapeDecoration(
                        color: Color(0x7FD9D9D9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                        width: 23.35,
                        height: 23.35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
