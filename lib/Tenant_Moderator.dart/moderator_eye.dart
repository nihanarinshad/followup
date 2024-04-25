import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:follow_up/Screens/BaseScreen.dart';
import 'package:follow_up/Widgets/Unfilledelevatedbutton.dart';

class Moderatoreye extends StatefulWidget {
  const Moderatoreye({super.key});

  @override
  State<Moderatoreye> createState() => _eyeState();
}

class _eyeState extends State<Moderatoreye> {
  String _textFieldValue = "";

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBarText: 'Modertor',
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'Moderator 1',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Container(
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Column(
                  children: [
                    ListTile(
                      title:
                          Text('Email', style: TextStyle(color: Colors.grey)),
                      trailing: Text('nihana@gmail.com',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('DOB', style: TextStyle(color: Colors.grey)),
                      trailing: Text('14-07-2003',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('phonenumber',
                          style: TextStyle(color: Colors.grey)),
                      trailing: Text('9048402571',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                    ),
                    Divider(),
                    ListTile(
                      title:
                          Text('Gender', style: TextStyle(color: Colors.grey)),
                      trailing: Text('female',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Swipe Right to Edit >>',
                    style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
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
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Unfilledelevatedbutton(text: 'Reset Password', onPressed: () {})
        ]),
      ),
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
                onPressed: () {
                  Navigator.pop(context);
                },
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
