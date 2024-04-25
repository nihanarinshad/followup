import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:follow_up/Api/base_client.dart';
import 'package:follow_up/Controller/login_controller.dart';
import 'package:follow_up/Model/user_details.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class StudentController extends GetxController {
  HttpBaseClient baseClient = HttpBaseClient();
  RxString gender = "male".obs;
  RxList<UserDetails> userDetailsList = <UserDetails>[].obs;
  RxInt studentid = 0.obs;
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();

  TextEditingController emailcontroller = TextEditingController();

  TextEditingController phonecontroller = TextEditingController();
  DateFormat dateFormat = DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'");

  Rx<DateTime> selectedDate = DateTime.now().obs;
  Future<void> addStudent(
      {required String firstname,
      required String userName,
      required String lastname,
      required String email,
      required String phone,
      required String gender,
      required DateTime dob}) async {
    RxInt values = RxInt(0);

    LoginController loginController = Get.find();
    var headers = loginController.getHeaders();

    var body = {
      "firstname": firstname,
      "lastname": lastname,
      "username": userName,
      "email": email,
      "phone": phone,
      "gender": gender,
      "dob": dob.toIso8601String(),
      "user_type": "student",
    };

    var requestBody = jsonEncode(body);
    var response =
        await baseClient.postRequest('add-user', headers, requestBody);

    updateUserList();
  }

  void updateUserList() {
    final box = UserDetailsDB().box;

    userDetailsList.value = box.values.toList();

    userDetailsList.value = userDetailsList.reversed.toList();

    update();
    // refresh();
  }

  @override
  void onInit() {
    updateUserList();
    super.onInit();
  }

  Future<void> editStudent(
      {required String firstname,
      required String lastname,
      required String email,
      required String phone,
      required String gender,
      required DateTime dob}) async {
    LoginController loginController = Get.find();
    var headers = loginController.getHeaders();

    var body = {
      "firstname": firstname,
      "lastname": lastname,
      "email": email,
      "phone": phone,
      "gender": gender,
      "dob": dob.toIso8601String(),
      "user_type": "student",
    };
    var requestBody = jsonEncode(body);
    var response = await baseClient.putRequest(
        'edit-user/${studentid.value}', headers, requestBody);
  }

  Future<void> viewUser() async {
    LoginController loginController = Get.find();
    var headers = loginController.getHeaders();

    var body = {'user_id': studentid.value};
    var requestBody = jsonEncode(body);
    var response =
        await baseClient.postRequest('view-user', headers, requestBody);

    lastname.text = response['lastname'];
    firstname.text = response['firstname'];

    emailcontroller.text = response['email'];
    phonecontroller.text = response['phone'];
    selectedDate.value = dateFormat.parse(response['dob']);
    gender.value = response['gender'];

    // gender.value = response['gender'];
  }
}
