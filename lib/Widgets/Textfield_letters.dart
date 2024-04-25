import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContainersTextfieldletters extends StatelessWidget {
  final String Textadd;
  final IconData icon;
  final TextEditingController Controllers;
  final bool onlyLetters;

  ContainersTextfieldletters({
    Key? key,
    required this.icon,
    required this.Controllers,
    required this.Textadd,
    this.onlyLetters = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Container(
        height: 45,
        child: TextFormField(
          controller: Controllers,
          style: TextStyle(fontSize: 17),
          inputFormatters: onlyLetters
              ? [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))]
              : [],
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
          validator: (value) {
            if (onlyLetters) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                return 'Please enter only letters';
              }
            } else {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
            }
            return null;
          },
        ),
      ),
    );
  }
}
