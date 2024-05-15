import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:follow_up/Controller/package_controller.dart';
import 'package:follow_up/Controller/statusController.dart';
import 'package:follow_up/Function/decoration.dart';
import 'package:follow_up/Function/without_icon.dart';
import 'package:follow_up/Screens/BaseScreen.dart';
import 'package:follow_up/Widgets/Dropdown.dart';
import 'package:follow_up/Widgets/ElevatedButton.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:toggle_switch/toggle_switch.dart';

class TenantPackagesadd extends StatefulWidget {
  const TenantPackagesadd({Key? key}) : super(key: key);

  @override
  State<TenantPackagesadd> createState() => _PackagesaddState();
}

class _PackagesaddState extends State<TenantPackagesadd> {
  final _formKey = GlobalKey<FormState>(); // Add a GlobalKey for the Form

  PackageController packageController = Get.put(PackageController());
  StatusController statusController = Get.put(StatusController());
  List<String> durationOptions = ["Year", "Month"];
  List<String> paymentOptions = ["Credit Card", "PayPal"];

  String? _selectedDuration;
  String? _selectedPayment;

  // ModeratorStudentController moderatorStudentController =
  //     Get.put(ModeratorStudentController());

  List dropDownList = [];

  late int indexValuess = 0;

  String? _duration;
  File? _selectedFile;

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    } else {
      print('User canceled file picking.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBarText: 'Package',
      body: SingleChildScrollView(
        child: Form(
          // Wrap your Column with a Form widget and provide the GlobalKey
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 50),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: TextFormField(
                  controller: packageController.PackageNamecontroller,
                  decoration:
                      buildInputDecorationNOIcon(hintText: 'Package Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Package Name';
                    } else if (value.length < 3) {
                      return 'Package Name must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
              ),
              ContainersDropdown(
                hinttext: 'Duration Month/Year',
                items: durationOptions,
                value: _selectedDuration,
                onChanged: (String? value) {
                  setState(() {
                    _selectedDuration = value;
                  });
                },
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: TextFormField(
                  controller: packageController.periodcontroller,
                  decoration: buildInputDecorationNOIcon(hintText: 'Period'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Period';
                    } else if (value.length < 1) {
                      return 'Amount must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: TextFormField(
                  controller: packageController.Descriptioncontroller,
                  decoration:
                      buildInputDecorationNOIcon(hintText: 'Description'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Description';
                    } else if (value.length < 6) {
                      return 'Description must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.red, width: 2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: _pickFile,
                        icon: Icon(Icons.file_present_outlined,
                            size: 30, color: Colors.red),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Choose File',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
              _selectedFile != null
                  ? Text('Selected File: ${_selectedFile!.path}')
                  : SizedBox(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: TextFormField(
                  controller: packageController.Amountcontroller,
                  decoration: buildInputDecorationNOIcon(hintText: 'Amount'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Amount';
                    } else if (value.length < 6) {
                      return 'Amount must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
              ),
              ContainersDropdown(
                hinttext: 'Payment Method',
                items: paymentOptions,
                value: _selectedPayment,
                onChanged: (String? value) {
                  setState(() {
                    _selectedPayment = value;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 50, right: 50, top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Enabled',
                      style: TextStyle(color: Colors.grey),
                    ),
                    ToggleSwitch(
                      minWidth: 60.0,
                      cornerRadius: 20.0,
                      activeBgColors: [
                        [Colors.red[800]!],
                        [Colors.red[800]!]
                      ],
                      activeFgColor: Colors.white,
                      inactiveBgColor: Colors.grey,
                      inactiveFgColor: Colors.white,
                      initialLabelIndex: indexValuess,
                      totalSwitches: 2,
                      labels: ['Yes', 'No'],
                      radiusStyle: true,
                      onToggle: (index) {
                        print('switched to: $index');
                        indexValuess = index!;

                        setState(() {});
                      },
                    ),
                  ],
                ),
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
                        // Check if date is selected

                        print('jjnn');
                        packageController.addPackages(
                          packagename:
                              packageController.PackageNamecontroller.text,
                          period: int.parse(
                              packageController.periodcontroller.text),
                          discription:
                              packageController.Descriptioncontroller.text,
                          amount: int.parse(
                              packageController.Amountcontroller.text),
                          paymenttype: _selectedPayment.toString(),
                          subscrtype: _selectedDuration.toString(),
                        );

                        Get.back();
                        // studentController.updateUserList();
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
            ],
          ),
        ),
      ),
    );
  }
}
