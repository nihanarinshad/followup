import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:follow_up/Model/user_details.dart';
import 'package:follow_up/Tenant_Student/student_add.dart';
import 'package:follow_up/Tenant_Student/student_edit.dart';

import 'package:follow_up/Tenant_studentjoint_tabbar/tabbarmain.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../Controller/student_controller.dart';

class TenantStudentJoined extends StatelessWidget {
  TenantStudentJoined({super.key});

  final StudentController studentController = Get.put(StudentController());

  @override
  Widget build(BuildContext context) {
    //studentController.updateUserList();
    return Stack(children: [
      Column(children: [
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: UserDetailsDB().box.listenable(),
            builder: (BuildContext context, value, Widget? child) {
              final box = UserDetailsDB().box;

              studentController.userDetailsList.value = box.values.toList();

              studentController.userDetailsList.value =
                  studentController.userDetailsList.reversed.toList();
              return ListView.builder(
                itemCount: studentController.userDetailsList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 3),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Slidable(
                        startActionPane:
                            ActionPane(motion: ScrollMotion(), children: [
                          SlidableAction(
                            backgroundColor: Color.fromARGB(255, 11, 64, 107),
                            onPressed: (context) async {
                              studentController.studentid.value =
                                  studentController
                                      .userDetailsList[index].user_id;

                              await studentController.viewUser();
                              Get.to(StudentJoinTabbareye());
                            },
                            icon: Icons.remove_red_eye_outlined,
                          )
                        ]),
                        endActionPane:
                            ActionPane(motion: ScrollMotion(), children: [
                          SlidableAction(
                            backgroundColor: Color.fromARGB(255, 47, 2, 53),
                            onPressed: (context) async {
                              studentController.studentid.value =
                                  studentController
                                      .userDetailsList[index].user_id;

                              await studentController.viewUser();

                              Get.to(() => TenantStudentEdit());
                            },
                            icon: Icons.edit,
                          )
                        ]),
                        child: Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 25,
                              child: SvgPicture.asset(
                                'assets/people-svgrepo-com.svg',
                                height: 30,
                              ),
                            ),
                            title: Text(
                              studentController.userDetailsList[index].username,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ]),
      Positioned(
        bottom: 16.0,
        right: 16.0,
        child: FloatingActionButton(
          onPressed: () {
            Get.to(TenantStudentAdd());
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.red,
        ),
      ),
    ]);
  }
}
