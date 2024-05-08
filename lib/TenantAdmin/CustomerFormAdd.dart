import 'package:flutter/material.dart';
import 'package:follow_up/Controller/customerForm.dart';
import 'package:follow_up/Controller/hiveListView.dart';
import 'package:follow_up/Controller/statusController.dart';
import 'package:follow_up/Controller/student_controller.dart';
import 'package:follow_up/Function/without_icon.dart';
import 'package:follow_up/Model/status_details.dart';
import 'package:follow_up/Screens/BaseScreen.dart';
import 'package:follow_up/Widgets/Dropdown.dart';
import 'package:follow_up/Widgets/RadioButton.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CustomerFormAdd extends StatefulWidget {
  const CustomerFormAdd({super.key});

  @override
  State<CustomerFormAdd> createState() => _StudentaddState();
}

class _StudentaddState extends State<CustomerFormAdd> {
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

  @override
  Widget build(BuildContext context) {
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
                  controller: customerFormController.formname,
                  decoration: buildInputDecorationNOIcon(hintText: 'Form name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Name';
                    } else if (value.length < 2) {
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
                  controller: customerFormController.fieldname,
                  decoration:
                      buildInputDecorationNOIcon(hintText: 'Field name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter fieldname';
                    } else if (value.length < 2) {
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
                  controller: customerFormController.fieldType,
                  decoration:
                      buildInputDecorationNOIcon(hintText: 'Field Type'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter fieldType';
                    } else if (value.length < 2) {
                      return 'Name must be at least 2 characters long';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: TextFormField(
                  controller: customerFormController.defaultvalue,
                  decoration:
                      buildInputDecorationNOIcon(hintText: 'Default value'),
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
                  controller: customerFormController.required,
                  decoration: buildInputDecorationNOIcon(hintText: 'Required'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter required';
                    } else if (value.length < 2) {
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
                  controller: customerFormController.include,
                  decoration: buildInputDecorationNOIcon(hintText: 'Include'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter include';
                    } else if (value.length < 3) {
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
                  controller: customerFormController.modefied,
                  decoration: buildInputDecorationNOIcon(hintText: ' Modefied'),
                  keyboardType: TextInputType.number,
                  // maxLength: 10,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a phone modefied';
                    } else if (!RegExp(r'^\d{1}$').hasMatch(value)) {
                      return 'Please enter a valid 1-digit phone number';
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
                      await customerFormController.addForm(
                        fieldname: customerFormController.fieldname.text,
                        formname: customerFormController.formname.text,
                        fieldType: customerFormController.fieldType.text,
                        defaultvalue: customerFormController.defaultvalue.text,
                        required: customerFormController.required.text,
                        include: customerFormController.include.text,
                        modefied:
                            int.parse(customerFormController.modefied.text),
                      );

                      Get.back();
                      // studentController.updateUserList();
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




// import 'package:flutter/material.dart';
// import 'package:follow_up/Screens/BaseScreen.dart';
// import 'package:follow_up/Widgets/Dropdown.dart';
// import 'package:follow_up/Widgets/ElevatedButton.dart';
// import 'package:follow_up/Widgets/TextfieldwithouticononlyNumbers.dart';
// import 'package:follow_up/Widgets/Textfieldwithouticononlyletters.dart';
// import 'package:follow_up/Widgets/Unfilledelevatedbutton.dart';

// class CustomerFormAdd extends StatefulWidget {
//   const CustomerFormAdd({super.key});

//   @override
//   State<CustomerFormAdd> createState() => _CustomerFormAddState();
// }

// class _CustomerFormAddState extends State<CustomerFormAdd> {
//   String? _selectedDropdownValue;

//   TextEditingController Formname = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return BaseScreen(
//         appBarText: 'Formadd Setup',
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 30,
//               ),
//               TextfieldwithouticononlyNumbers(
//                   Controllers: Formname, Textadd: 'Enter Form Name'),
//               Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadiusDirectional.circular(20),
//                       border: Border.all(color: Colors.red, width: 1)),
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: 30,
//                       ),
//                       TextfieldwithouticononlyLetters(
//                           Controllers: Formname, Textadd: ' Field Name'),
//                       // ContainersDropdown(
//                       //   hinttext: ' Field Type ',
//                       //   items: ['Text', 'Radio', 'Date'], // Dropdown items
//                       //   value:
//                       //       _selectedDropdownValue, // Selected dropdown value
//                       //   onChanged: (String? value) {
//                       //     setState(() {
//                       //       _selectedDropdownValue = value;
//                       //     });
//                       //   },
//                       // ),
//                       TextfieldwithouticononlyNumbers(
//                           Controllers: Formname, Textadd: 'Default Value'),
//                       Padding(
//                         padding: const EdgeInsets.all(12.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Icon',
//                               style: TextStyle(fontSize: 15),
//                             ),
//                             Icon(
//                               Icons.download_outlined,
//                               color: Colors.red,
//                             )
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(
//                             right: 20, left: 130, bottom: 30),
//                         child: CustomElevatedButton(
//                           onPressed: () {},
//                           text: 'Add More',
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               Unfilledelevatedbutton(
//                 onPressed: () {},
//                 text: 'Save',
//               )
//             ],
//           ),
//         ));
//   }
// }
