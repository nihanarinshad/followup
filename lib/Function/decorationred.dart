import 'package:flutter/material.dart';

InputDecoration buildInputDecorationnn({
  required IconData icon,
  required String hintText,
  required void Function()?
      onSuffixPressed, // Function to handle suffix icon press
  Color iconColor = Colors.red,
  Color borderColor = Colors.red, // Always use red color for border
  double borderWidth = 2,
  double focusedBorderWidth = 2,
  Color hintTextColor = Colors.grey,
  double hintFontSize = 15,
}) {
  return InputDecoration(
    suffixIcon: IconButton(
      onPressed: onSuffixPressed,
      icon: Icon(icon, color: iconColor),
    ), // Suffix Icon Button
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
    contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
    hintText: hintText,
    hintStyle: TextStyle(color: hintTextColor, fontSize: hintFontSize),
  );
}
