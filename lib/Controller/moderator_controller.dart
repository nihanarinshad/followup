import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:follow_up/Api/base_client.dart';
import 'package:follow_up/Controller/login_controller.dart';
import 'package:follow_up/Model/moderator_details.dart';
import 'package:follow_up/Model/user.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ModeratorController extends GetxController {
  HttpBaseClient baseClient = HttpBaseClient();
  RxString gender = "male".obs;
  LoginController loginController = Get.find();

  RxList<ModeratorDetails> moderatorDetailsList = <ModeratorDetails>[].obs;
  RxList userDataDetailsList = [].obs;

  RxInt moderatorid = 0.obs;
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController firstcontroller = TextEditingController();
  TextEditingController lastcontroller = TextEditingController();

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  DateFormat dateFormat = DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'");

  Rx<DateTime> selectedDate = DateTime.now().obs;
  Future<void> addModerator(
      {required String userName,
      required String firstname,
      required String lastname,
      required String email,
      required String phone,
      required String gender,
      required String password,
      required DateTime dob}) async {
    LoginController loginController = Get.find();
    var headers = loginController.getHeaders();

    var body = {
      "username": userName,
      "firstname": firstname,
      "lastname": lastname,
      "email": email,
      "phone": phone,
      "password_hash": password,
      "gender": gender,
      "dob": dob.toIso8601String(),
      "user_type": "moderator",
    };
    var requestBody = jsonEncode(body);
    var response =
        await baseClient.postRequest('add-user', headers, requestBody);
    print(response);
    print(requestBody);

    updateModeratorList();
  }

  void updateModeratorList() {}

  @override
  void onInit() {
    updateModeratorList();
    super.onInit();
  }

  Future<void> editModerator(
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
      "user_type": "moderator",
    };
    var requestBody = jsonEncode(body);
    var response = await baseClient.putRequest(
        'edit-user/${moderatorid.value}', headers, requestBody);
    print('gdhgfhfhfnnnnnnnnnj');

    print(response);
    print('gdhgfhkkkkkkkkkkkkkkkkkkkfhfj');

    print(requestBody);
  }

  Future<void> viewModeratoter() async {
    LoginController loginController = Get.find();
    var headers = loginController.getHeaders();

    print('objectresponnnnnjgggggggggggggggggnnse');

    var body = {'user_id': moderatorid.value};
    var requestBody = jsonEncode(body);
    var response =
        await baseClient.postRequest('view-user', headers, requestBody);

    firstcontroller.text = response['firstname'];
    lastcontroller.text = response['lastname'];

    emailcontroller.text = response['email'];
    phonecontroller.text = response['phone'];
    selectedDate.value = dateFormat.parse(response['dob']);
    gender.value = response['gender'];
  }

  Future<List> UserListView() async {
    var loginHeader = loginController.getHeaders();
    var studentBody = {'user_type': 'moderator'};
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

    List<ModeratorDetails> moderatorDetailsList = responseAsList
        .map((userData) => ModeratorDetails(
              m_id: userData['user_id'],
              moderatorName: userData['username'],
            ))
        .toList();
    return userDataDetailsList.value;
  }
}
