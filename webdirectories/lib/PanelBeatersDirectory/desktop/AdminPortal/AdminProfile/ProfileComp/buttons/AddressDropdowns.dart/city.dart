import 'package:flutter/material.dart';

class CityDropdown extends StatelessWidget {
  final Function(String?) onCityChanged;
  final String? selectedCity;

  const CityDropdown({
    Key? key,
    required this.onCityChanged,
    this.selectedCity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List of major cities in South Africa
    final cities = [
      'Johannesburg',
      'Cape Town',
      'Durban',
      'Pretoria',
      'Port Elizabeth',
      'Bloemfontein',
      'East London',
      'Kimberley',
      'Polokwane',
      'Nelspruit',
      'Rustenburg',
      'Other'
    ];

    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        labelText: 'City',
        border: OutlineInputBorder(),
      ),
      value: selectedCity ?? cities[0],
      items: cities
          .map((city) => DropdownMenuItem(
                value: city,
                child: Text(city),
              ))
          .toList(),
      onChanged: onCityChanged,
    );
  }
}
