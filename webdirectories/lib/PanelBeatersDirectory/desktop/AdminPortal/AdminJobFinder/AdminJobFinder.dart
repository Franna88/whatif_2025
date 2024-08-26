import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminJobFinder/JobFinderComp/InfoTextBox.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminJobFinder/JobFinderComp/JobFinderInfo.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/CommonReuseable/IconSearchBox.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/jobFinder.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/notifications.dart';
import 'package:webdirectories/myutility.dart';

class AdminJobFinder extends StatefulWidget {
  const AdminJobFinder({super.key});

  @override
  State<AdminJobFinder> createState() => _AdminJobFinderState();
}

class _AdminJobFinderState extends State<AdminJobFinder> {
  final _firestore = FirebaseFirestore.instance;
  String _searchQuery = '';
  List<JobFinderModel> _jobData = [];
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    _fetchJobData();
  }

  void _fetchJobData() async {
    String id = '';
    try {
      // Create a list of futures for each query
      final futures = [
        _firestore
            .collection('job_finder')
            .orderBy('dateSubmitted', descending: true)
            .get(),
        _firestore.collection('country').get(),
        _firestore.collection('province').get(),
        _firestore.collection('city').get(),
        _firestore.collection('job_occupation').get(),
      ];

      // Wait for all futures to complete in parallel
      final results = await Future.wait(futures);

      // Extract the results
      QuerySnapshot<Map<String, dynamic>> jobSnapshot = results[0];
      QuerySnapshot<Map<String, dynamic>> countrySnapshot = results[1];
      QuerySnapshot<Map<String, dynamic>> provinceSnapshot = results[2];
      QuerySnapshot<Map<String, dynamic>> citySnapshot = results[3];
      QuerySnapshot<Map<String, dynamic>> occupationSnapshot = results[4];

      if (jobSnapshot.docs.isNotEmpty) {
        List<JobFinderModel> jobData = [];

        for (var doc in jobSnapshot.docs) {
          id = doc.data()['jobFinderId'].toString();
          String? years = doc.data()['yearsId'] == 0
              ? ''
              : jobYearsData[doc.data()['yearsId']];
          String country = doc.data()['countryId'] == 0
              ? ''
              : countrySnapshot.docs
                  .where((country) =>
                      country['countryId'] == doc.data()['countryId'])
                  .first
                  .data()['country'];
          String occupation = doc.data()['occupationId'] == 0
              ? ''
              : occupationSnapshot.docs
                  .where((occupation) =>
                      occupation['occupationId'] == doc.data()['occupationId'])
                  .first
                  .data()['occupation'];
          String province = doc.data()['provinceId'] == 0
              ? ''
              : provinceSnapshot.docs
                  .where((province) =>
                      province['provinceId'] == doc.data()['provinceId'])
                  .first
                  .data()['province'];
          String city = doc.data()['cityId'] == 0
              ? ''
              : citySnapshot.docs
                  .where((city) => city['cityId'] == doc.data()['cityId'])
                  .first
                  .data()['city'];
          jobData.add(JobFinderModel(
            name: doc.data()['name'],
            email: doc.data()['emailAddress'],
            qualification: doc.data()['qualifications'],
            city: city,
            province: province,
            country: country,
            occupation: occupation,
            years: years ?? '0 years',
            contactNumber: doc.data()['contactNumber'],
            dateSubmitted: doc.data()['dateSubmitted'],
          ));
        }

        setState(() {
          _jobData = jobData;
          _isLoading = false;
        });
      } else {
        if (!mounted) return;

        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _isLoading = false;
      });

      print('error fetching job data: $e at $id');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Something went wrong. Please try again')),
      );
    }
  }

  List<JobFinderModel> get _filteredJob {
    List<JobFinderModel> filtered = _jobData;

    // Apply search filter
    if (_searchQuery.isNotEmpty) {
      filtered = filtered.where((notification) {
        return notification.occupation
            .toLowerCase()
            .contains(_searchQuery.toLowerCase());
      }).toList();
    }

    return filtered;
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  final Map<int, String> jobYearsData = {
    1: "0 year",
    2: "1 year",
    3: "2 years",
    4: "3 years",
    5: "4 years",
    6: "5 years",
    7: "6 years",
    8: "7 years",
    9: "8 years",
    10: "9 years",
    11: "10 years",
    12: "11 years",
    13: "12 years",
    14: "13 years",
    15: "14 years",
    16: "15 years",
    17: "16 years",
    18: "17 years",
    19: "18 years",
    20: "19 years",
    21: "20 years",
    22: "more than 20 years"
  };

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: MyUtility(context).width,
        height: MyUtility(context).height,
        decoration: BoxDecoration(color: Color(0xFFF4F4F4)),
        child: Center(
          child: Container(
            width: MyUtility(context).width * 0.75,
            height: MyUtility(context).height * 0.9,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Job Finder',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.48,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoTextBox(),
                        IconSearchBox(
                          onChanged: _onSearchChanged,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Container(
                      width: MyUtility(context).width * 0.73,
                      height: MyUtility(context).height * 0.06,
                      decoration: ShapeDecoration(
                        color: Color(0xFF0F253A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MyUtility(context).width * 0.1,
                              child: Text(
                                'Applied Date',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.68,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MyUtility(context).width * 0.17,
                              child: Text(
                                'Occupation',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.68,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MyUtility(context).width * 0.12,
                              child: Text(
                                'Contact',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.68,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MyUtility(context).width * 0.12,
                              child: Text(
                                'Name',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.68,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MyUtility(context).width * 0.17,
                              child: Text(
                                'Location',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.68,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MyUtility(context).width * 0.01,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: _isLoading == true
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          )
                        : _filteredJob.isEmpty
                            ? const Center(
                                child: Text('No Jobs Found'),
                              )
                            : ListView.builder(
                                itemCount: _filteredJob.length,
                                itemBuilder: (context, index) {
                                  final job = _filteredJob[index];
                                  return JobFinderInfo(
                                    year: job.dateSubmitted
                                        .toDate()
                                        .year
                                        .toString(),
                                    month: job.dateSubmitted
                                        .toDate()
                                        .month
                                        .toString(),
                                    day: job.dateSubmitted
                                        .toDate()
                                        .day
                                        .toString(),
                                    occupation: job.occupation,
                                    contact: job.contactNumber,
                                    name: job.name,
                                    location:
                                        '${job.city}, ${job.province}, ${job.country}',
                                  );
                                },
                              ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
