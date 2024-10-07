import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Footer/panelFooter.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/AboutServices/AboutServices.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/AccreditationService/AccreditationService.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/DocumentsServices/DocumentsServices.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Finance/Finance.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/Reviews.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServiceContact/ServiceContact.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServiceProfile/ServiceProfile.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesMaps/ServicesMaps.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesNavButton/ServicesNavButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/firebaseImageUtils.dart';
import 'package:webdirectories/WebDirectories/Footer/Footer.dart';
import 'package:webdirectories/myutility.dart';

class Services extends StatefulWidget {
  final String listingId;
  const Services({super.key, required this.listingId});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  final _firestore = FirebaseFirestore.instance;
  Map<String, dynamic> _listingData = {};
  String _listingsTitle = '';
  List<String> _galleryData = [];
  Map<String, String> _linkData = {};
  Map<String, String> _contactData = {};
  bool? _isLoading;
  var pageIndex = 0;
  List businessViews = [];

  @override
  void initState() {
    super.initState();
    checkViewExist();
    _getListingData();
  }

  ///change page
  updatePageIndex(value) {
    setState(() {
      pageIndex = value;
    });
  }

//check if business in view list and view
  checkViewExist() async {
    var busnessDetails = {
      'businessId': widget.listingId,
      'views': [],
    };

    final DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('views')
        .doc(widget.listingId)
        .get();

    if (doc.exists) {
      setState(() {
        businessViews = doc.get('views');
      });
    } else {
      FirebaseFirestore.instance
          .collection('views')
          .doc(widget.listingId)
          .set(busnessDetails);
    }
  }

//Update businessViews
  updateViews() async {
    final ipv4 = await Ipify.ipv4();
    print(ipv4);
    var viewDetails = {"ip": ipv4, "date": DateTime.now()};
    businessViews.add(viewDetails);

    FirebaseFirestore.instance
        .collection('views')
        .doc(widget.listingId)
        .update({"views": businessViews});
  }

  Future<void> _getListingData() async {
    try {
      setState(() {
        _isLoading = true;
      });

      QuerySnapshot data = await _firestore
          .collection('listings')
          .where('listingsId', isEqualTo: int.parse(widget.listingId))
          .get();

      if (data.docs.isNotEmpty) {
        Map<String, dynamic> listingData =
            data.docs.first.data() as Map<String, dynamic>;

        // Fetch images
        QuerySnapshot imagesSnapshot = await _firestore
            .collection('gallery')
            .where('listingsId', isEqualTo: int.parse(widget.listingId))
            .get();
        List<Map<String, dynamic>> images = imagesSnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();

        List<String> urls = [];

        for (var element in images) {
          String? url = await getImageUrl('listings/${element['immageFile']}');
          if (url != null) {
            urls.add(url);
          }
        }

        // Set state
        setState(() {
          _galleryData = urls;
          _listingData = data.docs.first.data() as Map<String, dynamic>;
          _listingsTitle = listingData['title'];
          _linkData = Map<String, String>.from({
            'telephone': listingData['businessTelephone'],
            'email': listingData['businessEmail'],
            'whatsapp': listingData['whatsappNumber'],
          });
          _contactData = Map<String, String>.from({
            'telephone': listingData['businessTelephone'],
            'address': listingData['streetaddress'],
          });
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching listing data: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> servicesPages = [
      ServiceProfile(
          imagesData: _galleryData,
          linkData: _linkData,
          contactData: _contactData),
      ServiceContact(
        listingData: _listingData,
      ),
      ServicesMaps(
        listingId: _listingData['listingsId'] ?? 0,
        listingAddress: _listingData['streetaddress'] ?? 'No listing address',
        listinglatitude: _listingData['latitude'] ?? 0.0,
        listinglongitude: _listingData['longitude'] ?? 0.0,
      ),
      AccreditationServices(listingId: int.parse(widget.listingId)),
      AboutServices(
          listingsId: int.parse(widget.listingId),
          beeLevel: _listingData['beerating'] ?? ''),
      DocumentsServices(listingsId: int.parse(widget.listingId)),
      Reviews(),
      Finance(),
    ];
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MyUtility(context).width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/mainbackgroundPanel.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: SizedBox(
                            width: MyUtility(context).width * 0.88,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'images/logoPanel.png',
                                  height: 70,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(1),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 0.5,
                                              ),
                                            ),
                                            child: const Center(
                                              child: Icon(
                                                Icons.keyboard_arrow_left,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          const Text(
                                            'Go Back',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17.68,
                                              fontFamily: 'raleway',
                                              fontWeight: FontWeight.w400,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: _isLoading == true
                              ? SizedBox(
                                  height: MyUtility(context).height * 0.8,
                                  child: const Center(
                                      child: CircularProgressIndicator(
                                          color: Colors.white)))
                              : Container(
                                  width: MyUtility(context).width * 0.88,
                                  decoration: ShapeDecoration(
                                    gradient: LinearGradient(
                                      begin: const Alignment(-0.57, -0.83),
                                      end: const Alignment(0.56, 0.83),
                                      colors: [
                                        Colors.white.withOpacity(0.1),
                                        Colors.white.withOpacity(0.25),
                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    shadows: const [
                                      BoxShadow(
                                        color: Color(0xBF000000),
                                        blurRadius: 24,
                                        offset: Offset(0, 4),
                                        spreadRadius: -1,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 20),
                                      _listingsTitle == null
                                          ? const CircularProgressIndicator(
                                              color: Colors.white)
                                          : ServicesNavButton(
                                              listingTitle: _listingsTitle!,
                                              updatePageIndex: updatePageIndex),
                                      servicesPages[pageIndex],
                                    ],
                                  ),
                                ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ),
            const PanelFooter(),
          ],
        ),
      ),
    );
  }
}
