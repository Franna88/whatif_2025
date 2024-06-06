import 'package:flutter/material.dart';

class MobileToggleSwitch extends StatefulWidget {
  const MobileToggleSwitch({super.key});

  @override
  State<MobileToggleSwitch> createState() => _MobileToggleSwitchState();
}

//TODO FIX ICON ISSUE
class _MobileToggleSwitchState extends State<MobileToggleSwitch> {
  //switch button
  toggleButton() {
    setState(() {
      toggleValue = !toggleValue;
    });
  }

  bool toggleValue = false;

  @override
  Widget build(BuildContext context) {
    return /*GestureDetector(
      onTap: (){toggleButton();},
      child: Container(
        height: 20,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: toggleValue ? Colors.orange : Colors.white,
        ),
        child: AnimatedPositioned(
          width: 10,
          height: 18,
          duration: Duration(milliseconds: 1000),
          curve: Curves.easeIn,
         // top: 3.0,
          left: toggleValue ? 40.0 : 0.0,
          //right: toggleValue ? 0.0 : 40.0,
          child: InkWell(
            onTap: (){toggleButton();} ,
            
              child: toggleValue
                  ? Icon(
                      Icons.circle,
                      color: Colors.white,
                      size: 18,
                      key: UniqueKey(),
                    )
                  : Icon(
                      Icons.circle,
                      color: Colors.black,
                      size: 18,
                      key: UniqueKey(),
                    ),
            ),
          ),
        )
      
    );
*/
    Stack(
      children: <Widget>[
        AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          height: 20,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: toggleValue ? Colors.orange : Colors.white,
          ),
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 1000),
          curve: Curves.easeIn,
          top: 3.0,
          left: toggleValue ? 40.0 : 0.0,
          right: toggleValue ? 0.0 : 40.0,
          child: InkWell(
            onTap: toggleButton,
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 1000),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return RotationTransition(turns: animation);
              },
              child: toggleValue
                  ? Icon(
                      Icons.circle,
                      color: Colors.white,
                      size: 18,
                      key: UniqueKey(),
                    )
                  : Icon(
                      Icons.circle,
                      color: Colors.black,
                      size: 18,
                      key: UniqueKey(),
                    ),
            ),
          ),
        )
      ],
    );

    /* AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
      height: 20,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: toggleValue ?Colors.orange  :Colors.white ,
      ),
      child: Stack(
        children: <Widget>[
          AnimatedPositioned(
            duration: Duration(milliseconds: 1000),
            curve: Curves.easeIn,
            top: 3.0,
            left: toggleValue ? 40.0 : 0.0,
            right: toggleValue ? 0.0 : 40.0,
            child: InkWell(
              onTap: toggleButton,
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 1000),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return RotationTransition(turns: animation);
                },
                child: toggleValue
                    ? Icon(
                        Icons.circle,
                        color: Colors.black,
                        size: 18,
                        key: UniqueKey(),
                      )
                    : Icon(
                        Icons.circle,
                        color: Colors.white,
                        size: 18,
                        key: UniqueKey(),
                      ),
              ),
            ),
          )
        ],
      ),
    );
  */
  }
}
