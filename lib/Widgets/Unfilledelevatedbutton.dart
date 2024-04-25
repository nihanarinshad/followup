import 'package:flutter/material.dart';

class Unfilledelevatedbutton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const Unfilledelevatedbutton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Container(
        height: 45,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.red, width: 2), // Add red border
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(color: Colors.red),
          ),
          style: ElevatedButton.styleFrom(
            // primary: Colors.transparent, // Set button color to transparent
            elevation: 0, // Remove button elevation
            shape: StadiumBorder(),
          ),
        ),
      ),
    );
  }
}
