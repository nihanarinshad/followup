import 'package:flutter/material.dart';
import 'package:follow_up/Widgets/Unfilledelevatedbutton.dart';

class BaseScreen extends StatelessWidget {
  final Widget body;
  final String appBarText;

  BaseScreen({
    Key? key,
    required this.body,
    required this.appBarText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          title: Text(
            appBarText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 246, 241, 241),
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(),
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
                        SizedBox(width: 10),
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/baby.jpg'),
                        ),
                      ],
                    ),
                  ),
                ),
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
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(width: 20),
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
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(width: 20),
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
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(width: 20),
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
                      'Logout',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(width: 20),
                    Icon(Icons.logout, color: Colors.red),
                  ],
                ),
              ),
              Divider(),
              SizedBox(height: 100),
              Unfilledelevatedbutton(
                onPressed: () {},
                text: 'Reset Password',
              ),
            ],
          ),
        ),
        body: body,
      ),
    );
  }
}
