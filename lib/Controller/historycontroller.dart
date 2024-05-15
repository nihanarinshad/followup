import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:follow_up/Api/base_client.dart';
import 'package:follow_up/Controller/login_controller.dart';
import 'package:follow_up/Model/history.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HistoryController extends GetxController {
  HttpBaseClient baseClient = HttpBaseClient();
  LoginController loginController = Get.find();

  RxList<HistoryDetails> historyDetailsList = <HistoryDetails>[].obs;
  RxList historyid = [].obs;
  TextEditingController status_name = TextEditingController();
  TextEditingController Comments = TextEditingController();
  DateFormat dateFormat = DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'");

  set selectedhistory(HistoryDetails selectedhistory) {}
  Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<DateTime> apSelectedDate = DateTime.now().obs;

  Future<void> addHistory({
    required String Comments,
    required DateTime next_appointment_date,
    required int status_name,
  }) async {
    LoginController loginController = Get.find();
    var headers = loginController.getHeaders();
    HistoryDetails? selectedhistory;

    var body = {
      "status_id": status_name,
      "next_appointment_date": next_appointment_date,
      "comments": Comments,
    };
    print('ncmmmdmddjjjjjjjjjjkd');
    var requestBody = jsonEncode(body);
    var response = await baseClient.postRequest(
        'add-status-field-data', headers, requestBody);
  }

  void getHistoryList() {}

  void updatehistorylist() {}

  @override
  void onInit() {
    updatehistorylist();
    super.onInit();
  }

  Future<void> viewHistory() async {
    LoginController loginController = Get.find();
    var headers = loginController.getHeaders();

    var body = {'user_id': historyid.value};
    var requestBody = jsonEncode(body);

    var response = await baseClient.postRequest(
        'view-communication-history', headers, requestBody);
    print('jfjfjfjfjj');

    Comments.text = response['comments'];

    status_name.text = response['status_name'];
    apSelectedDate.value = dateFormat.parse(response['next_appointment_date']);
    selectedDate.value = dateFormat.parse(response['date']);
    print(response);
    print('response');
  }

  Future<List> viewListHistory() async {
    LoginController loginController = Get.find();
    var headers = loginController.getHeaders();

    var body = {'user_id': historyid.value};
    var requestBody = jsonEncode(body);

    var response = await baseClient.postRequest(
        'view-communication-history', headers, requestBody);
    print('jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj');
    print(historyid.length);
    List responseAsList = response;
    historyid.value = response;
    // historyid.value = historyid.reversed.toList();
    print(response);
    print('response');

    // List<HistoryDetails> invoices = historyid.map((userData) {
    //   // var dateString = userData['date'];
    //   // var dateTime =
    //   //     HttpDate.parse(dateString); // Parse RFC 3339 formatted date string
    //   return HistoryDetails(
    //       status_name: userData['status_name'],
    //       nextappoinmentdate: apSelectedDate.value =
    //           dateFormat.parse(response['next_appointment_date']),
    //       comments: userData['comments'],
    //       appoinmentdate: selectedDate.value =
    //           dateFormat.parse(response['date']),
    //       id: userData['id']);
    // }).toList();
    return historyid.value;
  }
}
