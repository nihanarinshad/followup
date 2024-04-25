// import 'package:flutter/material.dart';

// class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
//   @override
//   Size get preferredSize => Size.fromHeight(50); // Set the preferred height

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: preferredSize.height,
//       color: const Color.fromARGB(255, 246, 241, 241),
//       padding: EdgeInsets.only(bottom: 15),
//       child: TabBar(
//         unselectedLabelColor: Colors.red,
//         indicator: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           color: Colors.red,
//         ),
//         tabs: [
//           Tab(
//             child: Container(
//               height: 50,
//               padding: EdgeInsets.only(right: 16, left: 16),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 border: Border.all(color: Colors.red, width: 1),
//               ),
//               child: Align(
//                 alignment: Alignment.center,
//                 child: Text(
//                   "All",
//                   style: TextStyle(fontSize: 15),
//                 ),
//               ),
//             ),
//           ),
//           Tab(
//             child: Container(
//               height: 50,
//               padding: EdgeInsets.only(right: 12, left: 12),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 border: Border.all(color: Colors.red, width: 1),
//               ),
//               child: Align(
//                 alignment: Alignment.center,
//                 child: Text(
//                   "Joined",
//                   style: TextStyle(fontSize: 10),
//                 ),
//               ),
//             ),
//           ),
//           Tab(
//             child: Container(
//               height: 50,
//               padding: EdgeInsets.only(right: 4, left: 4),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 border: Border.all(color: Colors.red, width: 1),
//               ),
//               child: Align(
//                 alignment: Alignment.center,
//                 child: Text(
//                   "Call Again",
//                   style: TextStyle(fontSize: 10),
//                 ),
//               ),
//             ),
//           ),
//           Tab(
//             child: Container(
//               height: 50,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 border: Border.all(color: Colors.red, width: 1),
//               ),
//               child: Align(
//                 alignment: Alignment.center,
//                 child: Text(
//                   "Pending",
//                   style: TextStyle(fontSize: 10),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class AllScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('All Screen'),
//     );
//   }
// }

// class JoinedScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Joined Screen'),
//     );
//   }
// }

// class CallAgainScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Call Again Screen'),
//     );
//   }
// }

// class PendingScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Pending Screen'),
//     );
//   }
// }

// class StudentTabbar extends StatelessWidget {
//   const StudentTabbar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 4,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Student Tabbar'),
//           bottom: CustomTabBar(),
//         ),
//         body: TabBarView(
//           children: [
//             AllScreen(),
//             JoinedScreen(),
//             CallAgainScreen(),
//             PendingScreen(),
//           ],
//         ),
//       ),
//     );
//   }
// }
