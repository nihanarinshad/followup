import 'package:flutter/material.dart';
import 'package:follow_up/LoginScreen/loader.dart';
import 'package:follow_up/LoginScreen/loginRegister.dart';
import 'package:follow_up/LoginScreen/resetPassword.dart';
import 'package:follow_up/Widgets/Unfilledelevatedbutton.dart';
import 'package:get/get.dart';

class EndDrawer extends StatefulWidget {
  const EndDrawer({super.key});

  @override
  State<EndDrawer> createState() => _EndDrawerState();
}

class _EndDrawerState extends State<EndDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide.none), // Remove bottom line
            ),
            child: Container(
                height: 160,
                decoration: BoxDecoration(color: Colors.red),
                child: Padding(
                  padding: const EdgeInsets.only(right: 30, top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Ashad",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/baby.jpg'),
                      ),
                    ],
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Menu 1',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.home, color: Colors.red),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Menu 2',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.home, color: Colors.red),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Menu 3',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.home, color: Colors.red),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginRegister()),
                    );
                  },
                  // Other properties of GestureDetector

                  child: Text(
                    'Logout',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.logout, color: Colors.red),
              ],
            ),
          ),
          Divider(),
          SizedBox(
            height: 100,
          ),
          Unfilledelevatedbutton(
            onPressed: () {
              Get.to(Resetpassword());
            },
            text: 'Reset Password',
          )
        ],
      ),
    );
  }
}
