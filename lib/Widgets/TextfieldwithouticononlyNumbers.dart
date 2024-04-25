import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextfieldwithouticononlyNumbers extends StatelessWidget {
  final String Textadd;
  final TextEditingController Controllers;
  final bool onlyNumbers; // Boolean to determine if only numbers are allowed

  TextfieldwithouticononlyNumbers({
    Key? key,
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
              : [], // Apply digitsOnly formatter if onlyNumbers is true
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            hintText: Textadd,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
