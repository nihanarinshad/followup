import 'package:flutter/material.dart';

class DateSelection extends StatefulWidget {
  @override
  _DateSelectionState createState() => _DateSelectionState();
}

class _DateSelectionState extends State<DateSelection> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _selectDate(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
        child: Container(
          height: 45,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.red, width: 2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${selectedDate.toLocal()}".split(' ')[0],
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Icon(
                Icons.calendar_today,
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
