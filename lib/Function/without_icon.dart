import 'package:flutter/material.dart';

InputDecoration buildInputDecorationNOIcon({
  required String hintText,
  Color borderColor = Colors.red, // Always use red color for border
  double borderWidth = 2,
  double focusedBorderWidth = 2,
  Color hintTextColor = Colors.grey,
  double hintFontSize = 15,
}) {
  return InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: borderColor, width: borderWidth),
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: borderColor, width: focusedBorderWidth),
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: borderColor, width: focusedBorderWidth),
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: borderColor, width: focusedBorderWidth),
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: borderColor, width: focusedBorderWidth),
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
    contentPadding: const EdgeInsets.all(10),
    // errorStyle: TextStyle(fontSize: 5), // Adjust font size here

    hintText: hintText,
    hintStyle: TextStyle(color: hintTextColor, fontSize: hintFontSize),
  );
}
