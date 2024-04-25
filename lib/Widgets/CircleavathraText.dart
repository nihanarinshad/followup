import 'package:flutter/material.dart';

class Circleavathartext extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon; // IconData for the icon
  final Color iconColor; // Color for the icon
  final String text;
  final Color backgroundColor;

  const Circleavathartext({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.iconColor,
    required this.text,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: CircleAvatar(
            backgroundColor: backgroundColor,
            radius: 30,
            child: Icon(
              icon, // Using the provided IconData for the icon
              size: 30, // Adjust size as needed
              color: iconColor, // Using the provided color for the icon
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}
