import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:follow_up/Api/base_client.dart';
import 'package:follow_up/Controller/login_controller.dart';
import 'package:follow_up/Model/customer_form.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CustomerFormController extends GetxController {
  HttpBaseClient baseClient = HttpBaseClient();
  RxString gender = "male".obs;
  RxList<CustomerformDetails> CustomerformDetailsList =
      <CustomerformDetails>[].obs;
  RxInt studentid = 0.obs;
  TextEditingController fieldname = TextEditingController();
  TextEditingController formname = TextEditingController();
  TextEditingController fieldType = TextEditingController();

  TextEditingController defaultvalue = TextEditingController();

  TextEditingController required = TextEditingController();
  TextEditingController include = TextEditingController();
  TextEditingController modefied = TextEditingController();

  DateFormat dateFormat = DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'");

  Rx<DateTime> selectedDate = DateTime.now().obs;
  Future<void> addForm(
      {required String fieldname,
      required String formname,
      required String fieldType,
      required String defaultvalue,
      required String required,
      required String include,
      required int modefied}) async {
    RxInt values = RxInt(0);

    LoginController loginController = Get.find();
    var headers = loginController.getHeaders();

    var body = {
      "field_name": fieldname,
      "form_name": formname,
      "field_type": fieldType,
      "default_value": defaultvalue,
      "required": required,
      "include_in_reg_form": include,
      "modified_by": modefied,
    };
    var requestBody = jsonEncode(body);
    print(
        'Request Body: $requestBody'); // Add this line to print the request body

    var response =
        await baseClient.postRequest('member-form-field', headers, requestBody);

    updateFormList();
  }

  void updateFormList() {
    final box = CustomerformDetailsDB().box;

    CustomerformDetailsList.value = box.values.toList();

    CustomerformDetailsList.value = CustomerformDetailsList.reversed.toList();

    update();
  }

  @override
  void onInit() {
    updateFormList();
    super.onInit();
  }
}
