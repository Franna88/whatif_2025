import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/firebaseImageUtils.dart';

import 'package:webdirectories/myutility.dart';

import 'AccreditationFilter/Accreditationfilter.dart';
import 'AccreditationImageContainer/AccreditationImageContainer.dart';

class AccreditationServices extends StatefulWidget {
  final int listingId;
  const AccreditationServices({super.key, required this.listingId});

  @override
  State<AccreditationServices> createState() => _AccreditationServicesState();
}

class _AccreditationServicesState extends State<AccreditationServices> {
  final _firestore = FirebaseFirestore.instance;
  Map<String, List<Map<String, dynamic>>> _accreditationData = {};
  String? _selectedAccreditationType;

  List<Map<String, dynamic>> get _filteredAccreditations {
    if (_selectedAccreditationType == null) {
      // If no accreditation type is selected, return an empty list or you can return all items
      return [];
    }
    return _accreditationData[_selectedAccreditationType!] ?? [];
  }

  void _onAccreditationTypeSelected(String type) {
    setState(() {
      _selectedAccreditationType = type;
    });
  }

  bool _isLoading = true;
  @override
  void initState() {
    _fetchAndOrganizeServices();
    print('LIST');
    print(widget.listingId);
    super.initState();
  }

  void _fetchAndOrganizeServices() async {
    try {
      Map<String, List<Map<String, dynamic>>> servicesMap = {};
      // // Fetch all service types
      QuerySnapshot listingsSnapshot = await _firestore
          .collection('listings')
          .where('listingsId', isEqualTo: widget.listingId)
          .get();
      if (listingsSnapshot.docs.isNotEmpty) {
        // Assuming listingsId is unique and there is only one document returned
        DocumentSnapshot listingDoc = listingsSnapshot.docs.first;

        QuerySnapshot approvalsSnapshot =
            await listingDoc.reference.collection('approvals').get();

        // Process the approvals subcollection data
        await processApprovals(approvalsSnapshot, servicesMap);

        setState(() {
          _selectedAccreditationType = servicesMap.keys.first;
          _accreditationData = servicesMap;
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching services: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> processApprovals(QuerySnapshot approvalsSnapshot,
      Map<String, List<Map<String, dynamic>>> servicesMap) async {
    List<Future<void>> futures = [];

    for (var approvalDoc in approvalsSnapshot.docs) {
      print(approvalsSnapshot.docs[0]);
      futures.add(() async {
        Map<String, dynamic> approvalData =
            approvalDoc.data() as Map<String, dynamic>;
        String? imageUrl =
            await getImageUrl('images/logos/${approvalData['approvalsFile']}');

        Map<String, dynamic> approvalCategoryData =
            approvalData['approvalCategory'] as Map<String, dynamic>;
        String approvalsCategoryName =
            approvalCategoryData['approvalsCategory'];

        if (imageUrl != null) {
          // Ensure the service type exists in the map
          if (servicesMap.containsKey(approvalsCategoryName)) {
            servicesMap[approvalsCategoryName]!.add(
                {'imageUrl': imageUrl, 'link': approvalData['approvalsUrl']});
          } else {
            servicesMap[approvalsCategoryName] = [
              {'imageUrl': imageUrl, 'link': approvalData['approvalsUrl']}
            ];
          }
        }
      }());
    }

    await Future.wait(futures);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _isLoading
          ? SizedBox(
              height: MyUtility(context).height * 0.8,
              child: Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          : Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AccreditationFilter(
                        selectedFilter: _selectedAccreditationType,
                        onFilterSelected: _onAccreditationTypeSelected,
                        filterOptions: _accreditationData.keys.toList()),
                    AccreditationImageContainer(
                      data: _filteredAccreditations,
                    )
                  ],
                ),
                SizedBox(
                  height: MyUtility(context).height * 0.05,
                )
              ],
            ),
    );
  }
}
