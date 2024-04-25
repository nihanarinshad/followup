import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:follow_up/Moderator/CustomerFormAdd.dart';
import 'package:follow_up/Moderator/CustomerFormEdit.dart';
import 'package:follow_up/Screens/BaseScreen.dart';

import 'package:get/get.dart';

class ModeratorFormFields extends StatelessWidget {
  const ModeratorFormFields({Key? key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBarText: 'Form Field',
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  child: ListTile(
                    leading: Text(
                      'Field Name',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      'Type',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
              Expanded(
                child: ListView.builder(
                  itemCount: 5, // Change the itemCount as per your requirement
                  itemBuilder: (BuildContext context, int index) {
                    return Slidable(
                      startActionPane:
                          ActionPane(motion: ScrollMotion(), children: [
                        SlidableAction(
                          backgroundColor: Colors.blue,
                          onPressed: (context) {
                            Get.to(ModeratorCustomerFormEdit());
                          },
                          icon: Icons.edit_note_sharp,
                        )
                      ]),
                      child: Card(
                        color: Colors.white,
                        child: ListTile(
                          leading: Text(
                            'Field Name $index', // You can set your field name here dynamically
                            style: TextStyle(fontSize: 16),
                          ),
                          trailing: Text(
                            'Type $index', // You can set your field type here dynamically
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                      endActionPane:
                          ActionPane(motion: ScrollMotion(), children: [
                        SlidableAction(
                          backgroundColor: Colors.red,
                          onPressed: (context) {},
                          icon: Icons.delete_outline_rounded,
                        )
                      ]),
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
                Get.to(ModeratorCustomerFormAdd());
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
    );
  }
}
