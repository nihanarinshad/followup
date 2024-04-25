import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:follow_up/Api/base_client.dart';
import 'package:follow_up/Function/decoration.dart';

import 'package:intl/intl.dart';

class RegisterContainers extends StatefulWidget {
  const RegisterContainers({Key? key}) : super(key: key);

  @override
  State<RegisterContainers> createState() => _RegisterContainersState();
}

class _RegisterContainersState extends State<RegisterContainers> {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController dobcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();

  bool _passwordVisible = false; // Track whether password is visible or not
  bool _passwordVisibles = false;
  String _password = '';
  String _confirmPassword = '';

  final _formKey = GlobalKey<FormState>();
  bool _buttonClicked = false;

  DateTime? selectedDate; // Initialize selectedDate as nullable
  String? errorMessage;
  String? errorMessages;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: TextFormField(
              controller: usernamecontroller,
              decoration: buildInputDecoration(
                  icon: Icons.person_2_outlined, hintText: ' Name'),
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
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: TextFormField(
              controller: emailcontroller,
              decoration: buildInputDecoration(
                  icon: Icons.mail_outline_outlined, hintText: ' Email'),
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: TextFormField(
              controller: phonecontroller,
              decoration: buildInputDecoration(
                  icon: Icons.call, iconColor: Colors.grey, hintText: ' Phone'),
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
          GestureDetector(
            onTap: () {
              _selectDate(context);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
              child: Container(
                height: 46,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.red, width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        selectedDate != null
                            ? DateFormat.yMd().format(selectedDate!)
                            : "DOD", // Display formatted date if selectedDate is not null, else display empty string
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (_buttonClicked && selectedDate == null)
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                children: [
                  Text(
                    'Please select a date',
                    style: TextStyle(
                        color: Color.fromARGB(255, 196, 51, 40), fontSize: 12),
                  ),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: TextFormField(
                controller: passwordcontroller,
                obscureText: !_passwordVisible, // Toggle visibility

                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: Color.fromARGB(255, 120, 119, 119),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _passwordVisible =
                            !_passwordVisible; // Toggle visibility
                      });
                    },
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                      size: 25,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1.8),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1.8),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1.8),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1.8),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 5.0),
                  hintText: ' Password',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required. Please enter.';
                  }
                  if (value.length < 8) {
                    return 'Password must be at least 8 characters long.';
                  }
                  // You can add more validations here, such as complexity requirements.

                  return null;
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: TextFormField(
                controller: confirmpasswordcontroller,
                obscureText: !_passwordVisibles, // Toggle visibility

                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: Color.fromARGB(255, 120, 119, 119),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _passwordVisibles =
                            !_passwordVisibles; // Toggle visibility
                      });
                    },
                    icon: Icon(
                      _passwordVisibles
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                      size: 25,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1.8),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1.8),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1.8),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1.8),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 5.0),
                  hintText: 'Confirm Password',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                onChanged: (value) {
                  setState(() {
                    _confirmPassword = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Confirm password is required. Please enter.';
                  }
                  if (value != _password) {
                    return 'Confirm password does not match.';
                  }
                  return null;
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
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
                    if (selectedDate == null) {
                      setState(() {
                        errorMessage = 'Please select a date';
                      });
                    } else {
                      HttpBaseClient baseClient = HttpBaseClient();
                      Map<String, String> headers = {
                        'content-Type': 'application/json',
                        'Charset': 'utf-8'
                      };
                      Map<String, dynamic> body = {
                        "username": usernamecontroller.text,
                        "email": emailcontroller.text,
                        "phone": phonecontroller.text,
                        "password_hash": passwordcontroller.text
                      };
                      print(passwordcontroller.text);
                      var requestBody = jsonEncode(body);
                      var response = await baseClient.postRequest(
                          'register', headers, requestBody);
                      // print(response);
                    }
                  }
                },
                child: Text('Register', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  backgroundColor: Colors.red,
                ),
              ),
            ),
          ),
        ]));
  }
}
