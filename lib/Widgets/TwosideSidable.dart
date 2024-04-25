// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:flutter_svg/svg.dart';

// class MySlidableWidget extends StatelessWidget {
//   final String svgImagePath1;
//   final String text1;
//   final IconData icon1;
//   final IconData icon2;
//   final VoidCallback onPressed1;
//   final VoidCallback onPressed2;

//   const MySlidableWidget({
//     Key? key,
//     required this.svgImagePath1,
//     required this.text1,
//     required this.icon1,
//     required this.icon2,
//     required this.onPressed1,
//     required this.onPressed2,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 70,
//       padding: EdgeInsets.only(top: 5),
//       child: Flexible(
//         child: Slidable(
//           startActionPane: ActionPane(motion: ScrollMotion(), children: [
//             GestureDetector(
//               onTap: onPressed1,
//               child: SlidableAction(
//                 backgroundColor: Colors.green,
//                 icon: icon1,
//                 onPressed: (BuildContext context) {},
//               ),
//             )
//           ]),
//           child: Card(
//             color: Colors.white,
//             child: ListTile(
//               leading: SvgPicture.asset(
//                 svgImagePath1,
//                 height: 30,
//               ),
//               title: Text(
//                 text1,
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//               ),
//             ),
//           ),
//           endActionPane: ActionPane(motion: ScrollMotion(), children: [
//             GestureDetector(
//               onTap: onPressed2,
//               child: SlidableAction(
//                 backgroundColor: Colors.green,
//                 icon: icon2,
//                 onPressed: (BuildContext context) {},
//               ),
//             )
//           ]),
//         ),
//       ),
//     );
//   }
// }
