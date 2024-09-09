import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/Documents/Documentscomp/DocumentsAltContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/Documents/Documentscomp/DocumentsContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/AddButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/CommonReuseable/IconSearchBoxB.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/InsertDocumentPopup/DocumentPopup.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

class DocumentAlt extends StatefulWidget {
  const DocumentAlt({super.key});

  @override
  State<DocumentAlt> createState() => _DocumentAltState();
}

class _DocumentAltState extends State<DocumentAlt> {
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

      if (documentsSnapshot.docs.isNotEmpty) {
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
          QuerySnapshot QueryDocumentSubCategorySnapshot =
              await FirebaseFirestore.instance
                  .collection('document_sub_category')
                  .where('documentSubCategoryId',
                      isEqualTo: documentSubCategoryId)
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
      } else {
        return [];
      }
    } catch (e) {
      print('error fetching documents: $e');
      return [];
    }
  }

  @override
  final ScrollController _scrollController = ScrollController();

  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    return Center(
      child: SizedBox(
        // width: MyUtility(context).width * 0.9,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, right: 20),
          child: Container(
            width: MyUtility(context).width * 0.9,
            decoration: ShapeDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.57, -0.82),
                end: Alignment(-0.57, 0.82),
                colors: [
                  Color(0x19777777),
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
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AddButton(
                        text: 'Insert New Record',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconSearchBoxB(),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 15),
                    child: Container(
                      width: MyUtility(context).width * 0.9,
                      height: MyUtility(context).height * 0.065,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Category',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.6064,
                                  fontFamily: 'ralewaybold',
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Sub Category',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.6064,
                                  fontFamily: 'ralewaybold',
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Title',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.6064,
                                  fontFamily: 'ralewaybold',
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                '',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.6064,
                                  fontFamily: 'ralewaybold',
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Edit',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.6064,
                                  fontFamily: 'ralewaybold',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: heightDevice * 0.5,
                    child: FutureBuilder<List<Map<String, dynamic>>>(
                      future: _fetchDocumentData(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return Center(child: Text('No documents found'));
                        } else {
                          final documentInfo = snapshot.data!;
                          return DraggableScrollbar.rrect(
                            controller: _scrollController,
                            backgroundColor: Color(0x7F9E9E9F),
                            alwaysVisibleScrollThumb: true,
                            child: ListView.builder(
                              controller:
                                  _scrollController, // Ensure this controller is initialized
                              itemCount: documentInfo.length,
                              itemBuilder: (context, index) {
                                final document = documentInfo[index];
                                return DocumentAlitContainer(
                                  title: document['documentTitle'],
                                  category: document['documentCategory'],
                                  subCategory: document['documentSubCategory'],
                                  pressEdit: () {
                                    // Implement edit functionality
                                  },
                                  pressDelete: () {
                                    // Implement delete functionality
                                  },
                                  isEven: index % 2 == 0,
                                );
                              },
                            ),
                          );
                        }
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
