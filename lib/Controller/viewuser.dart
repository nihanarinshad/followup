// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:follow_up/Api/base_client.dart';
// import 'package:follow_up/Controller/login_controller.dart';
// import 'package:follow_up/Model/history.dart';
// import 'package:follow_up/Model/loginUserDetals.dart';

// import 'package:get/get.dart';

// class LoginUserController extends GetxController {
//   HttpBaseClient baseClient = HttpBaseClient();
//   RxList<LoginUserDataDetail> loginUserDataDetail = <LoginUserDataDetail>[].obs;
//   RxList loginsid = [].obs;
//   TextEditingController id = TextEditingController();
//   TextEditingController userName = TextEditingController();
//   TextEditingController email = TextEditingController();
//   TextEditingController phone = TextEditingController();
//   TextEditingController gender = TextEditingController();
//   TextEditingController education = TextEditingController();

//   set selecteddata(LoginUserDataDetail selecteddata) {}

//   Future<void> viewLogin() async {
//     LoginController loginController = Get.find();
//     var headers = loginController.getHeaders();
//     // var body = {'id': loginsid.value};
//     // var requestBody = jsonEncode(body);
//     var response = await baseClient.postRequest('view-user', headers);
//     List responeList = response;
//     print(responeList);
//     id.text = response['id'];

//     userName.text = response['username'];
//     email.text = response['email'];
//     phone.text = response['phone'];
//     gender.text = response['gender'];
//     education.text = response['education'];
//   }
// }
