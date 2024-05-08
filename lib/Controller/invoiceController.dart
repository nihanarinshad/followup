import 'dart:convert';

import 'package:follow_up/Api/base_client.dart';
import 'package:follow_up/Controller/login_controller.dart';
import 'package:follow_up/Model/invoice.dart';
import 'package:follow_up/Model/status_details.dart';
import 'package:follow_up/Model/transactions.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class InvoiceController extends GetxController {
  HttpBaseClient baseClient = HttpBaseClient();
  RxList<InvoiceDetails> invoiceDetailsList = <InvoiceDetails>[].obs;
  RxList invoice = [].obs;

  set selectedinvoice(InvoiceDetails selectedinvoice) {}
  DateFormat dateFormat = DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'");

  Future<void> addInvoice({
    required packageName,
    required date,
    required userid,
    required userName,
    required amount,
    required iv_id,
  }) async {
    LoginController loginController = Get.find();
    var headers = loginController.getHeaders();
    InvoiceDetails? selectedinvoice;

    var body = {
      "id": iv_id,
      "amount": amount,
      "packageName": packageName,
      "user_id": userid,
      "date": date,
      "user_name": userName,
    };
    var requestBody = jsonEncode(body);
    var response =
        await baseClient.postRequest('list_all_invoices', headers, requestBody);

    updateIvoiceList();
  }

  void updateIvoiceList() {
    final box = InvoiceDetailsDB().box;

    invoiceDetailsList.value = box.values.toList();

    invoiceDetailsList.value = invoiceDetailsList.reversed.toList();

    box.values.forEach((element) {
      invoice.add(element.amount);
      invoice.add(element.date);
      invoice.add(element.packageName);
      invoice.add(element.userName);
      invoice.add(element.iv_id);
      invoice.add(element.userid);
    });

    update();
    // refresh();
  }

  @override
  void onInit() {
    updateIvoiceList();
    super.onInit();
  }
}
