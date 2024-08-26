import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/AdminApprovals/AdminReuseable.dart/CategoryButton.dart';
import 'package:webdirectories/myutility.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';

class SelectaCategory extends StatefulWidget {
  const SelectaCategory({super.key});

  @override
  State<SelectaCategory> createState() => _SelectaCategoryState();
}

class _SelectaCategoryState extends State<SelectaCategory> {
  final List<String> categories = [
    'Specialist Services',
    'Insurance Panels',
    'Vehicle Brands',
    'Commercial Vehicle Brands',
    'Commercial Vehicle Services',
    'Regional Services',
    'Franchise & Assessment Centres',
    'Finance & Warranties',
    'Industry Organisations',
    'Industry Equipment & Services',
  ];

  final ScrollController _scrollController = ScrollController();

  // Variable to track the currently selected category
  String? selectedCategory;

  void onFilterSelected(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.36,
      height: MyUtility(context).height * 0.77,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.57, -0.82),
          end: Alignment(-0.57, 0.82),
          colors: [
            Color(0x19777777),
            Colors.white.withOpacity(0.4),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
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
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Select a Category',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.6064,
                fontFamily: 'RalewayBold',
              ),
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Only select Categories your business is ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.7364,
                      fontFamily: 'Raleway',
                    ),
                  ),
                  TextSpan(
                    text: 'officially contracted',
                    style: TextStyle(
                      color: Color(0xFFEF9040),
                      fontSize: 13.7364,
                      fontFamily: 'RalewayMedium',
                    ),
                  ),
                  TextSpan(
                    text:
                        ' to. Also upload Certificates, Documents or Letters as proof under ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.7364,
                      fontFamily: 'Raleway',
                    ),
                  ),
                  TextSpan(
                    text: '"Documents"',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.7364,
                      fontFamily: 'Raleway',
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  TextSpan(
                    text: ' section.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.7364,
                      fontFamily: 'Raleway',
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Expanded(
              child: DraggableScrollbar.rrect(
                controller: _scrollController,
                backgroundColor: Colors.grey,
                alwaysVisibleScrollThumb: true,
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    String category = categories[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Categorybutton(
                        servicesText: category,
                        isSelected: selectedCategory == category,
                        onFilterSelected: (isSelected) {
                          onFilterSelected(category);
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
