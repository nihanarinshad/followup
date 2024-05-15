import 'dart:io';

import 'package:follow_up/Api/base_client.dart';
import 'package:follow_up/Controller/login_controller.dart';

import 'package:follow_up/Model/withdrawel.dart';
import 'package:get/get.dart';

class WithdrawelController extends GetxController {
  HttpBaseClient baseClient = HttpBaseClient();
  LoginController loginController = Get.find();

  RxList<WithdrawelDetails> withdrawelDetailsList = <WithdrawelDetails>[].obs;
  RxList withdrawlist = [].obs;

  set selectedwithdrawel(WithdrawelDetails selectedwithdrawel) {}

  Future<void> addWithrawel({
    required status,
    required date,
    required userid,
    required amount,
    required w_id,
  }) async {
    LoginController loginController = Get.find();
    var headers = loginController.getHeaders();
    WithdrawelDetails? selectedwithdrawel;

    var body = {
      "id": w_id,
      "amount": amount,
      "packageName": status,
      "user_id": userid,
      "date": date,
    };
    var response =
        await baseClient.getRequest('view-withdrawal-request', headers);
  }

  @override
  void onInit() {
    super.onInit();
  }

  Future<List> WidrawelListView() async {
    var loginHeader = loginController.getHeaders();
    var response = await baseClient.getRequest(
      'view-withdrawal-request',
      loginHeader,
    );

    List responseAsList = response;
    withdrawlist.value = response;
    withdrawlist.value = withdrawlist.reversed.toList();
    // Convert each map in the response to your model class

    List<WithdrawelDetails> transactionList = withdrawlist.map((userData) {
      var dateString = userData['date'];
      var dateTime =
          HttpDate.parse(dateString); // Parse RFC 3339 formatted date string
      return WithdrawelDetails(
          user_id: userData['user_id'], // Ensure 'id' is treated as int
          amount:
              userData['amount'].toInt(), // Ensure 'amount' is treated as int
          date: dateTime,
          w_id: userData['id'],
          status: userData['status']);
    }).toList();
    return withdrawlist.value;
  }
}
