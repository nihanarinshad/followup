import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContainersNumbers extends StatelessWidget {
  final String Textadd;
  final IconData icon;
  final TextEditingController Controllers;
  final bool
      onlyNumbers; // Added boolean to determine if only numbers are allowed
  ContainersNumbers({
    Key? key,
    required this.icon,
    required this.Controllers,
    required this.Textadd,
    this.onlyNumbers = true, // Default to false, meaning allow any characters
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Container(
        height: 45,
        child: TextField(
          controller: Controllers,
          style: TextStyle(fontSize: 17),
          inputFormatters: onlyNumbers
              ? [FilteringTextInputFormatter.digitsOnly]
              : [], // Apply only if onlyNumbers is true
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: Color.fromARGB(255, 120, 119, 119),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.8),
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            hintText: Textadd,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
