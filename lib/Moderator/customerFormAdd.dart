import 'package:flutter/material.dart';
import 'package:follow_up/Screens/BaseScreen.dart';
import 'package:follow_up/Widgets/Dropdown.dart';
import 'package:follow_up/Widgets/ElevatedButton.dart';
import 'package:follow_up/Widgets/TextfieldwithouticononlyNumbers.dart';
import 'package:follow_up/Widgets/Textfieldwithouticononlyletters.dart';
import 'package:follow_up/Widgets/Unfilledelevatedbutton.dart';

class ModeratorCustomerFormAdd extends StatefulWidget {
  const ModeratorCustomerFormAdd({super.key});

  @override
  State<ModeratorCustomerFormAdd> createState() => _CustomerFormAddState();
}

class _CustomerFormAddState extends State<ModeratorCustomerFormAdd> {
  String? _selectedDropdownValue;

  TextEditingController Formname = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        appBarText: 'Formadd Setup',
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              TextfieldwithouticononlyNumbers(
                  Controllers: Formname, Textadd: 'Enter Form Name'),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(20),
                      border: Border.all(color: Colors.red, width: 1)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      TextfieldwithouticononlyLetters(
                          Controllers: Formname, Textadd: ' Field Name'),
                      // ContainersDropdown(
                      //   hinttext: ' Field Type ',
                      //   items: ['Text', 'Radio', 'Date'], // Dropdown items
                      //   value:
                      //       _selectedDropdownValue, // Selected dropdown value
                      //   onChanged: (String? value) {
                      //     setState(() {
                      //       _selectedDropdownValue = value;
                      //     });
                      //   },
                      // ),
                      TextfieldwithouticononlyNumbers(
                          Controllers: Formname, Textadd: 'Default Value'),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Icon',
                              style: TextStyle(fontSize: 15),
                            ),
                            Icon(
                              Icons.download_outlined,
                              color: Colors.red,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 20, left: 130, bottom: 30),
                        child: CustomElevatedButton(
                          onPressed: () {},
                          text: 'Add More',
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Unfilledelevatedbutton(
                onPressed: () {},
                text: 'Save',
              )
            ],
          ),
        ));
  }
}
