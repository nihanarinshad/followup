import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextfieldwithouticononlyLetters extends StatefulWidget {
  final String Textadd;
  final TextEditingController Controllers;
  final bool onlyLetters;

  TextfieldwithouticononlyLetters({
    Key? key,
    required this.Controllers,
    required this.Textadd,
    this.onlyLetters = false,
  }) : super(key: key);

  @override
  _TextfieldwithouticononlyLettersState createState() =>
      _TextfieldwithouticononlyLettersState();
}

class _TextfieldwithouticononlyLettersState
    extends State<TextfieldwithouticononlyLetters> {
  String? _errorText;

  String? _validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (widget.onlyLetters && !RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return 'Please enter only letters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 45,
            child: TextFormField(
              controller: widget.Controllers,
              style: TextStyle(fontSize: 17),
              inputFormatters: widget.onlyLetters
                  ? [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))]
                  : [],
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                hintText: widget.Textadd,
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                errorText: _errorText,
              ),
              onChanged: (value) {
                setState(() {
                  _errorText = _validateInput(value);
                });
              },
            ),
          ),
          if (_errorText != null)
            Text(
              _errorText!,
              style: TextStyle(color: Colors.red),
            ),
        ],
      ),
    );
  }
}
