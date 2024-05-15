import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:follow_up/Controller/package_controller.dart';
import 'package:follow_up/Controller/statusController.dart';
import 'package:follow_up/Screens/floatingActionBaceScreen.dart';

import 'package:follow_up/Tenant_Package/package_add.dart';
import 'package:follow_up/Tenant_Package/package_edit.dart';
import 'package:follow_up/Tenant_Package/tpackageview.dart';
import 'package:follow_up/Widgets/ElevatedButton.dart';
import 'package:follow_up/Widgets/Textfieldwithouticononlyletters.dart';

import 'package:get/get.dart';

class statuss extends StatefulWidget {
  statuss({super.key});

  @override
  State<statuss> createState() => _statussState();
}

class _statussState extends State<statuss> {
  TextEditingController addStatus = TextEditingController();
  TextEditingController editStatus = TextEditingController();

  final StatusController statusController = Get.put(StatusController());
  final _formKey = GlobalKey<FormState>();
  bool _isStatusChecked = false;
  bool _isssStatusChecked = false;

  @override
  Widget build(BuildContext context) {
    return FloatBaseScreen(
      appBarText: 'Status',
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialog(context)!.then((value) {
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
          future: statusController.StatusListView(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: statusController.statusList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 3),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Slidable(
                          endActionPane:
                              ActionPane(motion: ScrollMotion(), children: [
                            SlidableAction(
                              backgroundColor: Color.fromARGB(255, 47, 2, 53),
                              onPressed: (context) async {
                                statusController.statusid.value =
                                    statusController.statusList[index]['id'];
                                await _showalDialogss(context);
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
                                statusController.statusList[index]
                                    ['status_name'],
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

  Future<void> _showDialog(BuildContext context) async {
    TextEditingController addStatus =
        TextEditingController(); // Declare addStatus controller
    bool buttonClicked = false;

    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Center(
                child: Text(
                  'Create Status',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 45,
                    child: TextField(
                      controller: addStatus,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                        labelText: 'Status',
                        errorText: buttonClicked && addStatus.text.isEmpty
                            ? 'Please enter a status'
                            : null,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: ListTile(
                      title: Text(
                        'Final',
                        style: TextStyle(color: Colors.grey),
                      ),
                      trailing: Checkbox(
                        value: _isStatusChecked,
                        onChanged: (value) {
                          setState(() {
                            _isStatusChecked = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
              actions: <Widget>[
                CustomElevatedButton(
                  onPressed: () async {
                    setState(() {
                      buttonClicked = true;
                    });
                    if (addStatus.text.isEmpty) {
                      return;
                    }
                    print(_isStatusChecked ? 'Yes' : '');
                    await statusController.addStatus(
                      status: addStatus.text,
                      final_status: _isStatusChecked ? 'yes' : '',
                    );
                    Navigator.of(context).pop();
                  },
                  text: 'Add',
                )
              ],
            );
          },
        );
      },
    );
  }

  Future<void> _showalDialogss(BuildContext context) async {
    bool valuesss = false;

    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                title: Center(
                  child: Text(
                    'Edit Status',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 45,
                      child: TextField(
                        controller: editStatus,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 14),
                          labelText: 'Status',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: ListTile(
                        title: Text(
                          'Final',
                          style: TextStyle(color: Colors.grey),
                        ),
                        trailing: Checkbox(
                          value: _isssStatusChecked,
                          onChanged: (value) {
                            setState(() {
                              _isssStatusChecked = value!;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
                actions: <Widget>[
                  CustomElevatedButton(
                    onPressed: () async {
                      await statusController.editStatus(
                        status: editStatus.text,
                        final_status: _isssStatusChecked ? 'yes' : '',
                      );
                      Navigator.of(context).pop();
                    },
                    text: 'Add',
                  )
                ],
              );
            },
          );
        });
  }
}
