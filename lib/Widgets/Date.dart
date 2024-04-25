import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateSelection extends StatefulWidget {
  @override
  _DateSelectionState createState() => _DateSelectionState();
}

class _DateSelectionState extends State<DateSelection> {
  DateTime? selectedDate;
  String? errorMessage;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(), // Set minimum date to current date
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        errorMessage = null; // Reset error message if date is selected
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            _selectDate(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Container(
              height: 48,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.red, width: 2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedDate != null
                        ? DateFormat.yMd().format(selectedDate!)
                        : "Date",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.calendar_today,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ),
        ),
        if (errorMessage != null)
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              errorMessage!,
              style: TextStyle(color: Colors.red),
            ),
          ),
        // ElevatedButton(
        //   onPressed: () {
        //     // Function to clear selected date
        //     setState(() {
        //       selectedDate = null;
        //     });
        //   },
        //   child: Text('Clear Date'),
        // ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Date Selection Example'),
      ),
      body: Center(
        child: DateSelection(),
      ),
    ),
  ));
}
