import 'dart:async';

import 'package:flutter/material.dart';
import 'package:follow_up/Controller/login_controller.dart';
import 'package:follow_up/Data/fetchdata.dart';
import 'package:follow_up/LoginScreen/loginRegister.dart';
import 'package:follow_up/Model/customer_form.dart';
import 'package:follow_up/Model/history.dart';
import 'package:follow_up/Model/invoice.dart';
import 'package:follow_up/Model/loginUserDetals.dart';
import 'package:follow_up/Model/login_details.dart';
import 'package:follow_up/Model/moderator_details.dart';
import 'package:follow_up/Model/packages.dart';
import 'package:follow_up/Model/status_details.dart';
import 'package:follow_up/Model/transactions.dart';
import 'package:follow_up/Model/user.dart';
import 'package:follow_up/Model/withdrawel.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(LoginDetailsAdapter());

  await LoginDetailsDB().init();

  LoginController loginController = Get.put(LoginController());
  FetchData fetchData = Get.put(FetchData());

  // Timer.periodic(Duration(seconds: 1), (timer) async {
  //   if (loginController.isLoggedIn == true) {
  //     await fetchData.fetchData();
  //   }
  // });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: LoginRegister()),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:follow_up/Moderator/Moderator.dart';
// import 'package:follow_up/PARTNER/Partner.dart';
// import 'package:follow_up/TenantAdmin/Tenant_Home.dart';
// import 'package:follow_up/USER/UserHome.dart';
// import 'package:get/get.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SafeArea(child: TenantHome()),
//     );
//   }
// }
