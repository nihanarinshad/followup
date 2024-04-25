import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:follow_up/Controller/package_controller.dart';
import 'package:follow_up/Model/packages.dart';
import 'package:follow_up/Screens/BaseScreen.dart';
import 'package:follow_up/Tenant_Package/package_add.dart';
import 'package:follow_up/Tenant_Package/package_edit.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Package extends StatefulWidget {
  const Package({super.key});

  @override
  State<Package> createState() => _PackageState();
}

class _PackageState extends State<Package> {
  final PackageController packageController = Get.put(PackageController());

  List<bool> activeStatusList = List.generate(10, (index) => true);

  bool isActive(int index) {
    return activeStatusList[index];
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        body: Stack(
          children: [
            Column(children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Swipe Right to Edit >>',
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                    Text('<< Swipe left to view',
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
              ),
              Expanded(
                child: ValueListenableBuilder(
                    valueListenable: PackageDetailsDB().box.listenable(),
                    builder: (BuildContext context, value, Widget? child) {
                      final box = PackageDetailsDB().box;

                      packageController.packageDetailsList.value =
                          box.values.toList();

                      packageController.packageDetailsList.value =
                          packageController.packageDetailsList.reversed
                              .toList();
                      return ListView.builder(
                        itemCount: packageController.packageDetailsList.length,
                        itemBuilder: (context, index) {
                          return Slidable(
                            startActionPane:
                                ActionPane(motion: ScrollMotion(), children: [
                              SlidableAction(
                                backgroundColor: Color.fromARGB(255, 15, 4, 69),
                                onPressed: (context) async {
                                  packageController.packageid.value =
                                      packageController
                                          .packageDetailsList[index].p_id;

                                  await packageController.viewUsersss();
                                  Get.to(TenantPackagesedit());
                                },
                                icon: Icons.edit,
                              )
                            ]),
                            endActionPane:
                                ActionPane(motion: ScrollMotion(), children: [
                              SlidableAction(
                                backgroundColor: Colors.green,
                                onPressed: (context) {},
                                icon: Icons.remove_red_eye_outlined,
                              )
                            ]),
                            child: Card(
                              color: Colors.white,
                              child: ListTile(
                                title: Text(
                                  packageController
                                      .packageDetailsList[index].packageName,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                trailing: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(30),
                                    color: isActive(index)
                                        ? Colors.green
                                        : Colors.yellow,
                                  ),
                                  child: Center(
                                      child: Text(isActive(index)
                                          ? 'Active'
                                          : 'Inactive')),
                                  height: 20,
                                  width: 60,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }),
              )
            ]),
            Positioned(
              bottom: 16.0,
              right: 16.0,
              child: FloatingActionButton(
                onPressed: () {
                  Get.to(TenantPackagesadd());
                },
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                backgroundColor: Colors.red,
              ),
            ),
          ],
        ),
        appBarText: 'Packages');
  }
}
