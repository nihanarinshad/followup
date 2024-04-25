import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:follow_up/Screens/BaseScreen.dart';

class partneruser extends StatefulWidget {
  const partneruser({super.key});

  @override
  State<partneruser> createState() => _partneruserState();
}

class _partneruserState extends State<partneruser> {
  String _textFieldValue = "";

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBarText: 'User',
      body: Column(children: [
        SizedBox(
          height: 20,
        ),
        Container(
          height: 300,
          width: 330,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(28),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              ListTile(
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Join On',
                      style: TextStyle(color: Colors.red),
                    ),
                    Text(
                      '08-01-2024',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CircleAvatar(
                  radius: 50.5,
                  backgroundColor: const Color.fromARGB(255, 228, 170, 166),
                  backgroundImage: AssetImage('assets/baby.jpg'),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(children: [
                  Text(
                    'Username',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'phonenumber ',
                    style: TextStyle(color: Colors.black),
                  ),
                ]),
              ]),
              SizedBox(
                height: 80,
              ),
              Container(
                height: 30,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(15),
                    color: Colors.red),
                child: Center(
                    child: Text(
                  'view your profile',
                  style: TextStyle(color: Colors.white),
                )),
              )
            ],
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Slidable(
          startActionPane: ActionPane(motion: ScrollMotion(), children: [
            SlidableAction(
              backgroundColor: Color.fromARGB(255, 11, 64, 107),
              onPressed: (context) {
                _showDialog(context);
              },
              icon: Icons.edit,
            )
          ]),
          child: Card(
            color: Colors.white,
            child: ListTile(
              leading: SvgPicture.asset(
                'assets/settings-gear-svgrepo-com.svg',
                height: 40,
              ),
              title: Text('Commision %',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: Text("20%",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ),
        ),
      ]),
    );
  }

  Future<void> _showDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
              child: Text('Update commission',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 13,
                      fontWeight: FontWeight.bold))),
          content: TextField(
            onChanged: (value) {
              setState(() {
                _textFieldValue = value;
              });
            },
            decoration: InputDecoration(
              hintText: 'Commission',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:
                    BorderSide(color: Colors.red), // Change the color to debug
              ),
            ),
          ),
          actions: <Widget>[
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    // primary: Colors.red, // background
                    // onPrimary: Colors.yellow, // foreground
                    ),
                onPressed: () {},
                child: Text(
                  'update',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
