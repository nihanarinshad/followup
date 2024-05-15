import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:follow_up/Controller/customerForm.dart';

import 'package:follow_up/Screens/floatingActionBaceScreen.dart';
import 'package:follow_up/TenantAdmin/CustomerFormAdd.dart';
import 'package:follow_up/TenantAdmin/CustomerFormEdit.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FormFields extends StatefulWidget {
  const FormFields({Key? key});

  @override
  State<FormFields> createState() => _FormFieldsState();
}

class _FormFieldsState extends State<FormFields> {
  CustomerFormController customerFormController =
      Get.put(CustomerFormController());

  @override
  Widget build(BuildContext context) {
    return FloatBaseScreen(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(CustomerFormAdd());
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
      ),
      appBarText: 'Form Field',
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              child: ListTile(
                leading: Text(
                  'Field Name',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                trailing: Text(
                  'Type',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Swipe Right to Edit >>',
                    style: TextStyle(fontSize: 12, color: Colors.grey)),
                Text('<< Swipe left to delete',
                    style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
          FutureBuilder(
              future: customerFormController.viewForm(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: customerFormController.custumerFormList.length,
                      itemBuilder: (context, index) {
                        return Container(
                            margin: EdgeInsets.symmetric(vertical: 3),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Slidable(
                                startActionPane: ActionPane(
                                    motion: ScrollMotion(),
                                    children: [
                                      SlidableAction(
                                        backgroundColor: Colors.blue,
                                        onPressed: (context) async {
                                          customerFormController
                                                  .studentid.value =
                                              customerFormController
                                                      .custumerFormList[index]
                                                  ['id'];

                                          await customerFormController
                                              .viewForm();
                                          Get.to(CustomerFormEdit());
                                        },
                                        icon: Icons.edit_note_sharp,
                                      )
                                    ]),
                                child: Card(
                                  color: Colors.white,
                                  child: ListTile(
                                    leading: Text(
                                      customerFormController
                                              .custumerFormList[index]
                                          ['field_name'],
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    trailing: Text(
                                      customerFormController
                                              .custumerFormList[index]
                                          ['field_type'],
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ),
                                endActionPane: ActionPane(
                                    motion: ScrollMotion(),
                                    children: [
                                      SlidableAction(
                                        backgroundColor: Colors.red,
                                        onPressed: (context) {},
                                        icon: Icons.delete_outline_rounded,
                                      )
                                    ]),
                              ),
                            ));
                      },
                    );
                  }
                }
                // Displaying LoadingSpinner to indicate waiting state
                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ],
      ),
    );
  }
}
