import 'dart:convert';
import 'dart:io';

import 'package:follow_up/Api/base_client.dart';
import 'package:follow_up/Controller/login_controller.dart';
import 'package:follow_up/Model/packages.dart';
import 'package:follow_up/Model/status_details.dart';
import 'package:follow_up/Model/transactions.dart';
import 'package:follow_up/Model/user.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  LoginController loginController = Get.find();

  HttpBaseClient baseClient = HttpBaseClient();
  RxList<TransactionDetails> trasactionDetailsList = <TransactionDetails>[].obs;
  RxList trasactionssDetailsList = [].obs;

  set selectedtrasaction(TransactionDetails selectedtrasaction) {}

  Future<void> addTransaction({
    required int id,
    required int amount,
  }) async {
    LoginController loginController = Get.find();
    var headers = loginController.getHeaders();
    TransactionDetails? selectedtrasaction;

    var body = {
      "id": id,
      "amount": amount,
    };
    var requestBody = jsonEncode(body);
    var response = await baseClient.postRequest(
        'list-all-transactions', headers, requestBody);

    updateTransList();
  }

  void updateTransList() {
    update();
    // refresh();
  }

  @override
  void onInit() {
    updateTransList();
    super.onInit();
  }

  Future<List> TransactionListView() async {
    var loginHeader = loginController.getHeaders();
    print('object');
    var response = await baseClient.getRequest(
      'list-all-transactions',
      loginHeader,
    );
    print(response);
    print('objects');

    List responseAsList = response;
    trasactionssDetailsList.value = response;
    trasactionssDetailsList.value = trasactionssDetailsList.reversed.toList();
    print(response);
    // Convert each map in the response to your model class

    List<TransactionDetails> transactionList =
        trasactionssDetailsList.map((userData) {
      var dateString = userData['date'];
      var dateTime =
          HttpDate.parse(dateString); // Parse RFC 3339 formatted date string
      return TransactionDetails(
          t_id: userData['id'], // Ensure 'id' is treated as int
          amount:
              userData['amount'].toInt(), // Ensure 'amount' is treated as int
          date: dateTime);
    }).toList();
    return trasactionssDetailsList.value;
  }
}
