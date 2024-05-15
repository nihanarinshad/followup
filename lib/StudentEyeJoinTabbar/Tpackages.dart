import 'package:flutter/material.dart';
import 'package:follow_up/Controller/package_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Tpackages extends StatelessWidget {
  final PackageController packageController = Get.put(PackageController());

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 15, right: 20),
        child: Container(
            height: MediaQuery.of(context).size.height *
                0.4, // Adjust the height as needed
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(28),
              color: Colors.black,
            ),
            child: Column(children: [
              ListTile(
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      packageController.PackageNamecontroller.text,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Text(
                      packageController.Durationcontroller.text,
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 25,
                    width: 50,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(255, 30, 241, 37), width: 2),
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    child: Center(
                      child: Text(
                        'Active',
                        style:
                            TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
              Column(children: [
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 130, top: 120)),
                    Column(
                      children: [
                        Text(
                          packageController.Descriptioncontroller.text,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 30, top: 20)),
                    CircleAvatar(
                      radius: 35.5,
                      backgroundColor: Colors.white,
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.shopping_bag_sharp,
                            size: 50,
                            color: Colors.yellow,
                          )),
                    ),
                    Padding(padding: EdgeInsets.only(left: 60, top: 10)),
                    Container(
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(15),
                          color: Colors.red),
                      child: Center(
                          child: Text(
                        packageController.Amountcontroller.text,
                        style: TextStyle(color: Colors.white),
                      )),
                    )
                  ],
                ),
              ]),
            ])),
      ),
      
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(left: 10, top: 25)),
          Text(
            'Previous Packages',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
          ),
        ],
      ),
      Expanded(
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            // print(data);
            // final todo = data.elementAt(index);
            return SingleChildScrollView(
                child: Card(
              color: Colors.white,
              child: ListTile(
                title: Text('Package 1'),
                trailing: Column(
                  children: [
                    Text('Closed on'),
                    Text('02-02-2024'),
                  ],
                ),
              ),
            ));
          },
        ),
      ),
    ]);
  }
}
