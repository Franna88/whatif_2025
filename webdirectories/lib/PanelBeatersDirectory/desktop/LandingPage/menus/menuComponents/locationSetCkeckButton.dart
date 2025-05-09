import 'package:flutter/material.dart';

class LocationSetCheckButton extends StatelessWidget {
  const LocationSetCheckButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      /*width: MediaQuery.of(context).size.width * 0.08,*/
      /*height: MediaQuery.of(context).size.height * 0.05,*/
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 6,bottom: 6,left: 10,right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            
            children: [
              Container(
                width: 25,
                height: 25,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 80, 189, 94),
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.zero,
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 16,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'Location set',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.5,
                  fontFamily: 'Raleway',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}