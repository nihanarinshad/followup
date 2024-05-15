import 'dart:convert';
import 'dart:io';

import 'package:follow_up/Api/base_client.dart';
import 'package:follow_up/Controller/login_controller.dart';
import 'package:follow_up/Model/invoice.dart';
import 'package:follow_up/Model/status_details.dart';
import 'package:follow_up/Model/transactions.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class InvoiceController extends GetxController {
  HttpBaseClient baseClient = HttpBaseClient();
  LoginController loginController = Get.find();

  RxList<InvoiceDetails> invoiceDetailsList = <InvoiceDetails>[].obs;
  RxList invoicesDetailsListsss = [].obs;

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
  }

  @override
  void onInit() {
    super.onInit();
  }

  Future<List> InvoiceListView() async {
    var loginHeader = loginController.getHeaders();
    var moderatorBody = {'user_id:': invoicesDetailsListsss.value};

    var encodedInvoiceBody = jsonEncode(moderatorBody);

    var response = await baseClient.postRequest(
        'list_all_invoices', loginHeader, encodedInvoiceBody);

    List responseAsList = response;
    invoicesDetailsListsss.value = response;
    invoicesDetailsListsss.value = invoicesDetailsListsss.reversed.toList();
    print(response);
    print('response');

    return invoicesDetailsListsss.value;
  }
}
