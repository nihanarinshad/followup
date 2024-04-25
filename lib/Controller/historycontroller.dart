import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:follow_up/Api/base_client.dart';
import 'package:follow_up/Controller/login_controller.dart';
import 'package:follow_up/Model/history.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HistoryController extends GetxController {
  HttpBaseClient baseClient = HttpBaseClient();
  RxList<HistoryDetails> historyDetailsList = <HistoryDetails>[].obs;
  RxList history = [].obs;
  TextEditingController status_name = TextEditingController();
  TextEditingController Comments = TextEditingController();
  TextEditingController next_appointment_date = TextEditingController();
  DateFormat dateFormat = DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'");

  set selectedhistory(HistoryDetails selectedhistory) {}
  Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<DateTime> apSelectedDate = DateTime.now().obs;

  Future<void> addHistory({
    required Comments,
    required date,
    required next_appointment_date,
    required status_name,
  }) async {
    LoginController loginController = Get.find();
    var headers = loginController.getHeaders();
    HistoryDetails? selectedhistory;

    var body = {
      "date": date,
      "status_name": status_name,
      "next_appointment_date": next_appointment_date,
      "comments": Comments,
    };
    var requestBody = jsonEncode(body);
    var response = await baseClient.postRequest(
        'view-communication-history', headers, requestBody);

    updatehistorylist();
  }

  void getHistoryList() {
    historyDetailsList = RxList(HistoryDetailsDB().box.values.toList());
  }

  void updatehistorylist() {
    final box = HistoryDetailsDB().box;

    historyDetailsList.value = box.values.toList();

    historyDetailsList.value = historyDetailsList.reversed.toList();

    box.values.forEach((element) {
      history.add(element.status_name);
      history.add(element.comments);
      history.add(element.nextappoinmentdate);
      history.add(element.appoinmentdate);
    });

    update();
    // refresh();
  }

  @override
  void onInit() {
    updatehistorylist();
    super.onInit();
  }

  Future<void> viewHistory() async {
    LoginController loginController = Get.find();
    var headers = loginController.getHeaders();

    var body = {'user_id': history.value};
    var requestBody = jsonEncode(body);
    var response = await baseClient.postRequest(
        'view-communication-history', headers, requestBody);

    Comments.text = response['comments'];

    status_name.text = response['status_name'];
    apSelectedDate.value = dateFormat.parse(response['next_appointment_date']);
    selectedDate.value = dateFormat.parse(response['date']);
  }
}
