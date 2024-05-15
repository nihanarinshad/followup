import 'package:flutter/material.dart';
import 'package:follow_up/Controller/student_controller.dart';
import 'package:follow_up/Widgets/ElevatedButton.dart';
import 'package:follow_up/Widgets/Unfilledelevatedbutton.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Tenantssprofile extends StatelessWidget {
  final StudentController studentController = Get.put(StudentController());

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 36,
      ),
      Padding(
        padding: const EdgeInsets.only(right: 20, left: 30),
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
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 30),
                  child: Row(
                    children: [
                      Text(
                        'Email  :  ',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      Text(
                        studentController.emailController.text,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 20),
                  child: Row(
                    children: [
                      Text('DOB :  ',
                          style: TextStyle(color: Colors.grey, fontSize: 16)),
                      Text('14-07-2003',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 20),
                  child: Row(
                    children: [
                      Text('phonenumber  : ',
                          style: TextStyle(color: Colors.grey, fontSize: 16)),
                      Text(studentController.phoneController.text,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, top: 20, bottom: 30),
                  child: Row(
                    children: [
                      Text('Gender  :  ',
                          style: TextStyle(color: Colors.grey, fontSize: 16)),
                      Text(studentController.gender.value,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomElevatedButton(
          onPressed: () {},
          text: 'Add To Partner',
        ),
      ),
      Unfilledelevatedbutton(
        onPressed: () {},
        text: 'Custom Invoice',
      )
    ]);
  }
}
