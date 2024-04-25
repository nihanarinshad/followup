import 'package:flutter/material.dart';

class history extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 30,
      ),
      Expanded(
        child: Container(
          width: 330,
          padding: EdgeInsets.only(bottom: 80),
          child: InputDecorator(
            decoration: InputDecoration(
              labelText: 'Communication History',
              labelStyle: TextStyle(color: Colors.red),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.red),
              ),
            ),
            child: ListView.builder(
                padding: EdgeInsets.only(right: 20),
                itemCount: 3,
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
                                  Text(" 00-00-0000"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("status  : ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(" pending"),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(padding: EdgeInsets.only(left: 20)),
                                  Text("Next Appointment  : ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(" 00-00-0000"),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(padding: EdgeInsets.only(left: 20)),
                                  Text("comments  : ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(padding: EdgeInsets.only(left: 20)),
                                  Text("Some comments...."),
                                ],
                              )
                            ])),
                  );
                }),
          ),
        ),
      )
    ]);
  }

  static void add(amount) {}
}
