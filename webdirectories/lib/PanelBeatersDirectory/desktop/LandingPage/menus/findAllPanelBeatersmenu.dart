import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/dropDownMenus/dropDownMenuWidget.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/mainButtonDirect.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/mainButtonDropdown.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/menuIndexWidget.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/searchButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/setYourLocationButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/textfieldButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesNearMe/ServicesNearMe.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/addressAutoCompleteField.dart';

class FindAllPanelBeaters extends StatefulWidget {
  final VoidCallback viewServiceDetails;
  final VoidCallback viewServicebyArea;
  final Function(Map<String, dynamic>) viewServiceByAddress;
  final VoidCallback viewServiceByKeyword;

  const FindAllPanelBeaters({
    super.key,
    required this.viewServiceDetails,
    required this.viewServiceByAddress,
    required this.viewServiceByKeyword,
    required this.viewServicebyArea,
  });

  @override
  State<FindAllPanelBeaters> createState() => _FindAllPanelBeatersState();
}

class _FindAllPanelBeatersState extends State<FindAllPanelBeaters> {
  int menuIndex = 2;
  int? currentOpenDropdown;
  String nearMeText = 'Click here to set your location';
  Map<String, dynamic> address = {};

  void toggleDropdown(int index) {
    setState(() {
      if (currentOpenDropdown == index) {
        currentOpenDropdown = null;
      } else {
        currentOpenDropdown = index;
      }
    });
  }

  void selectAddress(Map<String, dynamic> data) {
    print(data);
    setState(() {
      address = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool locationSet = false;
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        MenuIndexWidget(menuIndex: menuIndex),
        const Text(
          'Find All Panel Beaters',
          style: TextStyle(
              fontSize: 34,
              fontFamily: 'ralewaybold',
              color: Color.fromARGB(255, 255, 255, 255)),
        ),
        const SizedBox(
          height: 15,
        ),
        MainButton(
          buttonTitle: 'Near Me',
          dropdownContent: DropDownMenuWidget(
            topText: 'Find your nearest Panel Beater',
            widget1: SetYourLoactionButton(),
            widget2: SearchButton(
              onTap: widget.viewServiceDetails,
            ),
          ),
          isOpen: currentOpenDropdown == 0,
          onToggle: () => toggleDropdown(0),
        ),
        const SizedBox(
          height: 15,
        ),
        MainButton(
          buttonTitle: 'Any City or Street Address',
          dropdownContent: DropDownMenuWidget(
              topText: 'Find a Panel Beater by street',
              widget1: AddressAutoCompleteField(
                onSelected: selectAddress,
              ),
              widget2: SearchButton(
                onTap: () => widget.viewServiceByAddress(address),
              )),
          isOpen: currentOpenDropdown == 1,
          onToggle: () => toggleDropdown(1),
        ),
        const SizedBox(
          height: 15,
        ),
        MainButton(
          buttonTitle: 'Keyword Search',
          dropdownContent: const DropDownMenuWidget(
              topText: 'Search by keywords within Panel Beater Directory',
              widget1: TextfieldButton(hintText: 'Type here'),
              widget2: SearchButton()),
          isOpen: currentOpenDropdown == 2,
          onToggle: () => toggleDropdown(2),
        ),
        const SizedBox(
          height: 15,
        ),
        MainButtonDirect(
          onTap: widget.viewServicebyArea,
          buttonTitle: 'Area Search',
        ),
        const SizedBox(
          height: 25,
        )
      ],
    );
  }
}
