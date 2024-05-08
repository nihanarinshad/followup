import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:follow_up/Api/base_client.dart';
import 'package:follow_up/Controller/login_controller.dart';
import 'package:follow_up/Model/user.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class StudentController extends GetxController {
  HttpBaseClient baseClient = HttpBaseClient();
  LoginController loginController = Get.find();

  RxString gender = "male".obs;
  RxList<UserDetails> userDetailsList = <UserDetails>[].obs;
  RxList userDataDetailsList = [].obs;

  RxInt studentid = 0.obs;
  TextEditingController usernameController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  DateFormat dateFormat = DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'");

  Rx<DateTime> selectedDate = DateTime.now().obs;

  Future<void> addStudent({
    required String firstname,
    required String userName,
    required String lastname,
    required String email,
    required String phone,
    required String gender,
    required DateTime dob,
  }) async {
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
    // Here you can fetch the user details from your API
    // and update the userDetailsList accordingly
  }

  @override
  void onInit() {
    updateUserList();
    super.onInit();
  }

  Future<void> editStudent({
    required String firstname,
    required String lastname,
    required String email,
    required String phone,
    required String gender,
    required DateTime dob,
  }) async {
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

    lastnameController.text = response['lastname'];
    firstnameController.text = response['firstname'];
    emailController.text = response['email'];
    phoneController.text = response['phone'];
    selectedDate.value = dateFormat.parse(response['dob']);
    gender.value = response['gender'];
  }

  Future<List> UserListView() async {
    var loginHeader = loginController.getHeaders();
    var studentBody = {'user_type': 'student'};
    var encodedStudentBody = jsonEncode(studentBody);

    var response = await baseClient.postRequest(
      'user-list',
      loginHeader,
      encodedStudentBody,
    );

    List responseAsList = response;
    userDataDetailsList.value = response;
    userDataDetailsList.value = userDataDetailsList.reversed.toList();
    print(response);
    // Convert each map in the response to your model class

    List<UserDetails> userDetailsList = responseAsList
        .map((userData) => UserDetails(
              id: userData['user_id'],
              username: userData['username'],
            ))
        .toList();
    return userDataDetailsList.value;
  }
}
