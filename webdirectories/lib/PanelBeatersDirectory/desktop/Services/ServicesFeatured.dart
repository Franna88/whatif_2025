import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Footer/panelFooter.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Locations/LocationFeaturedComponents/BuisnessImageContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesComponent/ServiceStackedButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesComponent/ServicesContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/iconButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/firebaseImageUtils.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';
import 'package:geolocator/geolocator.dart';
import 'ServicesOther.dart';
import 'services.dart';
import 'dart:math';

class ServicesFeatured extends StatefulWidget {
  ServicesFeatured({
    Key? key,
  }) : super(key: key);

  @override
  _ServicesFeaturedState createState() => _ServicesFeaturedState();
}

class _ServicesFeaturedState extends State<ServicesFeatured> {
  bool showOtherServices = false;
  final TextEditingController search = TextEditingController();
  late Future<List<Map<String, dynamic>>> _listingsFuture;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Position? _userPosition;
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    LocationPermission permission;

    // Check if location services are enabled
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationServiceEnabled) {
      return Future.error('Location services are disabled.');
    }

    // Check for location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied.');
    }

    // Get the current position
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);

    setState(() {
      _userPosition = position;
      _isLoading = false;
    });
  }

  _calculateDistance(userLat, userLong, listingLat, listingLong) {
    // Calculate the distance
    double distance =
        Geolocator.distanceBetween(userLat, userLong, listingLat, listingLong);

    return (distance / 1000).toStringAsFixed(1);
  }

  Future<List<Map<String, dynamic>>> _getListings() async {
    // Fetch featured listings
    QuerySnapshot querySnapshot = await _firestore
        .collection('listings')
        //.where('featured', isEqualTo: 1)
        .where('authId', isEqualTo: "YHg7m6rx5RxD01wvotTZ")
        .limit(20)
        .get();

    List<Future<Map<String, dynamic>>> listingFutures =
        querySnapshot.docs.map((doc) async {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      String? imageUrl =
          await getImageUrl('listings/images/listings/${data['displayphoto']}');
      if (imageUrl != null) {
        data['displayphoto'] = imageUrl;
      }

      data['distance'] = _userPosition?.latitude != null
          ? '${_calculateDistance(_userPosition?.latitude, _userPosition?.longitude, data['latitude'], data['longitude'])}'
          : /**/
          '0 km';
      return data;
    }).toList();

    // Wait for all futures to complete
    List<Map<String, dynamic>> listings = await Future.wait(listingFutures);

    // Filter out listings with null displayphoto
    listings =
        listings.where((listing) => listing['displayphoto'] != null).toList();

    //  listings.sort((a, b) => a['distance'].compareTo(b['distance']));

    return listings;
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

//filter data on search value
  getSearchValue(document) {
    var title = document['title'].split(' ');

    if ((search.text) == "") {
      return true;
    } else if ((search.text).contains(title[0])) {
      return true;
    } else if (title[1] != null && (search.text).contains(title[1])) {
      return true;
    } else {
      return false;
    }
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
                                isFeaturedSelected: true,
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
                                controller: search,
                                onChanged: (value) {
                                  setState(() {});
                                },
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
                            future: _getListings(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator(
                                  color: Colors.white,
                                ));
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

                                    /**/
                                    print(listing);
                                    return Visibility(
                                      visible: getSearchValue(listing),
                                      child: ServiceFeaturedContainer(
                                        businessImage: listing['displayphoto'],
                                        businessName: listing['title'],
                                        businessAddress:
                                            listing['postaladdress'],
                                        OnPressed: () {
                                          storage.write(
                                              key: 'id',
                                              value: listing['listingsId']
                                                  .toString());
                                          storage.write(
                                              key: 'title',
                                              value:
                                                  listing['title'].toString());
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Services(
                                                    listingId:
                                                        (listing['listingsId'])
                                                            .toString())),
                                          );
                                        },
                                        navigateMe: () async {
                                          final Uri uri = Uri.parse(
                                              "https://www.google.com/maps/search/${listing['streetaddress']}");
                                          await launchUrl(uri);
                                        },
                                        views: '${200 + Random().nextInt(801)}',
                                        distance:
                                            (listing['distance']).toString(),
                                      ),
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
