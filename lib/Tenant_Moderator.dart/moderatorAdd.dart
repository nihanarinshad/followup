import 'package:flutter/material.dart';
import 'package:follow_up/Controller/moderator_controller.dart';
import 'package:follow_up/Function/decorationred.dart';
import 'package:follow_up/Function/without_icon.dart';
import 'package:follow_up/Screens/BaseScreen.dart';
import 'package:follow_up/Widgets/Dropdown.dart';
import 'package:follow_up/Widgets/RadioButton.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TenantModeratorAdd extends StatefulWidget {
  const TenantModeratorAdd({super.key});

  @override
  State<TenantModeratorAdd> createState() => _StudentaddState();
}

class _StudentaddState extends State<TenantModeratorAdd> {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController fistnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController dobcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  ModeratorController moderatorController = Get.put(ModeratorController());

  final _formKey = GlobalKey<FormState>();
  bool _buttonClicked = false;
  String? _selecteducation;
  String? _statuss;
  String? errorMessage;
  String? errorMessages;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: moderatorController.selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != moderatorController.selectedDate) {
      setState(() {
        moderatorController.selectedDate.value = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(moderatorController.selectedDate.value);
    return BaseScreen(
      appBarText: 'Create Profile',
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
                  controller: fistnamecontroller,
                  decoration:
                      buildInputDecorationNOIcon(hintText: 'First Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter First Name';
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
                  controller: lastnamecontroller,
                  decoration:
                      buildInputDecorationNOIcon(hintText: ' Last Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Last Name';
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
                  controller: emailcontroller,
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
                onTap: () {},
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: TextFormField(
                    controller: dobcontroller,
                    decoration: buildInputDecorationnn(
                      hintText: ' DOB',
                      icon: Icons.calendar_today_rounded,
                      onSuffixPressed: () {
                        _selectDate(context);
                        dobcontroller.text = DateFormat.yMd()
                            .format(moderatorController.selectedDate.value);
                      },
                    ),
                  ),
                ),
              ),
              if (_buttonClicked && moderatorController.selectedDate == null)
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
                    value: null, // You can set the default selected value here
                    onChanged: (newValue) {
                      moderatorController.gender.value = newValue!;
                      print('Selected item: $newValue');
                    },
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: TextFormField(
                  controller: phonecontroller,
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
              SizedBox(
                height: 30,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: TextFormField(
                  controller: usernamecontroller,
                  decoration: buildInputDecorationNOIcon(hintText: ' username'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter username';
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
                  controller: passwordcontroller,
                  decoration: buildInputDecorationNOIcon(hintText: ' password'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
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
                  controller: passwordcontroller,
                  decoration: buildInputDecorationNOIcon(
                      hintText: 'Confirmed password'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Confirmed password';
                    } else if (value.length < 6) {
                      return 'Name must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
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
                        if (moderatorController.selectedDate == null) {
                          setState(() {
                            errorMessage = 'Please select a date';
                          });
                        } else {
                          print('jjnn');
                          await moderatorController.addModerator(
                            userName: usernamecontroller.text,
                            email: emailcontroller.text,
                            phone: phonecontroller.text,
                            gender: moderatorController.gender.value,
                            dob: moderatorController.selectedDate.value,
                            password: passwordcontroller.text,
                            firstname: fistnamecontroller.text,
                            lastname: lastnamecontroller.text,
                          );

                          Get.back();
                          // studentController.updateUserList();
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
