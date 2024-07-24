import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Footer/panelFooter.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Locations/LocationFeaturedComponents/BuisnessImageContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesComponent/ServiceStackedButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesComponent/ServicesContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/iconButton.dart';
import 'package:webdirectories/myutility.dart';

import 'ServicesOther.dart';
import 'services.dart';

class ServicesFeatured extends StatefulWidget {
  ServicesFeatured({
    Key? key,
  }) : super(key: key);

  @override
  _ServicesFeaturedState createState() => _ServicesFeaturedState();
}

class _ServicesFeaturedState extends State<ServicesFeatured> {
  bool showOtherServices = false;

  late Future<List<Map<String, dynamic>>> _listingsFuture;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _listingsFuture = _getListings();
  }

  Future<List<Map<String, dynamic>>> _getListings() async {
    QuerySnapshot querySnapshot = await _firestore.collection('listings').get();
    return querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }

  void toggleToFeatured() {
    setState(() {
      showOtherServices = false;
    });
  }

  void toggleToOther() {
    setState(() {
      showOtherServices = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showOtherServices
        ? ServicesOther(toggleToFeatured: toggleToFeatured)
        : Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: MyUtility(context).height,
                    width: MyUtility(context).width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/mainbackgroundPanel.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: MyUtility(context).height * 0.025),
                        SizedBox(
                          width: MyUtility(context).width / 1.06,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ServicesStackedButton(
                                showFeatured: toggleToFeatured,
                                showOther: toggleToOther,
                              ),
                              Row(
                                children: [
                                  IconButtons(),
                                  SizedBox(
                                    width: MyUtility(context).width * 0.03,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: MyUtility(context).width / 1.1,
                              height: 34.68,
                              padding: const EdgeInsets.only(
                                top: 10.80,
                                left: 10.80,
                                right: 21.59,
                                bottom: 10.80,
                              ),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.83),
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
                              child: TextField(
                                controller: TextEditingController(),
                                decoration: InputDecoration(
                                  hintText: 'Search Featured',
                                  hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.6812,
                                    fontFamily: 'raleway',
                                    fontWeight: FontWeight.w400,
                                    height: 1.0,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: const EdgeInsets.only(
                                    top: 10.80,
                                    left: 10.80,
                                    right: 21.59,
                                    bottom: 10.80,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(24.83),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.6812,
                                  fontFamily: 'raleway',
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            SizedBox(
                              width: MyUtility(context).width * 0.01,
                            )
                          ],
                        ),
                        SizedBox(
                          height: MyUtility(context).height * 0.85,
                          child: FutureBuilder<List<Map<String, dynamic>>>(
                            future: _listingsFuture,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              if (snapshot.hasError) {
                                return Center(
                                  child: Text('Error: ${snapshot.error}',
                                      style:
                                          const TextStyle(color: Colors.white)),
                                );
                              }
                              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                                return const Center(
                                  child: Text(
                                    'No listings found',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                );
                              }
                              List<Map<String, dynamic>> listings =
                                  snapshot.data!;
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 100.0, vertical: 20.0),
                                child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        5, // Number of items per row
                                    mainAxisSpacing: 8.0,
                                    crossAxisSpacing: 8.0,
                                    childAspectRatio: 3 /
                                        3.5, // Adjust the aspect ratio as needed
                                  ),
                                  itemCount: listings.length,
                                  itemBuilder: (context, index) {
                                    Map<String, dynamic> listing =
                                        listings[index];
                                    return ServiceFeaturedContainer(
                                      businessImage: 'images/williespan.png',
                                      businessName: listing['title'],
                                      businessAddress: listing['postaladdress'],
                                      OnPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Services()),
                                        );
                                      },
                                      views: '16 133',
                                      distance: '12km',
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  PanelFooter()
                ],
              ),
            ),
          );
  }
}
