// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:follow_up/Model/user.dart';
// import 'package:follow_up/Tenant_Student/student_add.dart';
// import 'package:follow_up/Tenant_Student/student_edit.dart';

// import 'package:follow_up/Tenant_studentjoint_tabbar/tabbarmain.dart';
// import 'package:get/get.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// import '../Controller/student_controller.dart';

// class TenantStudentJoined extends StatelessWidget {
//   TenantStudentJoined({super.key});

//   final StudentController studentController = Get.put(StudentController());

//   @override
//   Widget build(BuildContext context) {
//     //studentController.updateUserList();
//     return Stack(children: [
//       Column(
//         children: [

//           Expanded(
//             child: ListView.builder(
//               itemCount: studentController.userDetailsList.length,
//               itemBuilder: (context, index) {
//                 return Container(
//                   margin: EdgeInsets.symmetric(vertical: 3),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(10.0),
//                     child: Slidable(
//                       startActionPane:
//                           ActionPane(motion: ScrollMotion(), children: [
//                         SlidableAction(
//                           backgroundColor: Color.fromARGB(255, 11, 64, 107),
//                           onPressed: (context) async {
//                             studentController.studentid.value =
//                                 studentController.userDetailsList[index].id;

//                             await studentController.viewUser();

//                             Get.to(StudentJoinTabbareye());
//                           },
//                           icon: Icons.remove_red_eye_outlined,
//                         )
//                       ]),
//                       endActionPane:
//                           ActionPane(motion: ScrollMotion(), children: [
//                         SlidableAction(
//                           backgroundColor: Color.fromARGB(255, 47, 2, 53),
//                           onPressed: (context) async {
//                             studentController.studentid.value =
//                                 studentController.userDetailsList[index].id;

//                             await studentController.viewUser();

//                             Get.to(() => TenantStudentEdit());
//                           },
//                           icon: Icons.edit,
//                         )
//                       ]),
//                       child: Card(
//                         child: ListTile(
//                           leading: CircleAvatar(
//                             backgroundColor: Colors.red,
//                             radius: 25,
//                             child: SvgPicture.asset(
//                               'assets/people-svgrepo-com.svg',
//                               height: 30,
//                             ),
//                           ),
//                           title: Text(
//                             studentController.userDetailsList[index].username,
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 16),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//       Positioned(
//         bottom: 16.0,
//         right: 16.0,
//         child: FloatingActionButton(
//           onPressed: () {
//             Get.to(TenantStudentAdd());
//           },
//           child: Icon(
//             Icons.add,
//             color: Colors.white,
//           ),
//           backgroundColor: Colors.red,
//         ),
//       ),
//     ]);
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:follow_up/Tenant_Student/student_Eye.dart';
import 'package:follow_up/Tenant_Student/student_add.dart';
import 'package:follow_up/Tenant_Student/student_edit.dart';

import 'package:get/get.dart';

import '../Controller/student_controller.dart';

class TenantStudentJoined extends StatefulWidget {
  TenantStudentJoined({super.key});

  @override
  State<TenantStudentJoined> createState() => _TenantStudentState();
}

class _TenantStudentState extends State<TenantStudentJoined> {
  final StudentController studentController = Get.put(StudentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 241, 241),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(TenantStudentAdd())!.then((value) {
            setState(() {});
          });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
      ),
      body: FutureBuilder(
          future: studentController.UserListView(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: studentController.userDataDetailsList.length,
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
                                    studentController.userDataDetailsList[index]
                                        ['user_id'];

                                await studentController.viewUser();

                                Get.to(TenantStudentEye());
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
                                    studentController.userDataDetailsList[index]
                                        ['user_id'];

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
                                studentController.userDataDetailsList[index]
                                    ['username'],
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
              }
            }
            // Displaying LoadingSpinner to indicate waiting state
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
