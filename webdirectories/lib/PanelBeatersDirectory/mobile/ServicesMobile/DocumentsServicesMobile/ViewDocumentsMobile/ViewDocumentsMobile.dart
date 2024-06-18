import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/DocumentsServicesMobile/ViewDocumentsMobile/ViewDocumentscompMobile/DocumentButton.dart';
import 'package:webdirectories/myutility.dart';

class ViewDocumentsMobile extends StatefulWidget {
  const ViewDocumentsMobile({Key? key}) : super(key: key);

  @override
  State<ViewDocumentsMobile> createState() => _ViewDocumentsMobileState();
}

class _ViewDocumentsMobileState extends State<ViewDocumentsMobile> {
  late ScrollController _scrollController;
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  void _handleDocumentSelection(int index) {
    setState(() {
      if (selectedIndex == index) {
        selectedIndex = null;
      } else {
        selectedIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.9,
      decoration: BoxDecoration(
        color: const Color(0xFF181B1D),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DraggableScrollbar.rrect(
          controller: _scrollController,
          backgroundColor: Color(0x7FD9D9D9),
          alwaysVisibleScrollThumb: true,
          child: ListView(
            controller: _scrollController,
            shrinkWrap: true,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: 1065,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'View Available Documents:',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 20.4,
                              fontFamily: 'raleway',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  DocumentButtonMobile(
                    documentText: 'B-BBEE Verification Level 1',
                    isSelected: selectedIndex == 0,
                    onPressedDownload: () {},
                    onPressPreview: () {},
                    onTap: () {
                      _handleDocumentSelection(0);
                    },
                  ),
                  DocumentButtonMobile(
                    documentText: 'B-BBEE Certificate',
                    isSelected: selectedIndex == 1,
                    onPressedDownload: () {},
                    onPressPreview: () {},
                    onTap: () {
                      _handleDocumentSelection(1);
                    },
                  ),
                  DocumentButtonMobile(
                    documentText: 'Company Profile',
                    isSelected: selectedIndex == 2,
                    onPressedDownload: () {},
                    onPressPreview: () {},
                    onTap: () {
                      _handleDocumentSelection(2);
                    },
                  ),
                  DocumentButtonMobile(
                    documentText: 'Audi Approval Confirmation',
                    isSelected: selectedIndex == 3,
                    onPressedDownload: () {},
                    onPressPreview: () {},
                    onTap: () {
                      _handleDocumentSelection(3);
                    },
                  ),
                  DocumentButtonMobile(
                    documentText: 'Chev Approval',
                    isSelected: selectedIndex == 4,
                    onPressedDownload: () {},
                    onPressPreview: () {},
                    onTap: () {
                      _handleDocumentSelection(4);
                    },
                  ),
                  DocumentButtonMobile(
                    documentText: 'Datsun Approval - Indefinite Certificate',
                    isSelected: selectedIndex == 5,
                    onPressedDownload: () {},
                    onPressPreview: () {},
                    onTap: () {
                      _handleDocumentSelection(5);
                    },
                  ),
                  DocumentButtonMobile(
                    documentText: 'Hyundai Approval',
                    isSelected: selectedIndex == 6,
                    onPressedDownload: () {},
                    onPressPreview: () {},
                    onTap: () {
                      _handleDocumentSelection(6);
                    },
                  ),
                  DocumentButtonMobile(
                    documentText: 'VW Approval Confirmation',
                    isSelected: selectedIndex == 7,
                    onPressedDownload: () {},
                    onPressPreview: () {},
                    onTap: () {
                      _handleDocumentSelection(7);
                    },
                  ),
                  DocumentButtonMobile(
                    documentText:
                        'FCA / MOPAR - Alfa Romeo / Chrysler / Dodge / Fiat / Jeep / Abarth Approval / Fiat Professional',
                    isSelected: selectedIndex == 8,
                    onPressedDownload: () {},
                    onPressPreview: () {},
                    onTap: () {
                      _handleDocumentSelection(8);
                    },
                  ),
                  DocumentButtonMobile(
                    documentText: 'Chevrolet Approval',
                    isSelected: selectedIndex == 9,
                    onPressedDownload: () {},
                    onPressPreview: () {},
                    onTap: () {
                      _handleDocumentSelection(9);
                    },
                  ),
                  DocumentButtonMobile(
                    documentText: 'Ford Approval',
                    isSelected: selectedIndex == 10,
                    onPressedDownload: () {},
                    onPressPreview: () {},
                    onTap: () {
                      _handleDocumentSelection(10);
                    },
                  ),
                  DocumentButtonMobile(
                    documentText: 'BMW Approval',
                    isSelected: selectedIndex == 11,
                    onPressedDownload: () {},
                    onPressPreview: () {},
                    onTap: () {
                      _handleDocumentSelection(11);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
