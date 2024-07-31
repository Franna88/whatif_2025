import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/Documents/Documentscomp/DocumentsContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/AddButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/CommonReuseable/IconSearchBoxB.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/InsertDocumentPopup/DocumentPopup.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

class Documents extends StatefulWidget {
  const Documents({super.key});

  @override
  State<Documents> createState() => _DocumentsState();
}

class _DocumentsState extends State<Documents> {
  late List<Map<String, dynamic>> registrationInfo;
  final _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> _fetchDocumentData() async {
    StoredUser? user = await getUserInfo();
    if (user == null) {
      return [];
    }

    // Fetch documents
    try {
      QuerySnapshot documentsSnapshot = await _firestore
          .collection('listings_documents')
          .where('listingsId', isEqualTo: int.parse(user.id))
          .get();
      List<Map<String, dynamic>> documentData = documentsSnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();

      // Fetch the document categories and document sub categories
      for (var doc in documentData) {
        int? documentCategoryId = doc['documentCategoryId'];
        int? documentSubCategoryId = doc['documentSubCategoryId'];

        // Fetch the document category
        QuerySnapshot documentCategorySnapshot = await FirebaseFirestore
            .instance
            .collection('document_category')
            .where('documentCategoryId', isEqualTo: documentCategoryId)
            .get();

        // Fetch the document sub category
        QuerySnapshot QueryDocumentSubCategorySnapshot = await FirebaseFirestore
            .instance
            .collection('document_sub_category')
            .where('documentSubCategoryId', isEqualTo: documentSubCategoryId)
            .get();

        if (documentCategorySnapshot.docs.isNotEmpty &&
            QueryDocumentSubCategorySnapshot.docs.isNotEmpty) {
          String documentCategoryData =
              documentCategorySnapshot.docs.first['documentCategory'];
          String documentSubCategoryData = QueryDocumentSubCategorySnapshot
              .docs.first['documentSubCategory'];

          // Add the document category and sub category to the document
          doc['documentCategory'] = documentCategoryData;
          doc['documentSubCategory'] = documentSubCategoryData;
        }
      }

      return documentData;
    } catch (e) {
      print('error fetching documents: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    return Center(
      child: SizedBox(
        // width: MyUtility(context).width * 0.9,
        child: Column(
          children: [
            SizedBox(
              height: MyUtility(context).height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Documents',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.48,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconSearchBoxB(),
                AddButton(
                  text: 'Insert Document',
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      barrierColor: Colors.black.withOpacity(0.5),
                      builder: (BuildContext context) {
                        return Dialog(
                          backgroundColor: Colors.transparent,
                          insetPadding: EdgeInsets.all(10),
                          child: DocumentPopup(),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 15),
              child: Container(
                width: MyUtility(context).width * 0.9,
                height: MyUtility(context).height * 0.065,
                decoration: ShapeDecoration(
                  color: Color(0xFF0F253A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: MyUtility(context).width * 0.26,
                        child: Text(
                          'Title',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.68,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MyUtility(context).width * 0.26,
                        child: Text(
                          'Category',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.68,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MyUtility(context).width * 0.26,
                        child: Text(
                          'Sub Category',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.68,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: heightDevice,
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: _fetchDocumentData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No documents found'));
                  } else {
                    final documentInfo = snapshot.data!;
                    return ListView.builder(
                      itemCount: documentInfo.length,
                      itemBuilder: (context, index) {
                        final document = documentInfo[index];
                        return DocumentsContainer(
                          title: document['documentTitle'],
                          category: document['documentCategory'],
                          subCategory: document['documentSubCategory'],
                          pressEdit: () {},
                          PressDelete: () {},
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
