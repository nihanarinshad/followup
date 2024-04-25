import 'package:flutter/material.dart';

class TSpackages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 20,
      ),
      Container(
          height: 300,
          width: 330,
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
                    'Package Name',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Text(
                    'Duration : 1 Month',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(padding: EdgeInsets.only(left: 220)),
                Container(
                  height: 25,
                  width: 50,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromARGB(255, 30, 241, 37), width: 2),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white),
                  child: Text('Active'),
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
                        'Discription Text Discription',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Text Discription Text ',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Discription Text Discription',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'text',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 30, top: 30)),
                  CircleAvatar(
                    radius: 49.5,
                    backgroundColor: Colors.white,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.shopping_bag_sharp,
                          size: 80,
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
                      '1500/-',
                      style: TextStyle(color: Colors.white),
                    )),
                  )
                ],
              ),
            ]),
          ])),
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
