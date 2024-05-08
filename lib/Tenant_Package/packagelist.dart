import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:follow_up/Controller/package_controller.dart';

import 'package:follow_up/Tenant_Package/package_add.dart';
import 'package:follow_up/Tenant_Package/package_edit.dart';
import 'package:follow_up/Tenant_Package/tpackageview.dart';

import 'package:get/get.dart';

class PackageLists extends StatefulWidget {
  PackageLists({super.key});

  @override
  State<PackageLists> createState() => _TenantStudxentState();
}

class _TenantStudxentState extends State<PackageLists> {
  final PackageController packageController = Get.put(PackageController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 246, 241, 241),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(TenantPackagesadd())!.then((value) {
              setState(() {});
            });
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.red,
        ),
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text('Packages'),
          foregroundColor: Colors.white,
        ),
        body: FutureBuilder(
            future: packageController.PackageListView(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: packageController
                        .packageListpackageDataDetailsList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 3),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Slidable(
                            startActionPane:
                                ActionPane(motion: ScrollMotion(), children: [
                              SlidableAction(
                                backgroundColor:
                                    Color.fromARGB(255, 11, 64, 107),
                                onPressed: (context) async {
                                  packageController
                                      .packageid.value = packageController
                                          .packageListpackageDataDetailsList[
                                      index]['id'];

                                  await packageController.viewUsersss();

                                  Get.to(Tenant_packageview());
                                },
                                icon: Icons.remove_red_eye_outlined,
                              )
                            ]),
                            endActionPane:
                                ActionPane(motion: ScrollMotion(), children: [
                              SlidableAction(
                                backgroundColor: Color.fromARGB(255, 47, 2, 53),
                                onPressed: (context) async {
                                  packageController
                                      .packageid.value = packageController
                                          .packageListpackageDataDetailsList[
                                      index]['id'];

                                  await packageController.viewUsersss();

                                  Get.to(() => TenantPackagesedit());
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
                                  packageController
                                          .packageListpackageDataDetailsList[
                                      index]['package_name'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
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
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:follow_up/Controller/moderator_controller.dart';
// import 'package:follow_up/Model/moderator_details.dart';

// import 'package:follow_up/Screens/BaseScreen.dart';
// import 'package:follow_up/Tabbar_TANENT/Student_tabbar.dart';
// import 'package:follow_up/Tenant_Moderator.dart/moderatorAdd.dart';
// import 'package:follow_up/Tenant_Moderator.dart/moderator_edit.dart';

// import 'package:get/get.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// class TenantModerator extends StatelessWidget {
//   TenantModerator({super.key});

//   final ModeratorController moderatorController =
//       Get.put(ModeratorController());

//   @override
//   Widget build(BuildContext context) {
//     return BaseScreen(
//       body: Stack(children: [
//         Column(children: [
//           SizedBox(
//             height: 20,
//           ),
//           // StudentTabbar(),
//           Expanded(
//             child: ValueListenableBuilder(
//               valueListenable: ModeratorDetailsDB().box.listenable(),
//               builder: (BuildContext context, value, Widget? child) {
//                 final box = ModeratorDetailsDB().box;

//                 moderatorController.moderatorDetailsList.value =
//                     box.values.toList();

//                 moderatorController.moderatorDetailsList.value =
//                     moderatorController.moderatorDetailsList.reversed.toList();
//                 return ListView.builder(
//                   itemCount: moderatorController.moderatorDetailsList.length,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       margin: EdgeInsets.symmetric(vertical: 3),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(10.0),
//                         child: Slidable(
//                           startActionPane:
//                               ActionPane(motion: ScrollMotion(), children: [
//                             SlidableAction(
//                               backgroundColor: Color.fromARGB(255, 11, 64, 107),
//                               onPressed: (context) {},
//                               icon: Icons.remove_red_eye_outlined,
//                             )
//                           ]),
//                           endActionPane:
//                               ActionPane(motion: ScrollMotion(), children: [
//                             SlidableAction(
//                               backgroundColor: Color.fromARGB(255, 47, 2, 53),
//                               onPressed: (context) async {
//                                 moderatorController.studentid.value =
//                                     moderatorController
//                                         .moderatorDetailsList[index].m_id;

//                                 await moderatorController.viewModeratoter();

//                                 Get.to(() => TenantModeratorEdit());
//                               },
//                               icon: Icons.edit,
//                             )
//                           ]),
//                           child: Card(
//                             child: ListTile(
//                               leading: CircleAvatar(
//                                 backgroundColor: Colors.red,
//                                 radius: 25,
//                                 child: SvgPicture.asset(
//                                   'assets/people-svgrepo-com.svg',
//                                   height: 30,
//                                 ),
//                               ),
//                               title: Text(
//                                 moderatorController
//                                     .moderatorDetailsList[index].moderatorName,
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold, fontSize: 16),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ]),
//         Positioned(
//           bottom: 16.0,
//           right: 16.0,
//           child: FloatingActionButton(
//             onPressed: () {
//               Get.to(TenantModeratorAdd());
//             },
//             child: Icon(
//               Icons.add,
//               color: Colors.white,
//             ),
//             backgroundColor: Colors.red,
//           ),
//         ),
//       ]),
//       appBarText: 'Moderator',
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:follow_up/Controller/package_controller.dart';
// import 'package:follow_up/Model/packages.dart';
// import 'package:follow_up/Screens/BaseScreen.dart';
// import 'package:follow_up/Tenant_Package/package_add.dart';
// import 'package:follow_up/Tenant_Package/package_edit.dart';
// import 'package:follow_up/Tenant_Package/tpackageview.dart';

// import 'package:get/get.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// class Package extends StatefulWidget {
//   const Package({super.key});

//   @override
//   State<Package> createState() => _PackageState();
// }

// class _PackageState extends State<Package> {
//   final PackageController packageController = Get.put(PackageController());

//   List<bool> activeStatusList = List.generate(10, (index) => true);

//   bool isActive(int index) {
//     return activeStatusList[index];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BaseScreen(
//         body: Stack(
//           children: [
//             Column(children: [
//               SizedBox(
//                 height: 20,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 10, right: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text('Swipe Right to Edit >>',
//                         style: TextStyle(fontSize: 12, color: Colors.grey)),
//                     Text('<< Swipe left to view',
//                         style: TextStyle(fontSize: 12, color: Colors.grey)),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: ValueListenableBuilder(
//                     valueListenable: PackageDetailsDB().box.listenable(),
//                     builder: (BuildContext context, value, Widget? child) {
//                       final box = PackageDetailsDB().box;

//                       packageController.packageDetailsList.value =
//                           box.values.toList();

//                       packageController.packageDetailsList.value =
//                           packageController.packageDetailsList.reversed
//                               .toList();
//                       return ListView.builder(
//                         itemCount: packageController.packageDetailsList.length,
//                         itemBuilder: (context, index) {
//                           return Slidable(
//                             startActionPane:
//                                 ActionPane(motion: ScrollMotion(), children: [
//                               SlidableAction(
//                                 backgroundColor: Color.fromARGB(255, 15, 4, 69),
//                                 onPressed: (context) async {
//                                   packageController.packageid.value =
//                                       packageController
//                                           .packageDetailsList[index].p_id;

//                                   await packageController.viewUsersss();
//                                   Get.to(TenantPackagesedit());
//                                 },
//                                 icon: Icons.edit,
//                               )
//                             ]),
//                             endActionPane:
//                                 ActionPane(motion: ScrollMotion(), children: [
//                               SlidableAction(
//                                 backgroundColor: Colors.green,
//                                 onPressed: (context) async {
//                                   packageController.packageid.value =
//                                       packageController
//                                           .packageDetailsList[index].p_id;

//                                   await packageController.viewUsersss();
//                                   Get.to(Tenant_packageview());
//                                 },
//                                 icon: Icons.remove_red_eye_outlined,
//                               )
//                             ]),
//                             child: Card(
//                               color: Colors.white,
//                               child: ListTile(
//                                 title: Text(
//                                   packageController
//                                       .packageDetailsList[index].packageName,
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16),
//                                 ),
//                                 trailing: Container(
//                                   decoration: BoxDecoration(
//                                     borderRadius:
//                                         BorderRadiusDirectional.circular(30),
//                                     color: isActive(index)
//                                         ? Colors.green
//                                         : Colors.yellow,
//                                   ),
//                                   child: Center(
//                                       child: Text(isActive(index)
//                                           ? 'Active'
//                                           : 'Inactive')),
//                                   height: 20,
//                                   width: 60,
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                       );
//                     }),
//               )
//             ]),
//             Positioned(
//               bottom: 16.0,
//               right: 16.0,
//               child: FloatingActionButton(
//                 onPressed: () {
//                   Get.to(TenantPackagesadd());
//                 },
//                 child: Icon(
//                   Icons.add,
//                   color: Colors.white,
//                 ),
//                 backgroundColor: Colors.red,
//               ),
//             ),
//           ],
//         ),
//         appBarText: 'Packages');
//   }
// }
