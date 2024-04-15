import 'package:flutter/material.dart';
import 'package:webdirectories/Page4/DownloadWatif/DownloadWatif.dart';
import 'package:webdirectories/TopNavBar/TopNavBar.dart';
import 'package:webdirectories/Page4/Watif/WatifDropdown.dart';
import 'package:webdirectories/myutility.dart';

class Watif extends StatefulWidget {
  const Watif({Key? key}) : super(key: key);

  @override
  State<Watif> createState() => _WatifState();
}

class _WatifState extends State<Watif> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MyUtility(context).height * 1.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: SizedBox(
                          height: 60,
                          child: Text(
                            "Hello, my name is",
                            style: TextStyle(
                              fontSize: 48,
                              fontFamily: 'ralewaysemi',
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 130,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            "WATIF",
                            style: TextStyle(
                              fontSize: 120,
                              fontFamily: 'ralewaysemi',
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Your ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'raleway',
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: "FREE ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'ralewaybold',
                                  color: Colors.black,
                                  // Make the text bold
                                ),
                              ),
                              TextSpan(
                                text:
                                    "cloud based, voice controlled, assistance App, available 24/7",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'raleway',
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      WatifDropdown(
                        dropdownText: "Watif you need fuel fast?",
                        dropdownContent:
                            "I will help you find the nearest and cheapest fuel brands in any area. View, select and navigate there instantly. Get updated info on available fuel loyalty rewards to maximize your fuel rewards.",
                      ),
                      WatifDropdown(
                        dropdownText: "Watif you need Coffee? Food?",
                        dropdownContent:
                            "Feed your travel taste buds with coffee, food and convenience shopping. I have all the answers and specials! ",
                      ),
                      WatifDropdown(
                        dropdownText: "Watif you need a restroom??",
                        dropdownContent:
                            "I will guide you to clean, accessible restrooms, pet and child friendly spaces.",
                      ),
                      WatifDropdown(
                        dropdownText: "Watif you need more convenience?",
                        dropdownContent:
                            "I will find you ATM’s, car washes, pharmacies, courier depots, trailer hire, bus & truck stops and many more! ",
                      ),
                      WatifDropdown(
                        dropdownText: "Watif you get car trouble?",
                        dropdownContent:
                            "I will link you to reputable roadside assistance-, towing-, auto repair-, and panel beating services nationwide. ",
                      ),
                      WatifDropdown(
                        dropdownText: "Watif an accident happens?",
                        dropdownContent:
                            "Help is a tap away! Get reputable roadside- and towing assistance near you. Access emergency contacts on call, get your medical and insurance information, and share your location to your nominated contacts.",
                      ),
                      WatifDropdown(
                        dropdownText: "Watif you need your travel info?",
                        dropdownContent:
                            "Upload your Driver Profile that includes emergency contacts, vehicle registration and licensing, medical aid, insurance policy details and vehicle tracking information.",
                      ),
                      WatifDropdown(
                        dropdownText: "Watif you need infotainment?",
                        dropdownContent:
                            "Access your favourite tunes, podcasts, audio books, messaging and map apps through my portal. ",
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MyUtility(context).height / 1.2,
                  child: Image.asset('images/phone.png'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
