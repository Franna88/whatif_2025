import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/MobileTopNavBar/MobileTopNavBarhome.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/AboutServicesMobile/AboutServicesMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/AccreditationServiceMobile/AccreditationServiceMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/DocumentsServicesMobile/DocumentsServicesMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/FinanceMobile/FinanceMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/ReviewsMobile/ReviewsMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/ServiceContactMobile/ServiceContactMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/ServiceProfile/ServiceProfileMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/ServicesMapsMobile/ServicesMapsMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/ServicesNavButton/ServicesNavButtonMobile.dart';
import 'package:webdirectories/myutility.dart';

import '../../utils/firebaseImageUtils.dart';

class ServicesMobile extends StatefulWidget {
  String listingId;
  ServicesMobile({super.key, required this.listingId});

  @override
  State<ServicesMobile> createState() => _ServicesMobileState();
}

class _ServicesMobileState extends State<ServicesMobile> {
  var pageIndex = 0;

  ///change page
  updatePageIndex(value) {
    setState(() {
      pageIndex = value;
    });
  }

  final _firestore = FirebaseFirestore.instance;
  Map<String, dynamic> _listingData = {};
  String _listingsTitle = '';
  List<String> _galleryData = [];
  Map<String, String> _linkData = {};
  Map<String, String> _contactData = {};
  bool? _isLoading;
  List businessViews = [];

  @override
  void initState() {
    super.initState();
    checkViewExist();
    _getListingData();
  }

//check if business in view list and view
  checkViewExist() async {
    var busnessDetails = {
      'listingId': widget.listingId,
      'views': [],
    };
    final ipv4 = await Ipify.ipv4();

    final DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('views')
        .doc(widget.listingId)
        .get();

    if (doc.exists) {
      setState(() {
        businessViews.addAll(doc.get('views'));

        for (var doc in businessViews) {
          DateTime dateViewAdded = doc['date'].toDate();
          var todayDate = DateTime.now();
          Duration difference = todayDate.difference(dateViewAdded);
          int days = difference.inDays % 24;
          if (days >= 1) {
            //add view
            updateViews(ipv4);
          }
        }
        /* businessViews.map((e) {
            DateTime dateViewAdded = e['date'].toDate();
          var todayDate = DateTime.now();
          //check if view added on same day
          Duration difference = todayDate.difference(dateViewAdded);
          int days = difference.inDays % 24;
          if (days >= 1) {
            print("ADD");
            //add view
            updateViews(ipv4);
          }
        });*/
      });
    } else {
      print("NOTEXISTS");
      //create business listing
      FirebaseFirestore.instance
          .collection('views')
          .doc(widget.listingId)
          .set(busnessDetails)
          .whenComplete(updateViews(ipv4));
    }
  }

//Update businessViews
  updateViews(ip) async {
    var viewDetails = {"ip": ip, "date": DateTime.now()};
    setState(() {
      businessViews.add(viewDetails);
    });

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
    var servicesPages = [
      ServiceProfileMobile(
          imagesData: _galleryData,
          linkData: _linkData,
          contactData: _contactData),
      ServiceContactMobile(
        listingData: _listingData,
      ),
      ServicesMapsMobile(
        listingId: _listingData['listingsId'] ?? 0,
        listingAddress: _listingData['streetaddress'] ?? 'No listing address',
        listinglatitude: _listingData['latitude'] ?? 0.0,
        listinglongitude: _listingData['longitude'] ?? 0.0,
      ),
      AccreditationServiceMobile(listingId: int.parse(widget.listingId)),
      AboutServicesMobile(
          listingsId: int.parse(widget.listingId),
          beeLevel: _listingData['beerating'] ?? ''),
      DocumentsServicesMobile(listingsId: int.parse(widget.listingId)),
      ReviewsMobile(),
      FinanceMobile(),
    ];
    return Material(
      child: Container(
          height: MyUtility(context).height,
          width: MyUtility(context).width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/mainBackgroundpan.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                MobileTopNavBarhome(),
                if (pageIndex == 0)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: SizedBox(
                      width: MyUtility(context).width * 0.9,
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 0.5,
                                  ),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.keyboard_arrow_left,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
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
                      ),
                    ),
                  ),
                Center(
                    child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                      width: MyUtility(context).width * 0.95,
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.56, -0.83),
                          end: Alignment(-0.56, 0.83),
                          colors: [
                            Colors.white.withOpacity(0.10000000149011612),
                            Colors.white.withOpacity(0.4000000059604645)
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0xBF000000),
                            blurRadius: 24,
                            offset: Offset(0, 4),
                            spreadRadius: -1,
                          )
                        ],
                      ),
                      child: SingleChildScrollView(
                        child: Column(children: [
                          SizedBox(
                            height: 20,
                          ),
                          ServicesNavButtonMobile(
                              updatePageIndex: updatePageIndex),
                          servicesPages[pageIndex]
                        ]),
                      )),
                )),
              ],
            ),
          )),
    );
  }
}
