import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DasboardComp/DashPartsandQuote.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DashboardContainers/DashEditProfile.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DashboardContainers/DashGraph.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DashboardContainers/DashJobFinder.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DashboardContainers/DashNotificationsUp.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DashboardContainers/DashProfileView.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DashboardContainers/GraphContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DashboardContainers/IconTotalContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DashboardContainers/JobFinderOverviewContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DashboardContainers/NotificationsContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DashboardContainers/WelcomeBack.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

class Dashboard extends StatefulWidget {
  final Function(int) navigateToPage;

  const Dashboard({super.key, required this.navigateToPage});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _firestore = FirebaseFirestore.instance;
  String? _userDisplayImageName; // This will store the image URL
  bool _isLoading = true; // Track loading
  String docId = "";
  String businessLogo = "";
  String userId = "";

  @override
  void initState() {
    super.initState();
    _fetchUserData(); // Fetch the user data when the Dashboard initializes
  }

  Future<void> _fetchUserData() async {
    StoredUser? user =
        await getUserInfo(); // Assuming you have this method to get the user

    if (user != null) {
      print(user.id);
      try {
        // Fetch the user's document from Firestore based on their ID
        QuerySnapshot userDoc = await _firestore
            .collection('listings')
            .where('listingsId', isEqualTo: int.parse(user.id))
            .get();

        if (userDoc.docs.isNotEmpty) {
          Map<String, dynamic> userData =
              userDoc.docs[0].data() as Map<String, dynamic>;

          // Assuming 'displayphoto' is a field that stores the image path
          String? imageUrl = userData['displayphoto'];

          setState(() {
            userId = user.id;

            _userDisplayImageName =
                userData['displayphoto']; // Store image URL in state
            _isLoading = false; // Stop loading once data is fetched
            docId = userDoc.docs[0].id;
            businessLogo = userData['listingLogo'];
            print(userData['listingLogo']);
          });
        }
      } catch (e) {
        print('Error fetching user data: $e');
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  updateDisplayImage(image) async {
    await _firestore
        .collection('listings')
        .doc(docId) // Use document ID to update
        .update({"displayphoto": image}).whenComplete(() {});
  }

  updateLogo(image) async {
    await _firestore
        .collection('listings')
        .doc(docId) // Use document ID to update
        .update({"listingLogo": image}).whenComplete(() {});
  }

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Container(
      width: MyUtility(context).width,
      height: MyUtility(context).height,
      decoration: BoxDecoration(color: Color(0xFF171616)),
      child: Padding(
        padding: EdgeInsets.only(
          left: widthDevice < 1500 ? 15 : 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /* DashProfileView(
              onPress: () {
                widget.navigateToPage(14);
              },
              connectToIndexPage: true, // Enables page navigation via dropdown
            ),*/
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                /*WelcomeBack(),*/
                DashEditProfile(
                    businessLogo: businessLogo,
                    userDisplayImageName:
                        _userDisplayImageName!, // Passing the display image URL here
                    updateDisplayImage: updateDisplayImage,
                    updateLogo: updateLogo),
                SizedBox(
                  width: widthDevice < 1500 ? 15 : 30,
                ),
                /*GraphContaier()*/
                DashGraph(
                  userId: userId,
                )
              ],
            ),
            SizedBox(
              height: widthDevice < 1500 ? 15 : 15,
            ),
            /* SizedBox(
              height: widthDevice < 1500 ? 15 : 30,
            ),*/
            SizedBox(
              height: MyUtility(context).height * 0.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //Notificationscontainer(),
                  DashJobFinder(
                    onpress: () {
                      widget.navigateToPage(8);
                    },
                  ),
                  SizedBox(
                    width: widthDevice < 1500 ? 15 : 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Dashpartsandquote(
                          containerText: 'Parts & Equipment\nPlatform',
                          containerNumber: '*51',
                          svgImage: 'images/gear1.svg',
                        ),
                      ),
                      Dashpartsandquote(
                        containerText: 'Request a\nQuote',
                        containerNumber: '*51',
                        svgImage: 'images/quote.svg',
                      ),
                      Dashpartsandquote(
                        svgImage: 'images/quote.svg',
                        containerText: 'View My Latest\nLightstone Results',
                        containerNumber: '',
                      ),
                    ],
                  ),
                  SizedBox(
                    width: widthDevice < 1500 ? 15 : 30,
                  ),
                  DashNotificationsUp(
                    onTap: () {
                      widget.navigateToPage(4);
                    },
                  )
                  //JobFinderOverviewContainer()
                  //Notificationscontainer()
                ],
              ),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            )
          ],
        ),
      ),
    );
  }
}
