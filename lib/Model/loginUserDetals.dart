// import 'package:follow_up/Shared/constants.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// part 'loginUserDetals.g.dart';

// @HiveType(typeId: 16)
// class LoginUserDataDetail {
//   @HiveField(0)
//   final double commission;

//   @HiveField(1)
//   final DateTime dob;

//   @HiveField(2)
//   final String email;

//   @HiveField(3)
//   final String firstname;

//   @HiveField(4)
//   final String gender;

//   @HiveField(5)
//   final int id;

//   @HiveField(6)
//   final String lastname;

//   @HiveField(9)
//   final int package_id;

//   @HiveField(10)
//   final int phone;

//   @HiveField(11)
//   final String tenant_name;

//   @HiveField(12)
//   final String user_type;

//   @HiveField(13)
//   final String username;

//   @HiveField(14)
//   final double wallet;

//   LoginUserDataDetail({
//     required this.commission,
//     required this.dob,
//     required this.email,
//     required this.firstname,
//     required this.gender,
//     required this.id,
//     required this.lastname,
//     required this.package_id,
//     required this.phone,
//     required this.tenant_name,
//     required this.user_type,
//     required this.username,
//     required this.wallet,
//   });
// }

// // class LoginUserDataDetailDB {
// //   static final LoginUserDataDetailDB _singleton =
// //       LoginUserDataDetailDB._internal();
// //   late Box<LoginUserDataDetail> box;
// //   factory LoginUserDataDetailDB() {
// //     return _singleton;
// //   }

// //   init() async {
// //     box = await Hive.openBox<LoginUserDataDetail>(LoginUSERDETAIL);
// //   }

// //   close() async {
// //     await box.close();
// //     init();
// //   }

// //   LoginUserDataDetailDB._internal();
// // }
