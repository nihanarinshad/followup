import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:follow_up/Api/base_client.dart';
import 'package:follow_up/Controller/statusController.dart';
import 'package:follow_up/Function/without_icon.dart';
import 'package:follow_up/Screens/BaseScreen.dart';
import 'package:follow_up/Widgets/Dropdown.dart';
import 'package:follow_up/Widgets/RadioButton.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Controller/student_controller.dart';

class TenantStudentEdit extends StatefulWidget {
  const TenantStudentEdit({super.key});

  @override
  State<TenantStudentEdit> createState() => _StudentaddState();
}

class _StudentaddState extends State<TenantStudentEdit> {
  // TextEditingController usernamecontroller = TextEditingController();
  // TextEditingController emailcontroller = TextEditingController();
  // TextEditingController phonecontroller = TextEditingController();
  StudentController studentController = Get.put(StudentController());
  StatusController statusController = Get.put(StatusController());

  final _formKey = GlobalKey<FormState>();
  bool _buttonClicked = false;
  String? _selecteducation;
  String? _statuss;
  // DateTime? selectedDate; // Initialize selectedDate as nullable
  String? errorMessage;
  String? errorMessages;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: studentController.selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != studentController.selectedDate) {
      setState(() {
        studentController.selectedDate.value = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBarText: 'Edit Profile',
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: TextFormField(
                  controller: studentController.firstnameController,
                  decoration:
                      buildInputDecorationNOIcon(hintText: 'First Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Name';
                    } else if (value.length < 6) {
                      return 'Name must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: TextFormField(
                  controller: studentController.lastnameController,
                  decoration:
                      buildInputDecorationNOIcon(hintText: ' Last Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Name';
                    } else if (value.length < 6) {
                      return 'Name must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: TextFormField(
                  controller: studentController.emailController,
                  decoration: buildInputDecorationNOIcon(hintText: ' Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  _selectDate(context);
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Container(
                    height: 46,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.red, width: 2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              DateFormat.yMd()
                                  .format(studentController.selectedDate.value),
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Icon(
                            Icons.calendar_today,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (_buttonClicked && studentController.selectedDate == null)
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Row(
                    children: [
                      Text(
                        'Please select a date',
                        style: TextStyle(
                            color: Color.fromARGB(255, 196, 51, 40),
                            fontSize: 12),
                      ),
                    ],
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Gender',
                    // style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  ContainersRadioButtons(
                    items: ['Male ', ' Female'],
                    value: studentController.gender
                        .value, // You can set the default selected value here
                    onChanged: (newValue) {
                      studentController.gender.value = newValue!;
                      print('Selected item: $newValue');
                    },
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: TextFormField(
                  controller: studentController.phoneController,
                  decoration: buildInputDecorationNOIcon(hintText: ' Phone'),
                  keyboardType: TextInputType.number,
                  // maxLength: 10,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a phone number';
                    } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                      return 'Please enter a valid 10-digit phone number';
                    }
                    return null;
                  },
                ),
              ),
              ContainersDropdown(
                
                hinttext: ' Status ',
                items: statusController.dropDownList,
                // Dropdown items
                value: _statuss, // Selected dropdown value
                onChanged: (String? value) {
                  setState(() {
                    _statuss = value;
                  });
                },
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        _buttonClicked = true;
                      });

                      if (_formKey.currentState!.validate()) {
                        // Check if date is selected
                        if (studentController.selectedDate == null) {
                          setState(() {
                            errorMessage = 'Please select a date';
                          });
                        } else {
                          await studentController.editStudent(
                            firstname:
                                studentController.firstnameController.text,
                            email: studentController.emailController.text,
                            phone: studentController.phoneController.text,
                            gender: studentController.gender.value,
                            dob: studentController.selectedDate.value,
                            lastname: studentController.lastnameController.text,
                          );

                          Get.back();
                        }
                      }
                    },
                    child: Text('Save', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      backgroundColor: Colors.red,
                    ),
                  ),
                ),
              ),
            ])),
      ),
    );
  }
}
