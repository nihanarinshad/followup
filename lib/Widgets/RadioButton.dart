import 'package:flutter/material.dart';

class ContainersRadioButtons extends StatefulWidget {
  final List<String> items;
  final String? value;
  final ValueChanged<String?> onChanged;

  ContainersRadioButtons({
    Key? key,
    required this.items,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  _ContainersRadioButtonsState createState() => _ContainersRadioButtonsState();
}

class _ContainersRadioButtonsState extends State<ContainersRadioButtons> {
  late String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widget.items.map((item) {
        return Row(
          children: [
            Radio<String>(
              value: item,
              groupValue: _selectedValue,
              onChanged: (value) {
                setState(() {
                  _selectedValue = value;
                  widget.onChanged(value);
                });
              },
              activeColor: Colors.red, // Set the color when selected
            ),
            Text(item, style: TextStyle(color: Colors.red)),
          ],
        );
      }).toList(),
    );
  }
}
