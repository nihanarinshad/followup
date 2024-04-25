import 'package:flutter/material.dart';
import 'package:follow_up/Screens/Partner_Home.dart';

import 'package:follow_up/Widgets/Drawer.dart';

class Partnerr extends StatefulWidget {
  const Partnerr({super.key});

  @override
  State<Partnerr> createState() => _UserHomeState();
}

class _UserHomeState extends State<Partnerr> {
  String greeting = '';

  @override
  void initState() {
    super.initState();
    _updateGreeting();
  }

  void _updateGreeting() {
    DateTime now = DateTime.now();
    int hour = now.hour;
    if (hour >= 6 && hour < 12) {
      setState(() {
        greeting = 'Good Morning!';
      });
    } else if (hour >= 12 && hour < 18) {
      setState(() {
        greeting = 'Good Afternoon!';
      });
    } else {
      setState(() {
        greeting = 'Good Night!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        backgroundColor: Color.fromARGB(255, 252, 243, 243),
        body: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 30),
                            child: Text(
                              greeting,
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Icon(
                              Icons.sentiment_satisfied_alt,
                              color: Colors.white,
                              size: 40,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 150,
                ),
                // Container(
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(20),
                //   ),
                Card(
                  color: Colors.white,
                  child: ListTile(
                    leading: Text(
                      'Wallet',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    trailing: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 9, 20, 148),
                          Color.fromARGB(255, 16, 0, 54),
                        ], begin: Alignment.topCenter, end: Alignment.topRight),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                          child: Text(
                        '5000',
                        style: TextStyle(color: Colors.white),
                      )),
                      height: 40,
                      width: 100,
                    ),
                    // trailing: ElevatedButtonz,
                  ),
                ),
              ],
            ),
            Positioned(
                top: 80, left: 15, right: 15, child: PartnerHomeContainer()),
          ],
        ),
        endDrawer: EndDrawer(),
      ),
    );
  }
}
