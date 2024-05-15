import 'package:flutter/material.dart';
import 'package:follow_up/Controller/customerForm.dart';
import 'package:follow_up/Function/without_icon.dart';
import 'package:follow_up/Screens/BaseScreen.dart';
import 'package:follow_up/Widgets/ElevatedButton.dart';
import 'package:get/get.dart';

class CustomerFormEdit extends StatefulWidget {
  const CustomerFormEdit({super.key});

  @override
  State<CustomerFormEdit> createState() => _StudentaddState();
}

class _StudentaddState extends State<CustomerFormEdit> {
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastname = TextEditingController();

  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  CustomerFormController customerFormController =
      Get.put(CustomerFormController());

  // ModeratorStudentController moderatorStudentController =
  //     Get.put(ModeratorStudentController());

  List dropDownList = [];

  final _formKey = GlobalKey<FormState>();
  bool _isRequiredChecked = false;
  bool _isRegistrChecked = false;
  bool _isActiveChecked = false;
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBarText: 'Form Set Up',
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(children: [
              SizedBox(
                height: 30,
              ),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
                        child: TextFormField(
                          controller: customerFormController.fieldname,
                          decoration: buildInputDecorationNOIcon(
                              hintText: 'Field name'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Fieldname';
                            } else if (value.length < 4) {
                              return 'Name must be at least 4 characters long';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
                        child: TextFormField(
                          controller: customerFormController.fieldType,
                          decoration: buildInputDecorationNOIcon(
                              hintText: 'Field Type'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter FieldType';
                            } else if (value.length < 4) {
                              return 'Name must be at least 4 characters long';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
                        child: TextFormField(
                          controller: customerFormController.defaultvalue,
                          decoration: buildInputDecorationNOIcon(
                              hintText: 'Default value'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Default Value';
                            } else if (value.length < 1) {
                              return 'Name must be at least 1 characters long';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15),
                        child: ListTile(
                          title: Text(
                            'Required',
                            style: TextStyle(color: Colors.grey),
                          ),
                          trailing: Checkbox(
                            value: _isRequiredChecked,
                            onChanged: (value) {
                              setState(() {
                                _isRequiredChecked = value!;
                              });
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15),
                        child: ListTile(
                          title: Text(
                            'Registration Form',
                            style: TextStyle(color: Colors.grey),
                          ),
                          trailing: Checkbox(
                            value: _isRegistrChecked,
                            onChanged: (value) {
                              setState(() {
                                _isRegistrChecked = value!;
                              });
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15),
                        child: ListTile(
                          title: Text(
                            'Is Active',
                            style: TextStyle(color: Colors.grey),
                          ),
                          trailing: Checkbox(
                            value: _isActiveChecked,
                            onChanged: (value) {
                              setState(() {
                                _isActiveChecked = value!;
                              });
                            },
                          ),
                        ),
                      ),
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
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
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
                      if (_formKey.currentState!.validate()) {
                        await customerFormController.editStudent(
                            field_name: customerFormController.fieldname.text,
                            field_type: customerFormController.fieldType.text,
                            defalut_value:
                                customerFormController.defaultvalue.text,
                            required: _isRequiredChecked.toString(),
                            include_in_reg_form: _isRegistrChecked.toString(),
                            is_active: _isActiveChecked.toString());

                        Get.back();
                      } // studentController.updateUserList();
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
