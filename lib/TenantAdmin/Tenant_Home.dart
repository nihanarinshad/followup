import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:follow_up/Screens/tenantHome.dart';
import 'package:follow_up/TenantAdmin/tenantCustomerForm.dart';
import 'package:follow_up/TenantAdmin/Status.dart';
import 'package:follow_up/Widgets/Drawer.dart';
import 'package:get/get.dart';

class TenantHome extends StatefulWidget {
  const TenantHome({Key? key}) : super(key: key);

  @override
  State<TenantHome> createState() => _TenantHomeState();
}

class _TenantHomeState extends State<TenantHome> {
  String greeting = '';

  @override
  void initState() {
    super.initState();
    _updateGreeting();
  }

  void _updateGreeting() {
    DateTime now = DateTime.now();
    int hour = now.hour;
    if (hour >= 0 && hour < 12) {
      setState(() {
        greeting = 'Good Morning!';
      });
    } else if (hour >= 12 && hour < 16) {
      setState(() {
        greeting = 'Good Afternoon!';
      });
    } else if (hour >= 16 && hour < 19) {
      setState(() {
        greeting = 'Good Evening!';
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
                SizedBox(height: 340),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Swipe Right to Edit >>',
                          style: TextStyle(fontSize: 12, color: Colors.grey)),
                      Text('<< Swipe left to view',
                          style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
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
                              Get.to(FormFields());
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
                                // Get.to(statuss());
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
              ],
            ),
            Positioned(
                top: 80,
                left: 15,
                right: 15,
                bottom: 200,
                child: TenantHomeContainers()),
          ],
        ),
        endDrawer: EndDrawer(),
      ),
    );
  }
}






// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:follow_up/Screens/tenantHome.dart';
// import 'package:follow_up/TenantAdmin/CustomerForm.dart';
// import 'package:follow_up/TenantAdmin/Status.dart';
// import 'package:follow_up/Widgets/Drawer.dart';
// import 'package:get/get.dart';

// class TenantHome extends StatefulWidget {
//   const TenantHome({Key? key}) : super(key: key);

//   @override
//   State<TenantHome> createState() => _TenantHomeState();
// }

// class _TenantHomeState extends State<TenantHome> {
//   String greeting = '';

//   @override
//   void initState() {
//     super.initState();
//     _updateGreeting();
//   }

//   void _updateGreeting() {
//     DateTime now = DateTime.now();
//     int hour = now.hour;
//     if (hour >= 0 && hour < 12) {
//       setState(() {
//         greeting = 'Good Morning!';
//       });
//     } else if (hour >= 12 && hour < 16) {
//       setState(() {
//         greeting = 'Good Afternoon!';
//       });
//     } else if (hour >= 16 && hour < 19) {
//       setState(() {
//         greeting = 'Good Evening!';
//       });
//     } else {
//       setState(() {
//         greeting = 'Good Night!';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           backgroundColor: Colors.red,
//           foregroundColor: Colors.white,
//           elevation: 0,
//         ),
//         backgroundColor: Color.fromARGB(255, 252, 243, 243),
//         body: Stack(
//           children: <Widget>[
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: <Widget>[
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: 150,
//                   decoration: BoxDecoration(
//                     color: Colors.red,
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(20),
//                       bottomRight: Radius.circular(20),
//                     ),
//                   ),
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 20, top: 30),
//                             child: Text(
//                               greeting,
//                               style:
//                                   TextStyle(fontSize: 25, color: Colors.white),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 30),
//                             child: Icon(
//                               Icons.sentiment_satisfied_alt,
//                               color: Colors.white,
//                               size: 40,
//                             ),
//                           )
//                         ],
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Positioned(child: TenantHomeContainers()),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(
//                                 10.0), // Adjust the radius as needed
//                             color: Colors.white, // Set the background color
//                           ),
//                           // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(10.0),
//                             child: Slidable(
//                               endActionPane:
//                                   ActionPane(motion: ScrollMotion(), children: [
//                                 SlidableAction(
//                                   backgroundColor: Colors.green,
//                                   onPressed: (context) {
//                                     Get.to(FormFields());
//                                   },
//                                   icon: Icons.edit,
//                                 )
//                               ]),
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius:
//                                         BorderRadiusDirectional.circular(22)),
//                                 child: ListTile(
//                                   leading: SvgPicture.asset(
//                                     'assets/box-notes-svgrepo-com.svg',
//                                     height: 30,
//                                   ),
//                                   title: Text(
//                                     'Customer Form',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 16),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           )),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(
//                               10.0), // Adjust the radius as needed
//                           color: Colors.white, // Set the background color
//                         ),
//                         // margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
//                         child: ClipRRect(
//                             borderRadius: BorderRadius.circular(10.0),
//                             child: Slidable(
//                                 startActionPane: ActionPane(
//                                     motion: ScrollMotion(),
//                                     children: [
//                                       SlidableAction(
//                                         backgroundColor:
//                                             Color.fromARGB(255, 11, 64, 107),
//                                         onPressed: (context) {
//                                           // Get.to(statuss());
//                                           Get.to(statuss());
//                                         },
//                                         icon: Icons.remove_red_eye_outlined,
//                                       )
//                                     ]),
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius:
//                                           BorderRadiusDirectional.circular(20)),
//                                   child: ListTile(
//                                     leading: SvgPicture.asset(
//                                       'assets/check-verified-svgrepo-com.svg',
//                                       height: 35,
//                                     ),
//                                     title: Text(
//                                       'Status',
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 16),
//                                     ),
//                                   ),
//                                 ))),
//                       ),
//                     ],
//                   ),
//                 ),
//                 // SizedBox(height: 340),
//               ],
//             ),
//           ],
//         ),
//         endDrawer: EndDrawer(),
//       ),
//     );
//   }
// }
