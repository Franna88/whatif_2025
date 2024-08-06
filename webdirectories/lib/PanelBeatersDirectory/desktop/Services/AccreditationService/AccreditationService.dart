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
    super.initState();
  }

  void _fetchAndOrganizeServices() async {
    try {
      // Fetch all service types
      QuerySnapshot approvalCategorySnapshot =
          await _firestore.collection('approvals_category').get();
      List<Map<String, dynamic>> approvalCategoryData = approvalCategorySnapshot
          .docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
      Map<String, List<Map<String, dynamic>>> servicesMap = {};

      print(approvalCategoryData);

      // Fetch all approvals linked to the account
      QuerySnapshot listingsApprovalsSnapshot = await _firestore
          .collection('listing_approvals')
          .where('listingsId', isEqualTo: widget.listingId)
          .get();

      // Organize services under their respective service types
      for (var doc in listingsApprovalsSnapshot.docs) {
        Map<String, dynamic> listingsApprovalsData =
            doc.data() as Map<String, dynamic>;

        QuerySnapshot approvalDoc = await _firestore
            .collection('approvals')
            .where('approvalsId',
                isEqualTo: listingsApprovalsData['approvalsId'])
            .get();

        Map<String, dynamic> approvalDocData =
            approvalDoc.docs.first.data() as Map<String, dynamic>;
        int approvalCategoryId = approvalDocData['approvalsCategoryId'];

        String approvalsCategoryName = approvalCategoryData.firstWhere((doc) =>
            doc['approvalsCategoryId'] ==
            approvalCategoryId)['approvalsCategory'];

        String? imageUrl = await getImageUrl(
            'images/logos/${approvalDocData['approvalsFile']}');

        if (imageUrl != null) {
          // Ensure the service type exists in the map
          if (servicesMap.containsKey(approvalsCategoryName)) {
            servicesMap[approvalsCategoryName]!.add({
              'ImageUrl': imageUrl,
              'link': approvalDocData['approvalsUrl']
            });
          } else {
            servicesMap[approvalsCategoryName] = [];
            servicesMap[approvalsCategoryName]!.add({
              'ImageUrl': imageUrl,
              'link': approvalDocData['approvalsUrl']
            });
          }
        }
      }

      setState(() {
        _accreditationData = servicesMap;
        _isLoading = false;
      });
    } catch (e) {
      print('Error fetching services: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _isLoading
          ? const CircularProgressIndicator(color: Colors.white)
          : Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AccreditationFilter(
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
