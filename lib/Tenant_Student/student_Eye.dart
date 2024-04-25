import 'package:flutter/material.dart';
import 'package:follow_up/Controller/historycontroller.dart';
import 'package:follow_up/Controller/statusController.dart';
import 'package:follow_up/Controller/student_controller.dart';
import 'package:follow_up/Screens/baseScreen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

class TenantStudentEye extends StatefulWidget {
  const TenantStudentEye({super.key});

  @override
  State<TenantStudentEye> createState() => _stdeyetate();
}

class _stdeyetate extends State<TenantStudentEye> {
  TextEditingController status = TextEditingController();
  TextEditingController comment = TextEditingController();
  TextEditingController appoinment = TextEditingController();
  TextEditingController date = TextEditingController();
  StudentController studentController = Get.put(StudentController());
  HistoryController historyController = Get.put(HistoryController());

  String _textFieldValue = "";

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBarText: 'Student',
      body: Column(children: [
        ListTile(
          title: Text(studentController.firstname.text,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          trailing: ElevatedButton.icon(
            icon: const Icon(Icons.settings, size: 18),
            label: Text('pending'),
            onPressed: () {
              _showAlertDialog(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.brown,
              elevation: 0,
              fixedSize: Size.fromWidth(120),
              maximumSize: Size.fromHeight(40),
              side: const BorderSide(
                width: 1.0,
                color: Colors.brown,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 36,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 10,
                        blurRadius: 4,
                        blurStyle: BlurStyle.outer,
                        offset: Offset(10, 10))
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: 460,
                      child: ListTile(
                        title:
                            Text('Email', style: TextStyle(color: Colors.grey)),
                        trailing: Text(studentController.emailcontroller.text,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12)),
                      ),
                    ),
                    Divider(),
                    Container(
                      height: 40,
                      width: 460,
                      child: ListTile(
                        title:
                            Text('DOB', style: TextStyle(color: Colors.grey)),
                        trailing: Text(
                            DateFormat.yMd()
                                .format(studentController.selectedDate.value),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12)),
                      ),
                    ),
                    Divider(),
                    Container(
                      height: 40,
                      width: 460,
                      child: ListTile(
                        title: Text('phonenumber',
                            style: TextStyle(color: Colors.grey)),
                        trailing: Text(studentController.phonecontroller.text,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12)),
                      ),
                    ),
                    Divider(),
                    Container(
                      height: 50,
                      width: 460,
                      child: ListTile(
                        title: Text('Gender',
                            style: TextStyle(color: Colors.grey)),
                        trailing: Text(studentController.gender.value,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12)),
                      ),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Expanded(
          child: Container(
            width: 330,
            child: InputDecorator(
              decoration: InputDecoration(
                labelText: 'Communication History',
                labelStyle: TextStyle(color: Colors.red),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.red, width: 1), // Set focused border color
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              ),
              child: ListView.builder(
                  padding: EdgeInsets.only(right: 20),
                  itemCount: historyController.historyDetailsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 20, left: 10, right: 5),
                      child: Container(
                          height: 100,
                          width: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 10,
                                    blurRadius: 8,
                                    blurStyle: BlurStyle.outer,
                                    offset: Offset(10, 0))
                              ]),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(padding: EdgeInsets.only(left: 20)),
                                Row(
                                  children: [
                                    Padding(padding: EdgeInsets.only(left: 20)),
                                    Text("Date  : ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      DateFormat.yMd().format(historyController
                                          .historyDetailsList[index]
                                          .appoinmentdate),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("status  : ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      historyController
                                          .historyDetailsList[index]
                                          .status_name,
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(padding: EdgeInsets.only(left: 20)),
                                    Text("Next Appointment  : ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      DateFormat.yMd().format(historyController
                                          .historyDetailsList[index]
                                          .nextappoinmentdate),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(padding: EdgeInsets.only(left: 20)),
                                    Text("comments  : ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                        historyController
                                            .historyDetailsList[index].comments,
                                        style: TextStyle(fontSize: 10)),
                                  ],
                                ),
                                // Row(
                                //   children: [
                                //     Padding(padding: EdgeInsets.only(left: 20)),
                                //     Text(
                                //       historyController.Comments.text,
                                //     )
                                //   ],
                                // )
                              ])),
                    );
                  }),
            ),
          ),
        ),
      ]),
    );
  }

  Future<void> _showAlertDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
            child: Column(
              children: [
                Text('update communication status',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.red,
                        fontWeight: FontWeight.bold)),
                Container(
                  width: 400,
                  height: 55,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, top: 10),
                    child: TextField(
                      controller: status,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.black12,
                        labelText: 'status',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        suffixIcon: Icon(Icons.arrow_drop_down),
                        suffixIconColor: Colors.red,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 400,
                  height: 80,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, top: 10),
                    child: TextField(
                      controller: comment,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.black12,
                        labelText: 'comments',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 400,
                  height: 55,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, top: 10),
                    child: TextField(
                      controller: appoinment,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.black12,
                        labelText: 'next Appointment-next week',
                        labelStyle: TextStyle(fontSize: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        suffixIcon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.red,
                        ),
                        suffixIconColor: Colors.red,
                      ),
                    ),
                  ),
                ),
                Text(
                  '//Not:custom select show below',
                  style: TextStyle(fontSize: 8),
                ),
                Container(
                  width: 400,
                  height: 55,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, top: 10),
                    child: TextField(
                      controller: date,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.black12,
                        labelText: 'appoinment',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        suffixIcon: Icon(Icons.calendar_month),
                        suffixIconColor: Colors.red,
                      ),
                    ),
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ElevatedButton(
                    onPressed: () {
                      // Save logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      fixedSize: Size.fromWidth(100),
                      maximumSize: Size.fromHeight(40),
                      side: const BorderSide(
                        width: 1.0,
                        color: Colors.red,
                      ),
                    ),
                    child: const Text('update'),
                  ),
                ]),
              ],
            ),
          ),
        );
      },
    );
  }
}
