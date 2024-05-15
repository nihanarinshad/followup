import 'package:flutter/material.dart';
import 'package:follow_up/Controller/historycontroller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Thistory extends StatelessWidget {
  HistoryController historyController = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 30,
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
            child: FutureBuilder(
                future: historyController.viewListHistory(),
                builder: (context, snapshot) {
                  return ListView.builder(
                      padding: EdgeInsets.only(right: 20),
                      itemCount: historyController.historyid.length,
                      itemBuilder: (BuildContext context, int index) {
                        // print(';;;;;;;;;;;;;;p-');
                        // print(historyController.historyid[0]
                        //     ['communication_history']['comments']);
                        // print(historyController.historyid[0]
                        //     ['communication_history']['status_name']);
                        // print(historyController.historyid[index]
                        //     ['communication_history']['date']);
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
                                        Padding(
                                            padding: EdgeInsets.only(left: 20)),
                                        Text("Date  : ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        Text(
                                            // DateFormat.yMd().format(historyController
                                            //     .historyid[index]
                                            //     .appoinmentdate),
                                            historyController.historyid[0]
                                                    ['communication_history']
                                                ['date']),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(left: 10)),
                                        Text("status  : ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        Text(
                                          historyController.historyid[0]
                                                  ['communication_history']
                                              ['status_name'],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(left: 10)),
                                        Text("Next Appointment  : ",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            )),
                                        Text(
                                          // DateFormat.yMd().format(historyController
                                          //     .historyid[0]
                                          //     .nextappoinmentdate),
                                          historyController.historyid[0]
                                                  ['communication_history']
                                              ['next_appointment_date'],
                                          style: TextStyle(fontSize: 8),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(left: 20)),
                                        Text("comments  : ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        Text(
                                            // historyController
                                            //     .historyid[0].comments,
                                            historyController.historyid[0]
                                                    ['communication_history']
                                                ['comments'],
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
                                  ]),
                            ));
                      });
                }),
          ),
        ),
      ),
    ]);
  }

  static void add(amount) {}
}
