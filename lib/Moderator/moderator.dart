import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:follow_up/Moderator/customerForm.dart';
import 'package:follow_up/Moderator/Status.dart';
import 'package:follow_up/Screens/Moderator.dart';
import 'package:follow_up/TenantAdmin/Status.dart';
import 'package:follow_up/Widgets/Drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ModeratorHome extends StatefulWidget {
  const ModeratorHome({super.key});

  @override
  State<ModeratorHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<ModeratorHome> {
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
        greeting = 'Good Morningmode!';
      });
    } else if (hour >= 12 && hour < 18) {
      setState(() {
        greeting = 'Good Afternoonmode!';
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
                  height: 220,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListView(
                    children: [
                      ListTile(
                        leading: Text(
                          'Commission',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        trailing: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Colors.pink,
                                  const Color.fromARGB(255, 160, 2, 55)
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.topRight),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                              child: Text(
                            '10%',
                            style: TextStyle(color: Colors.white),
                          )),
                          height: 40,
                          width: 100,
                        ),
                        // trailing: ElevatedButtonz,
                      )
                    ],
                  ),
                  height: 60,
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          10.0), // Adjust the radius as needed
                      color: Colors.white, // Set the background color
                    ),
                    // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Slidable(
                        endActionPane:
                            ActionPane(motion: ScrollMotion(), children: [
                          SlidableAction(
                            backgroundColor: Colors.green,
                            onPressed: (context) {
                              Get.to(ModeratorFormFields());
                            },
                            icon: Icons.edit,
                          )
                        ]),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadiusDirectional.circular(20)),
                          child: ListTile(
                            leading: SvgPicture.asset(
                              'assets/box-notes-svgrepo-com.svg',
                              height: 30,
                            ),
                            title: Text(
                              'Customer Form',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        10.0), // Adjust the radius as needed
                    color: Colors.white, // Set the background color
                  ),
                  // margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Slidable(
                          startActionPane:
                              ActionPane(motion: ScrollMotion(), children: [
                            SlidableAction(
                              backgroundColor: Color.fromARGB(255, 11, 64, 107),
                              onPressed: (context) {
                                Get.to(statuss());
                              },
                              icon: Icons.remove_red_eye_outlined,
                            )
                          ]),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadiusDirectional.circular(20)),
                            child: ListTile(
                              leading: SvgPicture.asset(
                                'assets/check-verified-svgrepo-com.svg',
                                height: 35,
                              ),
                              title: Text(
                                'Status',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                          ))),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
            Positioned(
                top: 80, left: 15, right: 15, child: ModeratorContainers()),
          ],
        ),
        endDrawer: EndDrawer(),
      ),
    );
  }
}
