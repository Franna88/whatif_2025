import 'package:flutter/material.dart';

class CountryDropdown extends StatelessWidget {
  final Function(String?) onCountryChanged;

  const CountryDropdown({Key? key, required this.onCountryChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        labelText: 'Country',
        border: OutlineInputBorder(),
      ),
      value: 'South Africa',
      items: const [
        DropdownMenuItem(
          value: 'South Africa',
          child: Text('South Africa'),
        ),
      ],
      onChanged: onCountryChanged,
    );
  }
}
