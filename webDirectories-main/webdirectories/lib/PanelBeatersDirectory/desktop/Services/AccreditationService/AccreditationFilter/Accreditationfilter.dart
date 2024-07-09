import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/AccreditationService/AccreditationFilter/AccreditationFilterComp/FilterButton.dart';
import 'package:webdirectories/myutility.dart';

class AccreditationFilter extends StatefulWidget {
  const AccreditationFilter({Key? key}) : super(key: key);

  @override
  State<AccreditationFilter> createState() => _AccreditationFilterState();
}

class _AccreditationFilterState extends State<AccreditationFilter> {
  String? _selectedFilter;

  void _onFilterSelected(String filter) {
    setState(() {
      _selectedFilter = filter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.42,
      height: MyUtility(context).height * 0.715,
      decoration: ShapeDecoration(
        color: Color(0xFF181B1D),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 35,
              ),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'View Available Services:',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: MyUtility(context).width * 0.014,
                      fontFamily: 'raleway',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              FilterButton(
                servicesText: 'Specialist Services',
                isSelected: _selectedFilter == 'Specialist Services',
                onFilterSelected: _onFilterSelected,
              ),
              FilterButton(
                servicesText: 'Insurance Panels',
                isSelected: _selectedFilter == 'Insurance Panels',
                onFilterSelected: _onFilterSelected,
              ),
              FilterButton(
                servicesText: 'Vehicle Brands',
                isSelected: _selectedFilter == 'Vehicle Brands',
                onFilterSelected: _onFilterSelected,
              ),
              FilterButton(
                servicesText: 'Commercial Vehicle Brands',
                isSelected: _selectedFilter == 'Commercial Vehicle Brands',
                onFilterSelected: _onFilterSelected,
              ),
              FilterButton(
                servicesText: 'Commercial Vehicle Services',
                isSelected: _selectedFilter == 'Commercial Vehicle Services',
                onFilterSelected: _onFilterSelected,
              ),
              FilterButton(
                servicesText: 'Regional Services',
                isSelected: _selectedFilter == 'Regional Services',
                onFilterSelected: _onFilterSelected,
              ),
              FilterButton(
                servicesText: 'Franchises & Assessment Centres',
                isSelected:
                    _selectedFilter == 'Franchises & Assessment Centres',
                onFilterSelected: _onFilterSelected,
              ),
              FilterButton(
                servicesText: 'Finance & Warranties ',
                isSelected: _selectedFilter == 'Finance & Warranties ',
                onFilterSelected: _onFilterSelected,
              ),
              FilterButton(
                servicesText: 'Industry Organisations',
                isSelected: _selectedFilter == 'Industry Organisations',
                onFilterSelected: _onFilterSelected,
              ),
              FilterButton(
                servicesText: 'Industry Equipment & Services',
                isSelected: _selectedFilter == 'Industry Equipment & Services',
                onFilterSelected: _onFilterSelected,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
