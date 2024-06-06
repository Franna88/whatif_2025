import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/AccreditationService/AccreditationFilter/AccreditationFilterComp/FilterButton.dart';
import 'package:webdirectories/myutility.dart';

class AccreditationFilter extends StatefulWidget {
  const AccreditationFilter({super.key});

  @override
  State<AccreditationFilter> createState() => _AccreditationFilterState();
}

class _AccreditationFilterState extends State<AccreditationFilter> {
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
                      color: Colors.white.withOpacity(0.8999999761581421),
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
          FilterButton(
            servicesText: 'Specialist Services',
          ),
          FilterButton(
            servicesText: 'Insurance Panels',
          ),
          FilterButton(
            servicesText: 'Vehicle Brands',
          ),
          FilterButton(
            servicesText: 'Commercial Vehicle Brands',
          ),
          FilterButton(
            servicesText: 'Commercial Vehicle Services',
          ),
          FilterButton(
            servicesText: 'Regional Services',
          ),
          FilterButton(
            servicesText: 'Franchises & Assessment Centres',
          ),
          FilterButton(
            servicesText: 'Finance & Warranties ',
          ),
          FilterButton(
            servicesText: 'Industry Organisations',
          ),
          FilterButton(
            servicesText: 'Industry Equipment & Services',
          ),
        ],
      ),
    );
  }
}
