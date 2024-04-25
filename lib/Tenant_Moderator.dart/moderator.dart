import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:follow_up/Controller/moderator_controller.dart';
import 'package:follow_up/Model/moderator_details.dart';

import 'package:follow_up/Screens/BaseScreen.dart';
import 'package:follow_up/Tabbar_TANENT/Student_tabbar.dart';
import 'package:follow_up/Tenant_Moderator.dart/moderatorAdd.dart';
import 'package:follow_up/Tenant_Moderator.dart/moderator_edit.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TenantModerator extends StatelessWidget {
  TenantModerator({super.key});

  final ModeratorController moderatorController =
      Get.put(ModeratorController());

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: Stack(children: [
        Column(children: [
          SizedBox(
            height: 20,
          ),
          // StudentTabbar(),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: ModeratorDetailsDB().box.listenable(),
              builder: (BuildContext context, value, Widget? child) {
                final box = ModeratorDetailsDB().box;

                moderatorController.moderatorDetailsList.value =
                    box.values.toList();

                moderatorController.moderatorDetailsList.value =
                    moderatorController.moderatorDetailsList.reversed.toList();
                return ListView.builder(
                  itemCount: moderatorController.moderatorDetailsList.length,
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
                              onPressed: (context) async {
                                moderatorController.studentid.value =
                                    moderatorController
                                        .moderatorDetailsList[index].m_id;

                                await moderatorController.viewModeratoter();

                                Get.to(() => TenantModeratorEdit());
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
                                moderatorController
                                    .moderatorDetailsList[index].moderatorName,
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
              Get.to(TenantModeratorAdd());
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            backgroundColor: Colors.red,
          ),
        ),
      ]),
      appBarText: 'Moderator',
    );
  }
}
