import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomElevatedButton({
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
            child: ElevatedButton(
              onPressed: onPressed,
              child: Text(text, style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                backgroundColor: Colors.red,
              ),
            )));
  }

  String getText() {
    return text;
  }
}
