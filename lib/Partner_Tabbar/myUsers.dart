import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:follow_up/Tenant_Student/student_Eye.dart';
import 'package:get/get.dart';

class MyUsers extends StatefulWidget {
  const MyUsers({super.key});

  @override
  State<MyUsers> createState() => _StudentState();
}

class _StudentState extends State<MyUsers> {
  final List<String> userList = [
    'User 1',
    'User 2',
    'User 3',
    'User 4',
    'User 5'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(children: [
          SizedBox(
            height: 20,
          ),
          // StudentTabbar(),
          Expanded(
            child: ListView.builder(
              itemCount: userList.length,
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
                              onPressed: (context) {},
                              icon: Icons.remove_red_eye_outlined,
                            )
                          ]),
                          endActionPane:
                              ActionPane(motion: ScrollMotion(), children: [
                            SlidableAction(
                              backgroundColor: Color.fromARGB(255, 47, 2, 53),
                              onPressed: (context) {
                                Get.to(TenantStudentEye());
                              },
                              icon: Icons.edit,
                            )
                          ]),
                          child: Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 251, 191, 191),
                                radius: 25,
                                child: SvgPicture.asset(
                                  'assets/people-svgrepo-com.svg',
                                  height: 30,
                                ),
                              ),
                              title: Text(
                                userList[index],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                          ),
                        )));
              },
            ),
          ),
        ])
      ]),
    );
  }
}
