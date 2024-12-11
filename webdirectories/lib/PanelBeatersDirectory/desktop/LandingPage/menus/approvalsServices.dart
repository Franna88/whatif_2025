import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/Approvals&Services/custom_menu_scroll_dropdown.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/Approvals&Services/mainBlackButtonDropdown.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/dropDownMenus/dropDownMenuWidget.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/mainButtonDropdown.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/menuIndexWidget.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/searchButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/setYourLocationButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/textfieldButton.dart';

class ApprovalsServices extends StatefulWidget {
  const ApprovalsServices({super.key});

  @override
  State<ApprovalsServices> createState() => _ApprovalsServicesState();
}

class _ApprovalsServicesState extends State<ApprovalsServices> {
  int menuIndex = 3;
  int? currentOpenDropdown;
  bool isOrangeColumnVisible = true;
  bool isBlackDropdownSelected = false;

  void toggleDropdown(int index) {
    setState(() {
      if (currentOpenDropdown == index) {
        currentOpenDropdown = null;
      } else {
        currentOpenDropdown = index;
      }
    });
  }

  void onDropdownSelection(String value) {
    setState(() {
      isBlackDropdownSelected = true;
    });
  }

  void onSearchButtonPressed() {
    setState(() {
      isOrangeColumnVisible = false; // Hide the orange column
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        MenuIndexWidget(menuIndex: menuIndex),
        const Text(
          'Approvals & Services',
          style: TextStyle(
              fontSize: 34,
              fontFamily: 'ralewaybold',
              color: Color.fromARGB(255, 255, 255, 255)),
        ),
        const SizedBox(
          height: 15,
        ),
        Visibility(
          visible: isOrangeColumnVisible, // Show orange column conditionally
          child: Column(
            children: [
              MainButton(
                buttonTitle: 'Near Me',
                dropdownContent: DropDownMenuWidget(
                  topText: 'Find your nearest Panel Beater',
                  widget1: const SetYourLoactionButton(),
                  widget2: SearchButton(
                    onTap: onSearchButtonPressed, // Trigger state change
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
                  widget1: const TextfieldButton(
                      hintText: 'Type any street address here'),
                  widget2: SearchButton(
                    onTap: onSearchButtonPressed, // Trigger state change
                  ),
                ),
                isOpen: currentOpenDropdown == 1,
                onToggle: () => toggleDropdown(1),
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
        Visibility(
          visible: !isOrangeColumnVisible, // Show black column conditionally
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0, bottom: 10),
                child: const Text(
                  'Please select one option from the drop down list below',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'raleway',
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
              MainBlackButtonDropdown(
                buttonTitle: 'Special Services',
                customScrollDropdownContent: CustomMenuScrollDropdown(
                  onSelection: onDropdownSelection,
                ),
                isOpen: currentOpenDropdown == 1,
                onToggle: () => toggleDropdown(1),
              ),
              const SizedBox(
                height: 15,
              ),
              MainBlackButtonDropdown(
                buttonTitle: 'Insurance Panel',
                customScrollDropdownContent: CustomMenuScrollDropdown(
                  onSelection: onDropdownSelection,
                ),
                isOpen: currentOpenDropdown == 2,
                onToggle: () => toggleDropdown(2),
              ),
              const SizedBox(
                height: 15,
              ),
              MainBlackButtonDropdown(
                buttonTitle: 'Vehicle Brand',
                customScrollDropdownContent: CustomMenuScrollDropdown(
                  onSelection: onDropdownSelection,
                ),
                isOpen: currentOpenDropdown == 3,
                onToggle: () => toggleDropdown(3),
              ),
              const SizedBox(
                height: 15,
              ),
              MainBlackButtonDropdown(
                buttonTitle: 'Commercial Vehicle Brand',
                customScrollDropdownContent: CustomMenuScrollDropdown(
                  onSelection: onDropdownSelection,
                ),
                isOpen: currentOpenDropdown == 4,
                onToggle: () => toggleDropdown(4),
              ),
              const SizedBox(
                height: 15,
              ),
              MainBlackButtonDropdown(
                buttonTitle: 'Commercial Vehicle Services',
                customScrollDropdownContent: CustomMenuScrollDropdown(
                  onSelection: onDropdownSelection,
                ),
                isOpen: currentOpenDropdown == 5,
                onToggle: () => toggleDropdown(5),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Visibility(
                  visible: isBlackDropdownSelected,
                  child: SearchButton(
                    isComingSoon: true,
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
