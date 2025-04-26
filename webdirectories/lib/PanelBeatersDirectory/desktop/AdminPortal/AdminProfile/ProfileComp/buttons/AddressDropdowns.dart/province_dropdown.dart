import 'package:flutter/material.dart';

class ProvinceDropdown extends StatelessWidget {
  final Function(String?) onProvinceChanged;
  final String? selectedProvince;

  const ProvinceDropdown({
    Key? key,
    required this.onProvinceChanged,
    this.selectedProvince,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provinces = [
      'Eastern Cape',
      'Free State',
      'Gauteng',
      'KwaZulu-Natal',
      'Limpopo',
      'Mpumalanga',
      'North West',
      'Northern Cape',
      'Western Cape',
    ];

    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        labelText: 'Province',
        border: OutlineInputBorder(),
      ),
      value: selectedProvince ?? provinces[0],
      items: provinces
          .map((province) => DropdownMenuItem(
                value: province,
                child: Text(province),
              ))
          .toList(),
      onChanged: onProvinceChanged,
    );
  }
}
