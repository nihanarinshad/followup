import 'package:flutter/material.dart';
import 'package:follow_up/Screens/BaseScreen.dart';
import 'package:follow_up/Widgets/Date.dart';
import 'package:follow_up/Widgets/ElevatedButton.dart';
import 'package:follow_up/Widgets/RadioButton.dart';
import 'package:follow_up/Widgets/TextfieldwithouticononlyNumbers.dart';
import 'package:follow_up/Widgets/Textfieldwithouticononlyletters.dart';

class Partneredit extends StatefulWidget {
  const Partneredit({super.key});

  @override
  State<Partneredit> createState() => _StudentaddState();
}

class _StudentaddState extends State<Partneredit> {
  String? _selecteducation;
  String? _statuss;

  TextEditingController Name = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        body: Column(children: [
          SizedBox(
            height: 30,
          ),
          TextfieldwithouticononlyLetters(
            Controllers: Name,
            Textadd: 'Enter Name',
          ),
          TextfieldwithouticononlyLetters(
            Controllers: Email,
            Textadd: 'Enter Email',
          ),
          DateSelection(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Gender',
                // style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ContainersRadioButtons(
                items: ['Male ', ' Female'],
                value: null, // You can set the default selected value here
                onChanged: (newValue) {
                  // Handle the value change here
                  print('Selected item: $newValue');
                },
              ),
            ],
          ),
          TextfieldwithouticononlyNumbers(
            Controllers: Phone,
            Textadd: 'Enter phone',
          ),
          // ContainersDropdown(
          //   hinttext: ' Education Qualification ',
          //   items: ['Pg', 'Degree', '+2'], // Dropdown items
          //   value: _selecteducation, // Selected dropdown value
          //   onChanged: (String? value) {
          //     setState(() {
          //       _selecteducation = value;
          //     });
          //   },
          // ),
          // ContainersDropdown(
          //   hinttext: ' Status ',
          //   items: ['pending', 'paid'], // Dropdown items
          //   value: _statuss, // Selected dropdown value
          //   onChanged: (String? value) {
          //     setState(() {
          //       _statuss = value;
          //     });
          //   },
          // ),
          SizedBox(
            height: 30,
          ),
          CustomElevatedButton(
            onPressed: () {
              // Get.to(S());
            },
            text: 'Save',
          )
        ]),
        appBarText: 'Create Profile');
  }
}
