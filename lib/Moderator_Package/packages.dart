import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:follow_up/Moderator_Package/packageAdd.dart';
import 'package:follow_up/Moderator_Package/packageEdit.dart';
import 'package:follow_up/Screens/BaseScreen.dart';
import 'package:get/get.dart';

class ModeratorPackage extends StatefulWidget {
  const ModeratorPackage({super.key});

  @override
  State<ModeratorPackage> createState() => _PackageState();
}

class _PackageState extends State<ModeratorPackage> {
  final List<String> userList = [
    'Package 1',
    'Package 2',
    'Package 3',
    'Package 4',
    'Package 5'
  ];
  List<bool> activeStatusList = List.generate(5, (index) => true);

  bool isActive(int index) {
    return activeStatusList[index];
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        body: Stack(
          children: [
            Column(
              children: [
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
                  child: ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (context, index) {
                      return Slidable(
                        startActionPane:
                            ActionPane(motion: ScrollMotion(), children: [
                          SlidableAction(
                            backgroundColor: Color.fromARGB(255, 15, 4, 69),
                            onPressed: (context) {
                              Get.to(ModeratorPackagesedit());
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
                              userList[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
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
                                  child: Text(
                                      isActive(index) ? 'Active' : 'Inactive')),
                              height: 20,
                              width: 60,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 16.0,
              right: 16.0,
              child: FloatingActionButton(
                onPressed: () {
                  Get.to(ModeratorPackagesadd());
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
