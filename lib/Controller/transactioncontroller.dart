import 'dart:convert';

import 'package:follow_up/Api/base_client.dart';
import 'package:follow_up/Controller/login_controller.dart';
import 'package:follow_up/Model/status_details.dart';
import 'package:follow_up/Model/transactions.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  HttpBaseClient baseClient = HttpBaseClient();
  RxList<TransactionDetails> trasactionDetailsList = <TransactionDetails>[].obs;
  RxList transactionss = [].obs;

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
    final box = TransactionDetailsDB().box;

    trasactionDetailsList.value = box.values.toList();

    trasactionDetailsList.value = trasactionDetailsList.reversed.toList();

    box.values.forEach((element) {
      transactionss.add(element.amount);
      transactionss.add(element.t_id);
    });

    update();
    // refresh();
  }

  @override
  void onInit() {
    updateTransList();
    super.onInit();
  }
}
