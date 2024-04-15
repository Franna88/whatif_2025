import 'package:flutter/material.dart';
import 'package:webdirectories/Mobile/MobilePage3/WatifMobile/WatifMobileComponents/WatifDropDownMobile.dart';
import 'package:webdirectories/myutility.dart';

class WatifMobile extends StatefulWidget {
  const WatifMobile({super.key});

  @override
  State<WatifMobile> createState() => _WatifMobileState();
}

class _WatifMobileState extends State<WatifMobile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MyUtility(context).width * 1.2,
      child: Column(
        children: [
          Text(
            'Hello, my name is',
            style: TextStyle(fontSize: 42, fontFamily: 'ralewaysemi'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "WATIF",
                style: TextStyle(
                  fontSize: 80,
                  fontFamily: 'ralewaysemi',
                  color: Colors.black,
                ),
              ),
              Text(
                "™",
                style: TextStyle(
                  fontSize: 42,
                  fontFamily: 'raleway',
                  color: Colors.black,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Your ",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'raleway',
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: "FREE ",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'ralewaybold',
                        color: Colors.black,
                        // Make the text bold
                      ),
                    ),
                    TextSpan(
                      text:
                          "cloud based, voice controlled, assistance App, available 24/7",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'raleway',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center, // Align the text center
              ),
            ),
          ),
          WatifDropDownMobile(
            dropdownText: "Watif you need fuel fast?",
            dropdownContent:
                "I will help you find the nearest and cheapest fuel brands in any area. View, select and navigate there instantly. Get updated info on available fuel loyalty rewards to maximize your fuel rewards.",
          ),
          WatifDropDownMobile(
            dropdownText: "Watif you need Coffee? Food?",
            dropdownContent:
                "Feed your travel taste buds with coffee, food and convenience shopping. I have all the answers and specials! ",
          ),
          WatifDropDownMobile(
            dropdownText: "Watif you need a restroom??",
            dropdownContent:
                "I will guide you to clean, accessible restrooms, pet and child friendly spaces.",
          ),
          WatifDropDownMobile(
            dropdownText: "Watif you need more convenience?",
            dropdownContent:
                "I will find you ATM’s, car washes, pharmacies, courier depots, trailer hire, bus & truck stops and many more! ",
          ),
          WatifDropDownMobile(
            dropdownText: "Watif you get car trouble?",
            dropdownContent:
                "I will link you to reputable roadside assistance-, towing-, auto repair-, and panel beating services nationwide. ",
          ),
          WatifDropDownMobile(
            dropdownText: "Watif an accident happens?",
            dropdownContent:
                "Help is a tap away! Get reputable roadside- and towing assistance near you. Access emergency contacts on call, get your medical and insurance information, and share your location to your nominated contacts.",
          ),
          WatifDropDownMobile(
            dropdownText: "Watif you need your travel info?",
            dropdownContent:
                "Upload your Driver Profile that includes emergency contacts, vehicle registration and licensing, medical aid, insurance policy details and vehicle tracking information.",
          ),
          WatifDropDownMobile(
            dropdownText: "Watif you need infotainment?",
            dropdownContent:
                "Access your favourite tunes, podcasts, audio books, messaging and map apps through my portal. ",
          ),
          SizedBox(
            height: MyUtility(context).height * 0.025,
          ),
          Image.asset('images/coffeendrive.png'),
          SizedBox(
            height: MyUtility(context).height * 0.03,
          ),
          Text(
            "Download WATIF ™",
            style: TextStyle(
              fontSize: 41,
              fontFamily: 'ralewaysemi',
              color: Colors.black,
            ),
          ),
          Text(
            "for mahala, free, verniet...",
            style: TextStyle(
                fontSize: 28, fontFamily: 'ralewaysemi', color: Colors.black),
          ),
          SizedBox(
            height: MyUtility(context).height * 0.01,
          ),
          SizedBox(
            width: MyUtility(context).width / 1.1,
            child: Text(
              "Hit the road with confidence and ditch the stress! Watif is your free, all-in-one automotive app that empowers you with everything you need.",
              style: TextStyle(fontSize: 16, fontFamily: 'ralewaysemi'),
            ),
          ),
          SizedBox(
            height: MyUtility(context).height * 0.015,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: MyUtility(context).height * 0.04,
                width: MyUtility(context).width * 0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/appmobile.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                height: MyUtility(context).height * 0.04,
                width: MyUtility(context).width * 0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/googlemobile.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                height: MyUtility(context).height * 0.04,
                width: MyUtility(context).width * 0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/windowsmobile.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MyUtility(context).height * 0.02,
          ),
          Container(
            width: MyUtility(context).height * 0.2,
            height: MyUtility(context).height * 0.05,
            decoration: BoxDecoration(
              color: Color(0xFF0E1013),
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: GestureDetector(
              onTap: () {
                // Add your onPressed functionality here
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Learn More",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'raleway',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MyUtility(context).height * 0.01,
          ),
          Image.asset('images/starsmobile.png'),
          SizedBox(
            height: MyUtility(context).height * 0.01,
          ),
        ],
      ),
    );
  }
}
