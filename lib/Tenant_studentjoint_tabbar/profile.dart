import 'package:flutter/material.dart';
import 'package:follow_up/Controller/student_controller.dart';
import 'package:follow_up/Widgets/ElevatedButton.dart';
import 'package:follow_up/Widgets/Unfilledelevatedbutton.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

class TSprofile extends StatefulWidget {
  @override
  State<TSprofile> createState() => _TSprofileState();
}

class _TSprofileState extends State<TSprofile> {
  StudentController studentController = Get.put(StudentController());

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 36,
      ),
      Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Container(
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              children: [
                ListTile(
                  title: Text('Email', style: TextStyle(color: Colors.grey)),
                  trailing: Text(studentController.emailcontroller.text,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                ),
                Divider(),
                ListTile(
                  title: Text('DOB', style: TextStyle(color: Colors.grey)),
                  trailing: Text(
                      DateFormat.yMd()
                          .format(studentController.selectedDate.value),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                ),
                Divider(),
                ListTile(
                  title:
                      Text('phonenumber', style: TextStyle(color: Colors.grey)),
                  trailing: Text(studentController.phonecontroller.text,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                ),
                Divider(),
                ListTile(
                  title: Text('Gender', style: TextStyle(color: Colors.grey)),
                  trailing: Text(studentController.gender.value,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                ),
              ],
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: CustomElevatedButton(
          text: 'Add to partner',
          onPressed: () {},
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Unfilledelevatedbutton(
          onPressed: () {},
          text: 'Custom Invoice',
        ),
      )
    ]);
  }
}
