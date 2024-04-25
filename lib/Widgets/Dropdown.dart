import 'package:flutter/material.dart';

class ContainersDropdown extends StatelessWidget {
  final List items;
  final String hinttext;
  final String? value;
  final ValueChanged<String?> onChanged;

  ContainersDropdown({
    Key? key,
    required this.hinttext,
    required this.items,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 15),
      child: Container(
        height: 50,
        child: Row(
          children: [
            SizedBox(width: 10),
            Expanded(
              child: DropdownButtonFormField<String>(
                value: value,
                onChanged: onChanged,
                items: items.map((value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  hintStyle: TextStyle(
                      color: Colors.grey, fontSize: 14), // Set hint text color
                  hintText: hinttext, // Set hint text
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
